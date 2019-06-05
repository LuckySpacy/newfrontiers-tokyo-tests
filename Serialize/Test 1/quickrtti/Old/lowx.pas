unit lowX;
//{$MODE DELPHI}
interface
uses classes,sysutils; 

function GetTagProperty(searchstring,tagname,propertyname:String):String;
function GetTagData (searchstring,tagname:String):String;
function GetTagString (searchstring,tagname:STRING):String;
function GetTagList (searchstring,tagname:String):TStringlist; {list of tagdata}
function GetTagListProperty (List:TStringlist;tag,propertyname:String):TStringlist;
function GetStringFromListWhereProperty (List:TStringlist;tag,propertyname,value:String):String;

function RemoveTagListFromText (executionSource:String;objhold:TStringlist):String;


function GetTermTagString (searchstring,tagname:String):String;
function GetTermTagList (searchstring,tagname:STRING):TStringlist; {list of tagdata}
function GetTermTagListProperty (List:TStringlist;tag,propertyname:String):TStringlist;
function GetTermTagProperty(searchstring,tagname,propertyname:String):String;
function ReplaceString (mainstring,findstring,replacewith:String):String;

implementation

function ReplaceString (mainstring,findstring,replacewith:String):String;
var fstart,fend,flen,mainlen:integer;preseg,postseg,holdresult:String;
begin
holdresult:=mainstring;
if findstring<>'' then
begin
fstart:= pos(findstring,mainstring);
flen:=length(findstring);
fend:= fstart + flen -1;
preseg:='';
postseg:='';
mainlen:=length(mainstring);
if fstart<>0 then
 begin
    if fstart>1 then preseg:=copy(mainstring,1,fstart-1);
    if fend<mainlen then postseg:=copy(mainstring,fend+1,mainlen-fend);
    holdresult:= preseg + replacewith + postseg;
 end;
 end;
replacestring:=holdresult;
end;


function GetStringFromListWhereProperty (List:TStringlist;tag,propertyname,value:String):String;
var mlist:TStringlist;hold:String;i:integer;
begin
{Return }
hold:=list.text;
mlist:=GetTagList(hold,tag);
result:='';
for i:= 0 to mlist.count-1 do
  begin
   if GetTagProperty(Mlist[i],tag,propertyname)=value then result:=result+mlist[i];
  end;
end;

function RemoveTagListFromText (executionSource:String;objhold:TStringlist):String;
var i,maxl:integer; hold,pulltext,puttext,wc:String;
begin
 hold:=executionsource;
 maxl:=objhold.count-1;
 for i:= 0 to maxl do
   begin
     	pulltext:=objhold[i];	
	hold:=ReplaceString(hold,pulltext,'');
   end;
result:=hold;
end;

function GetTermTagListProperty (List:TStringlist;tag,propertyname:String):TStringlist;
var i,max:integer;
begin
 result:=tstringlist.create;
 max:=List.count-1;
 for i:= 0 to max do
   begin
     result.add (GetTermTagProperty (List[i],tag,propertyname));
   end;
end;

function GetTagListProperty (List:TStringlist;tag,propertyname:String):TStringlist;
var i,max:integer;
begin
 result:=tstringlist.create;
 max:=List.count-1;
 for i:= 0 to max do
   begin
     result.add (GetTagProperty (List[i],tag,propertyname));
   end;
end;

function GetTermTagString (searchstring,tagname:STRING):String;
var bpos,epos,slen,i,mlen:integer;hold:String;
begin
{Gets the text of a terminated Tag <TAG />}
hold:=searchstring;
mlen:=length(hold);
bpos:=pos('<'+tagname,searchstring);
epos:=-1;
hold:=copy(hold,bpos,mlen-bpos);
epos:=pos('/>',hold);
result:='';
if epos<>0 then result:=copy(hold,1,epos+1);
end;

function GetTagString (searchstring,tagname:STRING):String;
var bpos,epos,slen,i,mlen:integer;hold:String;
begin
{Gets the text of a terminated Tag <TAG />}
hold:=searchstring;
mlen:=length(hold);
bpos:=pos('<'+tagname+' ', searchstring);
epos:=-1;
//hold:=copy(hold,bpos,mlen-bpos+1);
epos:=pos('</'+ tagname+'>',hold);
result:='';
if epos<>0 then result:=copy(hold,bpos,epos-bpos+3+length(tagname));
end;


function GetTagList (searchstring,tagname:STRING):TStringlist; {list of tagdata}
var hold,tagtext:String; found:boolean;
    seg,tag,ltag,etag,holddata:String;  gpos, epos ,llen,spos,tlen:integer;
begin
result:=tstringlist.create;

hold:=searchstring;
llen:=length(hold);
tlen:=length(tagname);

 while pos('<'+tagname,hold)<>0 do
   begin
        epos:=pos('</'+tagname+'>',hold);
        spos:=pos('<'+tagname,hold);
        tagtext:=copy(hold,spos,( epos-spos)+tlen+3);
       // gpos:=pos('>',tagtext);
       // tagtext:=copy(tagtext,gpos+1,epos-spos-gpos);
	//tagtext:=GetTagString(hold,tagname);
 	if tagtext<>'' then result.add (tagtext);
	//hold:=Replacestring(hold,tagtext,'');
        delete(hold,spos,epos-spos+tlen+3);
   end;

end;

function GetTermTagList (searchstring,tagname:STRING):TStringlist; {list of tagdata}
var hold,tagtext:String;
begin
result:=tstringlist.create;
hold:=searchstring;
 while pos('<'+tagname,hold)<>0 do
   begin
	tagtext:=GetTermTagString(hold,tagname);
 	if tagtext<>'' then result.add (tagtext);
	hold:=Replacestring(hold,tagtext,'');	
   end;
end;

function TagEnd (searchstring,tagname:String):integer;
var startpos,endpos,iter:integer;hold:String;inquote:boolean;
begin
startpos:=pos('<'+tagname,searchstring);
endpos:=0;
iter:=startpos;
inquote:=false;
while endpos=0 do
 begin
   hold:=hold+searchstring[iter];
   inc(iter);
   if searchstring[iter]='"' then inquote:=not(inquote) ;
   if (not(inquote) and (searchstring[iter]='>')  ) then endpos:=iter;
 end;
result:=endpos;
end;

function GetTagProperty(searchstring,tagname,propertyname:String):String;
var propdata,tagdata:String;spos,epos,ppos,plen,qpos:integer;
begin
 spos:=pos('<'+tagname,searchstring);
propdata:='';
 epos:=TagEnd(searchstring,tagname);
//writeln ('Start:'+inttostr(spos)+' END:'+inttostr(epos));
 tagdata:= Copy(searchstring,1,epos);
//writeln ('TAGDATA:'+tagdata);
 ppos:=pos( Uppercase(propertyname)+'=',Uppercase(tagdata));
 if ppos<>0 then
 begin
   plen:=ppos+length(propertyname)+1;
   propdata:=copy(tagdata,plen+1,length(tagdata)-plen-1);
  //writeln('PROPDATA:'+propdata);
   qpos:=pos('"',propdata);
   propdata:=copy(propdata,1,qpos-1);
 end;
 result:=propdata;
end;
 

function GetTermTagProperty(searchstring,tagname,propertyname:String):String;
var propdata,tagdata:String;spos,epos,ppos,plen,qpos:integer;
begin
 //writeln(searchstring);
 propdata:='';
 spos:=pos('<'+tagname,searchstring);
 epos:=TagEnd(searchstring,tagname);
//writeln ('Start:'+inttostr(spos)+' END:'+inttostr(epos));
 tagdata:= Copy(searchstring,1,epos);
//writeln ('TAGDATA:'+tagdata);

 ppos:=pos( Uppercase(propertyname)+'=',Uppercase(tagdata));
 if ppos<>0 then
 begin
   plen:=ppos+length(propertyname)+1;
   propdata:=copy(tagdata,plen+1,length(tagdata)-plen-1);
  //writeln('PROPDATA:'+propdata);
   qpos:=pos('"',propdata);
   propdata:=copy(propdata,1,qpos-1);
 end;
 result:=propdata;
end;

function GetTagData (searchstring,tagname:String):String;
var bpos,epos,slen,i,mlen:integer;hold,hdata:String;
begin
{Gets the text of a terminated Tag <TAG />}
 
bpos:=pos('<'+tagname, searchstring);
epos:=pos('</'+ tagname+'>',searchstring);
result:='';

if epos<>0 then
  begin
  hdata:=copy(searchstring,bpos,epos-bpos);
  i:=pos('>',hdata);
  hdata:=copy(hdata,i+1,epos-bpos-i);
  result:=hdata;
  end;
end;

end.
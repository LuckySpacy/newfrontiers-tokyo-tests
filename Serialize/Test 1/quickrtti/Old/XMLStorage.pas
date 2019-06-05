unit XMLStorage;

interface
Uses classes,RTTIstorage,quickRTTI,lowx,sysutils;

{
 Gotta build a storage mechanism.. I'll do
 an INTERBASE/SQL one as well.
 }
type




TOnNeedObject = procedure (Sender:TObject;Classname:String;var Obj:TPersistent) of object;
TOnFreeObject = procedure (Sender:TObject;Obj:TPersistent) of object;

TXMLStorage = class(TPersistentStorage)
private
  fOnNeedObject:TONneedObject;
  fOnFreeObject:TOnFreeObject;
  fname,fclassname:String;
public
  {for use by transactional back-ends}
  procedure Prepare;override;
  procedure BeginTransaction;override;
  procedure Commit;override;
  procedure RollBack;override;
  {These are mainly for use by the ObjectSets}
  function  FindObjectIDs (Where:String;var ObjectIDList:TStrings):integer;override;
  function  GetObjects    (Where:String;var ObjectList:TList):integer;override;
published
  property  Filename:String read fname write fname;
  property  StoredClassName:String read fclassname write fclassname;
  property  OnNeedObject:TOnNeedObject read fOnNeedObject write fOnneedObject;
  property  OnFreeObject:TOnFreeObject read fOnFreeObject write fOnFreeObject;
  function  AttachToObject (ObjectID:String):TPersistent;override;
  procedure DetachObject (Obj:TPersistent);override;
  procedure StoreObject (ObjectID:String;Obj:TPersistent);override;
  procedure DeleteObject (ObjectID:String);override;
  function  CreateObjectID :String;override;
end;


PGUID = ^TGUID;
  TGUID = record
    D1: LongWord;
    D2: Word;
    D3: Word;
    D4: array[0..7] of Byte;
  end;
  TCLSID = TGUID;
  EOleError = class(Exception);
 EOleSysError = class(EOleError)
  private
    FErrorCode: HRESULT;
  public
    constructor Create(const Message: string; ErrorCode: HRESULT;
      HelpContext: Integer);
    property ErrorCode: HRESULT read FErrorCode write FErrorCode;
  end;


{$EXTERNALSYM CoCreateGuid}
function CoCreateGuid(var guid: TGUID): HResult; stdcall;
{$EXTERNALSYM CoTaskMemFree}
procedure CoTaskMemFree(pv: Pointer); stdcall;
{$EXTERNALSYM StringFromCLSID}
function StringFromCLSID(const clsid: TCLSID; out psz: PWideChar): HResult; stdcall;




implementation



procedure TXMLStorage.Prepare;
begin
{}
end;

procedure TXMLStorage.BeginTransaction;
begin
{}
end;

procedure TXMLStorage.Commit;
begin
{}
end;

procedure TXMLStorage.RollBack;
begin
{}
end;

function  TXMLStorage.FindObjectIDs (Where:String;var ObjectIDList:TStrings):integer;
begin
{}
end;

function  TXMLStorage.GetObjects    (Where:String;var ObjectList:TList):integer;
begin
{}
end;

procedure TXMLStorage.DetachObject (Obj:TPersistent);
begin
  if assigned(fOnfreeObject) then
   begin
     fOnFreeObject(self,Obj);
   end;
end;

function  TXMLStorage.AttachToObject (ObjectID:String):TPersistent;
var Q:TQuickRTTI;f,list:TStringlist; itm,data:String;
begin
{open file, populate.}

 f:=tstringlist.create;
if fileexists(fname) then
 begin
 f.loadfromfile(fname);
 data:=f.text;
 f.free;

 list:=getTagList(data,fclassname);
 itm:= GetStringFromListWhereProperty(list,fclassname,'ID',ObjectID);
 if itm<>'' then
 begin
 q:=tQuickRTTI.create;
 q.TagName := fclassname;

 if assigned(fOnNeedObject) then
   begin
     fOnNeedObject(self,fclassname,result);
   end;

 q.RTTIObject := result;
 q.XML := itm;
 q.free;
 list.clear;
 list.free;
 end else
  if assigned(fOnNeedObject) then
   begin
     fOnNeedObject(self,fclassname,result);
   end;
 end else
  if assigned(fOnNeedObject) then
   begin
     fOnNeedObject(self,fclassname,result);
   end;

end;

procedure TXMLStorage.StoreObject (ObjectID:String;Obj:TPersistent);
var Q:TQuickRTTI;f,list,holditm:TStringlist; itm,data,hold:String;
begin
{open file, populate.}

 f:=tstringlist.create;
 if fileexists(fname) then
 begin
 f.loadfromfile(fname);
 data:=f.text;
 f.free;

 list:=getTagList(data,fclassname);
 itm:= GetStringFromListWhereProperty(list,fclassname,'ID',ObjectID);
 holditm:=tstringlist.create;
 holditm.add(itm);
 hold:=RemoveTagListFromTExt(list.text,holditm);
 holditm.free;
 end;
 q:=tQuickRTTI.create;
 q.TagName := fclassname;
 q.ObjectID :=ObjectID;
 q.RTTIObject := Obj;
 itm:=q.xml;
 q.free;
 list:=tstringlist.create;
 list.text :=hold;
 list.add (itm);
 list.savetofile(fname);
 list.clear;
 list.free;
end;

procedure TXMLStorage.DeleteObject (ObjectID:String);
var Q:TQuickRTTI;f,list,holditm:TStringlist; itm,data,hold:String;
begin
{open file, populate.}

 f:=tstringlist.create;
 if fileexists(fname) then
 begin
 f.loadfromfile(fname);
 data:=f.text;
 f.free;          
 list:=getTagList(data,fclassname);
 itm:= GetStringFromListWhereProperty(list,fclassname,'ID',ObjectID);
 holditm:=tstringlist.create;
 holditm.add(itm);
 hold:=RemoveTagListFromTExt(list.text,holditm);
 holditm.free;
 end;
 list:=tstringlist.create;
 list.text :=hold;
 list.savetofile(fname);
 list.clear;
 list.free;
end;


const
  ole32    = 'ole32.dll';
  oleaut32 = 'oleaut32.dll';
function CoCreateGuid;                  external ole32 name 'CoCreateGuid';
function StringFromCLSID;               external ole32 name 'StringFromCLSID';
procedure CoTaskMemFree;                external ole32 name 'CoTaskMemFree';

function Succeeded(Res: HResult): Boolean;
begin
  Result := Res and $80000000 = 0;
end;

procedure OleError(ErrorCode: HResult);
begin
  raise EOleSysError.Create('', ErrorCode, 0);
end;

procedure OleCheck(Result: HResult);
begin
  if not Succeeded(Result) then OleError(Result);
end;

{ EOleSysError }
const
SOleError = 'OLE error %.8x';

constructor EOleSysError.Create(const Message: string;
  ErrorCode: HRESULT; HelpContext: Integer);
var
  S: string;
begin
  S := Message;
  if S = '' then
  begin
    S := SysErrorMessage(ErrorCode);
    if S = '' then FmtStr(S, SOleError, [ErrorCode]);
  end;
  inherited CreateHelp(S, HelpContext);
  FErrorCode := ErrorCode;
end;


function GUIDToString(const ClassID: TGUID): string;
var
  P: PWideChar;
begin
  OleCheck(StringFromCLSID(ClassID, P));
  Result := P;
  CoTaskMemFree(P);
end;

function TXMLStorage.CreateObjectID :String;
var newGUID:TGUID;
begin
{}
CoCreateGuid(newGuid);
result:= GUidTostring(newGUID);
end;



end.

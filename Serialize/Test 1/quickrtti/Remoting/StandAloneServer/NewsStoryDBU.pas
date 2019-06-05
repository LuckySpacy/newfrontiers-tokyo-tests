unit NewsStoryDBU;

interface
uses Classes,sysutils,QuickRTTI,QRemote,IBDatabase,IBSQL,guids;

type

TDBNewsStory =class(TQRemoteObject)
  private
   fdb:TIBDatabase; ftran:TIBTransaction;
   fstory_id,ftitle,fbyline,fstory:STring;
   fcreated:Tdatetime;
  public
   function ProcessCall (Command:String;Parameters:TStrings):TRemoteResponse;override;
   procedure UpdateStory;
   procedure CreateStory;
   procedure GetStory;
   procedure DeleteStory;
   property  DB:TIBDatabase read fdb write fdb;
  published
   property STORY_ID:STring read fstory_id write fstory_id;
   property CREATED:TDateTime read fcreated write fcreated;
   property TITLE:String read ftitle write ftitle;
   property BYLINE:STring read fbyline write fbyline;
   property STORY:String read fstory write fstory;
  end;

TDBStoryList = class(TQRemoteObject)
    private
      fSTories:TStringlist;   fdb:TIBDatabase; ftran:TIBTransaction;
    public
      constructor create (Service:STring);override;
      destructor  destroy;override;
      function ProcessCall (Command:String;Parameters:TStrings):TRemoteResponse;override;
      property  DB:TIBDatabase read fdb write fdb;
    published
      property Story_IDs:TStringlist read fstories write fstories;
    end;



implementation

constructor TDBStoryList.create (Service:STring);
begin
   inherited create(service);
   fstories:=tstringlist.create;
end;

destructor  TDBStoryList.destroy;
begin
 try
   fstories.free;
 finally
   inherited destroy;
 end;
end;

procedure TDBNewsStory.UpdateStory;
var sql:string; Q:TIBSQL;
begin
 sql:='UPDATE STORIES SET  TITLE=:TITLE, STORY=:STORY WHERE STORY_ID=:STORY_ID';
 Q:=TIBSQL.create(nil);
 Q.Database:=DB;   
 Q.Transaction := ftran;
 Q.sql.text:=sql;
 Q.ParambyName('STORY_ID').asstring:= self.story_id ;
 //Q.ParambyName('CREATED').value:= self.created ;
 Q.ParambyName('TITLE').asstring:= self.title ;
 //Q.ParambyName('BYLINE').asstring:= self.byline ;
 Q.ParambyName('STORY').asstring:= self.story ;
 Q.ExecQuery;
 Q.Close;
 Q.free;
end;

procedure TDBNewsStory.CreateStory;
var sql:STring; Q:TIBSQL;
begin
{STORY_ID,CREATED,TITLE,BYLINE,STORY}
 sql:='INSERT INTO STORIES (STORY_ID,CREATED,TITLE,BYLINE,STORY) VALUES (:STORY_ID,:CREATED,:TITLE,:BYLINE,:STORY)';
 Q:=TIBSQL.create(nil);
 Q.Database:=DB;   
 Q.Transaction := ftran;
 Q.sql.text:=sql;
 Q.ParambyName('STORY_ID').asstring:= Guids.CreateObjectID ;
 Q.ParambyName('CREATED').value:= now ;
 Q.ParambyName('TITLE').asstring:= self.title ;
 Q.ParambyName('BYLINE').asstring:= self.byline ;
 Q.ParambyName('STORY').asstring:= self.story ;
 Q.ExecQuery;
 Q.Close;
 Q.free;
end;

procedure TDBNewsStory.GetStory;
var sql:STring; Q:TIBSQL;
begin
{STORY_ID,CREATED,TITLE,BYLINE,STORY}
 sql:='SELECT * FROM STORIES WHERE STORY_ID=:STORY_ID';
 Q:=TIBSQL.create(nil);
 Q.Database:=DB;
 Q.Transaction := ftran;
 Q.sql.text:=sql;
 Q.ParambyName('STORY_ID').asstring:= self.story_id ;
 Q.ExecQuery; 
 self.created := Q.FieldbyName('CREATED').value ;
 self.title := Q.FieldbyName('TITLE').asstring ;
 self.byline := Q.FieldbyName('BYLINE').asstring ;
 self.story  := Q.FieldbyName('STORY').asstring;   
 Q.Close;
 Q.free;
end;

procedure TDBNewsStory.DeleteStory;
var sql:STring;Q:TIBSQL;
begin
{STORY_ID,CREATED,TITLE,BYLINE,STORY}
 sql:='DELETE FROM STORIES WHERE STORY_ID=:STORY_ID';
 Q:=TIBSQL.create(nil);
 Q.Database:=DB;
 Q.Transaction := ftran;
 Q.sql.text:=sql;
 Q.ParambyName('STORY_ID').asstring:= self.story_id ;
 Q.ExecQuery;
 Q.Close;
 Q.free;
end;

function TDBStoryList.ProcessCall (Command:String;Parameters:TStrings):TRemoteResponse;
var sql:STring;Q:TIBSQL;
begin
 result:=TRemoteResponse.create;
 result.RTTIObject := self;
 result.Service := self.service;
 result.ErrorNumber := 0;
 fTran:=TIBTransaction.create(nil);
 ftran.defaultdatabase:= fdb;
 try
 ftran.StartTransaction ;
 if UPPERCASE(Command)='GET' then
 begin
 sql:='SELECT STORY_ID,TITLE,CREATED FROM STORIES ORDER BY CREATED DESC';
 Q:=TIBSQL.create(nil);
 Q.Database:=DB;
 Q.Transaction := ftran;
 Q.sql.text:=sql;
 Q.ExecQuery;
 while not( Q.eof) do
  begin
    fstories.add  (Q.FieldbyName('STORY_ID').asstring+'=('+Q.FieldbyName('CREATED').asstring+') '+Q.FieldbyName('TITLE').asstring); 
    Q.next;
  end ;
 Q.Close;
 Q.free;   
 end;
 ftran.commit;
 except on E:Exception do
  begin
     ftran.rollback;
     raise(e);
  end;
 end;
end;

function TDBNewsStory.ProcessCall (Command:String;Parameters:TStrings):TRemoteResponse;
var Tran:TIBTransaction;
begin
 result:=TRemoteResponse.create;
 result.RTTIObject := self;
 result.Service := self.service;
 result.ErrorNumber := 0;
 fTran:=TIBTransaction.create(nil);
 ftran.defaultdatabase:= fdb; 
 ftran.StartTransaction ;
 try
 if UPPERCASE(command)='INSERT' then
    begin
      CreateStory;      
    end;
 if UPPERCASE(command)='UPDATE' then
    begin
      UpdateStory;
    end;
 if UPPERCASE(command)='GET' then
    begin
      GetStory;
    end;
 if UPPERCASE(command)='DELETE' then
    begin
      DeleteStory;
    end;
 ftran.commit;
 except on E:Exception do
  begin
     ftran.rollback;
     raise(e);
  end;
 end;
end;

end.

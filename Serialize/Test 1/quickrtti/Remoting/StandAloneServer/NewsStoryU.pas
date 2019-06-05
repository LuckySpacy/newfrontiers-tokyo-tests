unit NewsStoryU;

interface
uses Classes,sysutils,QuickRTTI,QRemote;

type

TClientNewsStory =class(TQRemoteObject)
  private
   fstory_id,ftitle,fbyline,fstory:STring;
   fcreated:Tdatetime;
  published
   property STORY_ID:STring read fstory_id write fstory_id;
   property CREATED:TDateTime read fcreated write fcreated;
   property TITLE:String read ftitle write ftitle;
   property BYLINE:STring read fbyline write fbyline;
   property STORY:String read fstory write fstory;
  end;


TStoryList = class(TQRemoteObject)
    private
      fSTories:TStringlist;
    public
      constructor create (Service:STring);override;
      destructor  destroy;override; 
    published
      property Story_IDs:TStringlist read fstories write fstories;
    end;

implementation

constructor TStoryList.create (Service:STring);
begin
   inherited create(service);
   fstories:=tstringlist.create;
end;

destructor  TStoryList.destroy;
begin
 try
   fstories.free;
 finally
   inherited destroy;
 end;
end;

end.

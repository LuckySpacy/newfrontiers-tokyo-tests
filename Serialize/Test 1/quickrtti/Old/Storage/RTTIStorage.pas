unit RTTIStorage;

interface
uses
 classes;
type
TPersistentStorage = class (TComponent)
public
  {for use by transactional back-ends}
  procedure Prepare;virtual;abstract;
  procedure BeginTransaction;virtual;abstract;
  procedure Commit;virtual;abstract;
  procedure RollBack;virtual;abstract;
  {These are mainly for use by the ObjectSets}
  function  FindObjectIDs (Where:String;var ObjectIDList:TStrings) :integer;virtual;abstract;
  function  GetObjects    (Where:String;var ObjectList:TList):integer;virtual;abstract;
published
  function  AttachToObject (ObjectID:String):TPersistent;virtual;abstract;
  procedure DetachObject (Obj:TPersistent);virtual;abstract;
  procedure StoreObject (ObjectID:String;Obj:TPersistent);virtual;abstract;
  procedure DeleteObject (ObjectID:String);virtual;abstract;
  function  CreateObjectID :String;virtual;abstract;
end;


implementation

end.

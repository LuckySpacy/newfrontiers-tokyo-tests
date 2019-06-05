unit udpclasses;

interface

uses classes,sysutils, controls, stdctrls,comCtrls;
type
TPropertyKind=(pkString,pkInteger,pkDate);

TPropertyTypes=class(TCollection)
end;
TProperties=class(TCollection)
end;
TEntity=class;
TProperty=class;

// the "class" side of the model
TEntityType=class(TPersistent)
  private
  fName:string;
  FPropertyTypes:TPropertyTypes;
  public
  constructor Create;
  destructor Destroy; override;
  function CreateEntity:TEntity;
  procedure EditEntity(Entity:TEntity; Parent:TWinControl);
published
  property Name:string read FName write FName;
  property PropertyTypes:TPropertyTypes read FPropertyTypes write FPropertyTypes;
  end;

TPropertyType=class(TCollectionItem)
  private
  FPropertyName:string;
  FPropertyKind:TPropertyKind;
  public
  constructor Create(Collection:TCollection); override;
  destructor Destroy;override;
  function EditProperty(Prop:TProperty; Parent:TWinControl; Top:integer; Left:integer):TWinControl;
  published
  property PropertyName:string read FPropertyName write FPropertyName;
  property PropertyKind:TPropertyKind read FPropertyKind write FPropertyKind;
  end;

// the instance side of the model  
TEntity=class(TPersistent)
  private
  FEntityKind:TEntityType;
  FProperties:TProperties;
  public
  constructor Create;
  destructor Destroy; override;
  property EntityKind:TEntityType read FEntityKind write FEntityKind;
  published
  property Properties:TProperties read FProperties write FProperties;
  end;

TProperty=class(TCollectionItem)
  private
  fKind:TPropertyType;
  public
  constructor Create(Collection:TCollection); override;
  destructor Destroy;override;
  procedure Update(sender:TObject); virtual;
  published
  property Kind:TPropertyType read FKind write FKind;
  end;

TIntegerProperty=class(TProperty)
  private
  fValue:integer;
  public
  procedure Update(sender:TObject); override;
  published
  property value:integer read FValue write FValue;
  end;

TStringProperty=class(TProperty)
  private
  fValue:string;
  public
  procedure Update(sender:TObject); override;
  published
  property value:string read FValue write FValue;
  end;

TDateProperty=class(TProperty)
  private
  fValue:TDate;
  public
  procedure Update(sender:TObject); override;
  published
  property value:TDate read FValue write FValue;
  end;

implementation

{ TPropertyType }

constructor TPropertyType.Create(Collection: TCollection);
begin
  inherited Create(Collection);
end;

destructor TPropertyType.Destroy;
begin
  inherited Destroy;
end;

function TPropertyType.EditProperty(Prop: TProperty; Parent: TWinControl; Top,
  Left: integer):TWinControl;
var ed:TEdit;
    lb:TLabel;
    dp:TDateTimePicker;
begin
lb:=Tlabel.create(parent);
lb.Parent:=parent;
lb.Top:=top;
lb.Left:=Left;
lb.caption:=prop.Kind.PropertyName;

case prop.Kind.propertyKind of
   pkString, pkInteger:
     begin
     ed:=TEdit.Create(parent);
     ed.Parent:=TWinControl(parent);
     ed.top:=top+lb.Height+2;
     ed.Left:=left;
     ed.OnChange:=prop.update;
     Result:=ed;
     end;
   pkDate:
     begin
     dp:=TDateTimePicker.Create(parent);
     dp.Parent:=TWinControl(parent);
     dp.top:=top+lb.Height+2;
     dp.Left:=left;
     dp.OnChange:=prop.update;
     Result:=dp;
     end;
   else Result:=nil;

end; //case

end;

{ TEntityType }

constructor TEntityType.Create;
begin
inherited Create;
FPropertyTypes:=TPropertyTypes.create(TPropertyType);
end;

destructor TEntityType.Destroy;
begin
  FpropertyTypes.Free;
  inherited Destroy;
end;

function TEntityType.CreateEntity:TEntity;
var temp:TEntity;
i:integer;
pt:TProperty;
begin
temp:=TEntity.create;
temp.EntityKind:=self;
for i:=0 to propertyTypes.count-1 do
  begin
  case TPropertyType(propertyTypes.items[i]).propertyKind of
   pkInteger: begin
              pt:=TIntegerProperty.Create(temp.properties);
              pt.Kind:= TPropertyType(propertyTypes.items[i]);
              end;
   pkString:  begin
              pt:=TStringProperty.Create(temp.properties);
              pt.Kind:= TPropertyType(propertyTypes.items[i]);
              end;
   pkDate  :  begin
              pt:=TDateProperty.Create(temp.properties);
              pt.Kind:= TPropertyType(propertyTypes.items[i]);
              end;
  end;
  end;
result:=temp;
end;

procedure TEntityType.EditEntity(Entity: TEntity; Parent: TWinControl);
var verticaloffset:integer;
    i:integer;
    pt:TProperty;
    WinC:TWinControl;
    FirstControl:TWinControl;
begin
FirstControl:=nil;
verticalOffset:=10;
   for i:=0 to entity.Properties.Count-1 do
    begin
    pt:=TProperty(entity.Properties.Items[i]);
    WinC:=pt.kind.EditProperty(pt,parent,verticalOffset,10);
    if i=0 then FirstControl:=WinC;
    verticalOffset:=verticalOffset+50;
    end;
if  assigned(FirstControl) then FirstControl.SetFocus;
end;

{ TEntity }

constructor TEntity.Create;
begin
inherited Create;
FProperties:=TProperties.create(TProperty);
end;

destructor TEntity.Destroy;
begin
  FProperties.free;
  inherited Destroy;

end;

{ TProperty }

constructor TProperty.Create(Collection: TCollection);
begin
  inherited create(Collection);

end;

destructor TProperty.Destroy;
begin
  inherited Destroy;

end;

procedure TProperty.Update(sender: TObject);
begin

end;

{ TStringProperty }

procedure TStringProperty.Update(sender: TObject);
begin
  inherited;
value:=(sender as TEdit).text;
end;

{ TIntegerProperty }

procedure TIntegerProperty.Update(sender: TObject);
begin
  inherited;
value:=StrToInt((sender as TEdit).text);
end;

{ TDateProperty }

procedure TDateProperty.Update(sender: TObject);
begin
  inherited;
value:=(sender as TDateTimePicker).date;
end;

end.

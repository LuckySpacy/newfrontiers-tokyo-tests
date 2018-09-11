unit o_ObjOutlookDrop;

interface

uses
  System.SysUtils, Classes, MapiDefs, MapiUtil, MapiTags, o_ObjOutlookmsg, Activex, Winapi.ShellAPI,
  System.Win.ComObj, c_OutlookDropTypes, vcl.Dialogs, DragDrop, DropTarget, DragDropFile,
  Vcl.ComCtrls, Winapi.Windows, Vcl.Forms, o_Outlookdropmessages, o_Outlookdropmessage;

type
  TObjOutlookDrop = class(TObject)
  private
    _CleanUpList: TStringList;
    _ChildForms: TList;
    _CurrentMessage: TObjOutlookMsg;
    _HasMessageSession: boolean;
    _DataFormatAdapterOutlook: TDataFormatAdapter;
    _OutlookDropMessages: TOutlookDropMessages;
    _CanUse: Boolean;
    procedure CleanUp;
    procedure Reset;
    procedure ResetView;
    function GetSender(const AMessage: IMessage): string;
    function GetSubject(const AMessage: IMessage): string;
    function ReadBodyText(const AMessage: IMessage): string;
    procedure SetToMessage(aOutlookMsg: TOutlookDropMessage);
  public
    //constructor Create(const AMessage: IMessage; const AStorage: IStorage);
    property OutlookDropMessages: TOutlookDropMessages read _OutlookDropMessages write _OutlookDropMessages;
    property DataFormatAdapterOutlook: TDataFormatAdapter read _DataFormatAdapterOutlook write _DataFormatAdapterOutlook;
    property CanUse: Boolean read _CanUse;
    procedure Dropped;
    constructor Create;
    destructor Destroy; override;
  end;


implementation

{ TObjOutlookDrop }

uses
  DragDropInternet, Contnrs;

const
  // Attachment listview column indices
  ColType = 0;
  ColSize = 1;
  ColDisplay = 2;
  ColFile = 3;


constructor TObjOutlookDrop.Create;
begin
  _CanUse := true;
  try
    LoadMAPI32;
    OleCheck(MAPIInitialize(@MapiInit));
  except
    _CanUse := false;
  end;
  {
  try
    OleCheck(MAPIInitialize(@MapiInit));
  except
    on E: Exception do
      ShowMessage(Format('Failed to initialize MAPI: %s', [E.Message]));
  end;
  }
  _CleanUpList := TStringList.Create;
  _ChildForms := TObjectList.Create(True);
  _HasMessageSession := false;
  _OutlookDropMessages := TOutlookDropMessages.Create;
end;

destructor TObjOutlookDrop.Destroy;
begin
  Reset;
  CleanUp;
  FreeAndNil(_CleanUpList);
  FreeAndNil(_ChildForms);
  FreeAndNil(_OutlookDropMessages);
  try
    MAPIUninitialize;
  except
  end;
  inherited;
end;



procedure TObjOutlookDrop.CleanUp;
var
  i: integer;
  OutlookDataFormat: TOutlookDataFormat;
begin
  _CurrentMessage := nil;

  for i := 0 to _CleanUpList.Count-1 do
    try
      System.SysUtils.DeleteFile(_CleanUpList[i]);
    except
      // Ignore errors - nothing we can do about it anyway.
    end;

  _CleanUpList.Clear;

  if (_HasMessageSession) then
  begin
    OutlookDataFormat := DataFormatAdapterOutlook.DataFormat as TOutlookDataFormat;
    OutlookDataFormat.Messages.UnlockSession;
    _HasMessageSession := False;
  end;
  _OutlookDropMessages.Clear;
end;


procedure TObjOutlookDrop.Reset;
begin
  _ChildForms.Clear;
  ResetView;
end;

procedure TObjOutlookDrop.ResetView;
begin
  _CurrentMessage := nil;
end;

function TObjOutlookDrop.GetSender(const AMessage: IMessage): string;
var
  Prop: PSPropValue;
begin
  if (Succeeded(HrGetOneProp(AMessage, PR_SENDER_NAME, Prop))) then
    try
      if (Prop.ulPropTag and PT_UNICODE = PT_UNICODE) then
        Result := String(PWideChar(Prop.Value.lpszW))
      else
        Result := String(Prop.Value.lpszA);
    finally
      MAPIFreeBuffer(Prop);
    end
  else
    Result := '';
end;

function TObjOutlookDrop.GetSubject(const AMessage: IMessage): string;
var
  Prop: PSPropValue;
begin
  if (Succeeded(HrGetOneProp(AMessage, PR_SUBJECT, Prop))) then
    try
      if (Prop.ulPropTag and PT_UNICODE = PT_UNICODE) then
        { TODO : TSPropValue.Value.lpszW is declared wrong }
        Result := String(PWideChar(Prop.Value.lpszW))
      else
        Result := String(Prop.Value.lpszA);
    finally
      MAPIFreeBuffer(Prop);
    end
  else
    Result := '';
end;



procedure TObjOutlookDrop.Dropped;
var
  OutlookDataFormat: TOutlookDataFormat;
  i: integer;
  DropMessage: TOutlookDropMessage;
  AMessage: IMessage;
begin
  if (_DataFormatAdapterOutlook.DataFormat <> nil) then
  begin
    OutlookDataFormat := _DataFormatAdapterOutlook.DataFormat as TOutlookDataFormat;
    Reset;
    CleanUp;
    OutlookDataFormat.Messages.LockSession;
    _HasMessageSession := True;

    for i := 0 to OutlookDataFormat.Messages.Count-1 do
    begin
      if (Supports(OutlookDataFormat.Messages[i], IMessage, AMessage)) then
      begin
        try
          DropMessage          := _OutlookDropMessages.Add;
          DropMessage.Data     := TObjOutlookMsg.Create(AMessage, OutlookDataFormat.Storages[i]);
          SetToMessage(DropMessage);
        finally
          AMessage := nil;
        end;
      end;
    end;
  end;
end;



procedure TObjOutlookDrop.SetToMessage(aOutlookMsg: TOutlookDropMessage);
const
  AddressTags: packed record
    Values: ULONG;
    PropTags: array[0..1] of ULONG;
  end = (Values: 2; PropTags: (PR_DISPLAY_NAME, PR_EMAIL_ADDRESS_A));
var
  i, j: Integer;
  Table: IMAPITable;
  Rows: PSRowSet;
  Value: string;
  Prop: PSPropValue;
  Msg: TObjOutlookMsg;
begin
  Msg := TObjOutlookMsg(aOutlookMsg.Data);
  if (Succeeded(Msg.Msg.GetRecipientTable(0, Table))) then
  begin
    if (Succeeded(HrQueryAllRows(Table, PSPropTagArray(@AddressTags), nil, nil, 0, Rows))) then
      try
        for i := 0 to integer(Rows.cRows)-1 do
        begin
          for j := 0 to Rows.aRow[i].cValues-1 do
          begin
            if (Rows.aRow[i].lpProps[j].ulPropTag and PT_UNICODE = PT_UNICODE) then
              { TODO : TSPropValue.Value.lpszW is declared wrong }
              Value := String(PWideChar(Rows.aRow[i].lpProps[j].Value.lpszW))
            else
              Value := String(Rows.aRow[i].lpProps[j].Value.lpszA);
            if (j = 0) then
              aOutlookMsg.An := Value
            else
            begin
              if Pos('CN=', Value) = 0 then
                aOutlookMsg.An := aOutlookMsg.An + ';' + Value;
            end;
          end;
        end;
      finally
        FreePRows(Rows);
      end;
    Table := nil;
  end;

  if (Succeeded(HrGetOneProp(Msg.Msg, PR_SENDER_EMAIL_ADDRESS_A, Prop))) then
    try
      Value := String(Prop.Value.lpszA);
    finally
      MAPIFreeBuffer(Prop);
    end
  else
    Value := '';

  aOutlookMsg.Von_eMail := Value;
  aOutlookMsg.Von       := GetSender(Msg.Msg);
  aOutlookMsg.Betreff   := GetSubject(Msg.Msg);
  aOutlookMsg.BodyText  := ReadBodyText(Msg.Msg);

end;


function TObjOutlookDrop.ReadBodyText(const AMessage: IMessage): String;
var
  Buffer: array of byte;
  Data: TMemoryStream;
  SourceStream: IStream;
  Size: integer;
  Dummy: Uint64;
const
  BufferSize = 64*1024; // 64Kb
  MaxMessageSize = 256*1024; // 256 Kb
begin
  Result := '';
  if (Succeeded(AMessage.OpenProperty(PR_BODY, IStream, STGM_READ, 0, IUnknown(SourceStream)))) then
  begin
    SetLength(Buffer, BufferSize);
    Data := TMemoryStream.Create;
    try
      // Read up to 256Kb from stream
      SourceStream.Seek(0, STREAM_SEEK_SET, Dummy);
      while (Data.Size < MaxMessageSize) and
        (Succeeded(SourceStream.Read(@Buffer[0], Length(Buffer), @Size))) and
        (Size > 0) do
      begin
        Data.Write(Buffer[0], Size);
      end;
      Buffer[0] := 0;
      Data.Write(Buffer[0], 1);
      Data.Write(Buffer[0], 1);
      Result := PChar(Data.Memory);
    finally
      Data.Free;
    end;
  end;
end;





end.

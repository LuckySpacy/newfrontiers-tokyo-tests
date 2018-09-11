{-------------------------------------------------------------------------
   Copyright by Haeger + Busch, Germany                / >>>>>>>>> /-----
   Ingenieurbuero fuer Kommunikationslösungen         / <<<<<<<<< /
 ----------------------------------------------------/ >>>>>>>>> /
   Homepage  : http://www.hbTapi.com
   EMail     : info@hbTapi.com
   Package   : hbTapi Components
 -------------------------------------------------------------------------}
 
unit uMain;

interface
{$I ..\..\hbTapiEdition.inc}

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  StdCtrls, hbTAPI, hbTapiUtils, hbTapiApi, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    hbTapiLine1: ThbTapiLine;
    ListView1: TListView;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Button_Answer: TButton;
    Button_Drop: TButton;
    Button_Owner: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    ComboBox_Lines: TComboBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall;
      CallState: Cardinal);
    procedure hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure hbTapiLine1NewCall(Sender: ThbTapiLine; Call: ThbTapiCall);
    procedure DoDrop(Sender: TObject);
    procedure DoAnswer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall;
      InfoState: Cardinal);
    procedure DoInit(Sender: TObject);
    procedure DoAccept(Sender: TObject);
    procedure hbTapiLine1Error(Sender: TObject; Error: Exception;
      Causer: TObject);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FLines : ThbTapiLineList;
    procedure Start(var Message: TMessage); message WM_USER +1;
    function GetCall: ThbTapiCall;
    procedure UpdateCall(line: ThbTapiLine; call: ThbTapiCall);
    procedure RemoveCall(line: ThbTapiLine; call: ThbTapiCall);
  public
    { Public declarations }
  end;

var Form1:        TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLines := ThbTapiLineList.Create;
{$ifdef EDT_PROFESSIONAL}
  ListView1.Columns.Add;
  ListView1.Columns[5].Caption := 'CalledID';
  ListView1.Columns[5].Width := ListView1.Columns[3].Width;
  ListView1.Columns[6].Caption := 'CalledIDName';
  ListView1.Columns[6].Width := ListView1.Columns[4].Width;
{$endif}
  PostMessage(handle, WM_USER+1, 0,0);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ListView1.Items.Clear;
  FLines.Free;
end;

function TForm1.GetCall: ThbTapiCall;
begin
  result := nil;

  if (ListView1.Selected = nil) and (ListView1.Items.Count >0) then
    ListView1.Selected := ListView1.Items[0];

  if ListView1.Selected = nil then
  begin
    MessageDlg('No call available.', mtInformation, [mbOk], 0);
    exit;
  end;

  result := ThbTapiCall(ListView1.Selected.Data);
end;

procedure TForm1.hbTapiLine1CallState(Sender: ThbTapiLine; Call: ThbTapiCall; CallState: Cardinal);
begin
  UpdateCall(Sender as ThbTapiLine, Call);
end;

procedure TForm1.hbTapiLine1Error(Sender: TObject; Error: Exception;
  Causer: TObject);
begin
beep;
end;

procedure TForm1.hbTapiLine1CallDeallocate(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  RemoveCall(Sender as ThbTapiLine, Call);
end;

procedure TForm1.hbTapiLine1NewCall(Sender: ThbTapiLine; Call: ThbTapiCall);
begin
  UpdateCall(Sender as ThbTapiLine, Call);
end;

procedure TForm1.Start(var Message: TMessage);
begin
  DoInit(nil);
end;

procedure TForm1.UpdateCall(line: ThbTapiLine; call: ThbTapiCall);
var li: TListItem;
begin
  li := ListView1.FindData(0, call, true, false);
  if li = nil then
  begin
    li := ListView1.Items.Add;
    while li.SubItems.Count < ListView1.Columns.Count-1 do
      li.SubItems.Add('');
  end;
  li.Data := call;
  li.Caption     := Format('%s', [line.DeviceName]);
  li.SubItems[0] := Format('0x%x', [Integer(call)]);

  li.SubItems[1] := call.StateText;
  li.SubItems[2] := call.CallerId.Address;
  li.SubItems[3] := call.CallerId.Name;
  if call.Owner then
    li.SubItems[4] := 'True'
  else
    li.SubItems[4] := '';

{$ifdef EDT_PROFESSIONAL}
  li.SubItems[4] := call.CalledId.Address;
  li.SubItems[5] := call.CalledId.Name;
{$endif}
end;

procedure TForm1.RemoveCall(line: ThbTapiLine; call: ThbTapiCall);
var li: TListItem;
begin
  li := ListView1.FindData(0, call, true, false);
  if li <> nil then
  begin
    ListView1.Items.Delete(ListView1.Items.IndexOf(li));
  end;
end;


procedure TForm1.hbTapiLine1CallInfo(Sender: ThbTapiLine; Call: ThbTapiCall;
  InfoState: Cardinal);
begin
  UpdateCall(Sender as ThbTapiLine, Call);
end;

procedure TForm1.DoInit(Sender: TObject);
var line : ThbTapiLine;
    i, n, iOpen, iError: Integer;
begin
  iOpen := 0;
  iError := 0;
  ComboBox_Lines.Items.Clear;
  Screen.Cursor := crHourGlass;
  StatusBar1.Panels[4].Text := ' Opening lines... please wait';
  Update;
  try
    with hbTapiLine1 do
    begin
      i := 0;
      while i < DeviceList.Count do
      begin
        hbTapiLine1.DeviceId := i;
        if Available and (Caps.MediaModes and LINEMEDIAMODE_INTERACTIVEVOICE > 0) then
        begin
          if FLines.IndexOfDeviceId(i) >= 0 then
            line := ThbTapiLine(FLines[FLines.IndexOfDeviceId(i)])
          else
          begin
            line := ThbTapiLine.Create(self);
            line.DeviceId := i;
            FLines.add(line);
            line.Privileges.AutoSelect := TRUE;
            line.OnCallState := hbTapiLine1.OnCallState;
            line.OnCallInfo := hbTapiLine1.OnCallInfo;
            line.OnNewCall := hbTapiLine1.OnNewCall;
            line.OnCallDeallocate := hbTapiLine1.OnCallDeallocate;
            line.CallOptions.AutoOwner := True;
          end;
          try
            line.Open;
            if line.Privileges.Owner or line.Privileges.Monitor then begin
              ComboBox_Lines.Items.Add(line.DeviceName + ' - '+ line.Privileges.Text);
              inc(iOpen);
              for n := 0 to line.Calls.Count-1 do
              begin
                UpdateCall(line, line.Calls[n]);
              end;
            end else begin
              line.Close;
              ComboBox_Lines.Items.Add(line.DeviceName + ' - '+ line.Privileges.Text);
            end;
          except
            on E:EhbTapiError do
            begin
              inc(iError);
              ComboBox_Lines.Items.Add(line.DeviceName + ' - ' + E.Message);
            end;
          end;
        end;
        inc(i);
      end;

    end;
    if ComboBox_Lines.Items.Count > 0 then
      ComboBox_Lines.ItemIndex := 0;
    StatusBar1.Panels[1].Text := Format('%d', [iOpen]);
    StatusBar1.Panels[3].Text := Format('%d', [iError]);
  finally
    Screen.Cursor := crDefault;
    StatusBar1.Panels[4].Text := '';
  end;
end;

procedure TForm1.DoAccept(Sender: TObject);
var
  i : Integer;
  c: ThbTapiCall;
begin
  for i := ListView1.Items.Count-1 downto 0 do begin
    if ListView1.Items[i].Selected then begin
      c := ThbTapiCall(ListView1.Items[i].Data);
      try
        if c.Status.CallFeatures and LINECALLFEATURE_ACCEPT <> 0 then
          c.Accept;
      except
        on E:Exception do
          MessageDlg(E.Message, mtError, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TForm1.DoAnswer(Sender: TObject);
var
  i : Integer;
  c: ThbTapiCall;
begin
  for i := ListView1.Items.Count-1 downto 0 do begin
    if ListView1.Items[i].Selected then begin
      c := ThbTapiCall(ListView1.Items[i].Data);
      try
        if c.Status.CallFeatures and LINECALLFEATURE_ANSWER <> 0 then
          c.Answer;
      except
        on E:Exception do
          MessageDlg(E.Message, mtError, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TForm1.DoDrop(Sender: TObject);
var
  i : Integer;
  c: ThbTapiCall;
begin
  for i := ListView1.Items.Count-1 downto 0 do begin
    if ListView1.Items[i].Selected then begin
      c := ThbTapiCall(ListView1.Items[i].Data);
      try
        if c.Status.CallFeatures and LINECALLFEATURE_DROP <> 0 then
          c.Drop;
      except
        on E:Exception do
          MessageDlg(E.Message, mtError, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TForm1.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = ord('A')) then
    ListView1.SelectAll;
end;

end.



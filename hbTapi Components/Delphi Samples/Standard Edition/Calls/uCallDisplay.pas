{-------------------------------------------------------------------------
   Copyright by Haeger + Busch, Germany                / >>>>>>>>> /-----
   Ingenieurbuero fuer Kommunikationslösungen         / <<<<<<<<< /
 ----------------------------------------------------/ >>>>>>>>> /
   Homepage  : http://www.hbTapi.com
   EMail     : info@hbTapi.com
   Package   : hbTapi Components
 -------------------------------------------------------------------------}
 
unit uCallDisplay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, ExtCtrls, ActnList, ImgList,  hbTapiApi, hbTapi;

type
  TFrameCallDisplay = class(TFrame)
    Panel_Background: TPanel;
    ActionList1: TActionList;
    Action_HoldCall: TAction;
    Action_AnswerCall: TAction;
    Action_CancelCall: TAction;
    ToolBar5: TToolBar;
    Button2: TToolButton;
    Button3: TToolButton;
    Button1: TToolButton;
    ToolButton6: TToolButton;
    Action_Dial: TAction;
    ToolButton7: TToolButton;
    Action_SwapHold: TAction;
    Label_CallerID: TLabel;
    Label_Address: TLabel;
    Label_CalledID: TLabel;
    Label_State: TLabel;
    Label_Mode: TLabel;
    Label_Detail: TLabel;
    ImageList1: TImageList;
    ImageState: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    ToolButton1: TToolButton;
    Label7: TLabel;
    Label_Features: TLabel;
    Action_BlindTransfer: TAction;
    procedure DoHold(Sender: TObject);
    procedure DoAnswer(Sender: TObject);
    procedure DoDrop(Sender: TObject);
    procedure DoDial(Sender: TObject);
    procedure DoSwapHold(Sender: TObject);
    procedure DoBlindTransfer(Sender: TObject);
  private
    FCall        : ThbTapiCall;
  public
    procedure UpdateActionList;
    procedure UpdateView;
    procedure Init;
    property  Call         : ThbTapiCall read FCall write FCall;
  end;

implementation

uses uMain;

{$R *.DFM}

procedure TFrameCallDisplay.Init;
begin
  Call := nil;
  UpdateView;
  UpdateActionList;
end;

procedure TFrameCallDisplay.UpdateActionList;
begin
  if (Call <> nil) and (Call.Features <> 0) then
  begin
    // We use the Call.Features flags to set the available actions.
    Action_Dial.Enabled               := (Call <> nil) and (Call.Features and LINECALLFEATURE_DIAL > 0);
    Action_CancelCall.Enabled         := (Call <> nil) and (Call.Features and LINECALLFEATURE_DROP > 0);
    Action_AnswerCall.Enabled         := (Call <> nil) and (Call.Features and LINECALLFEATURE_ANSWER > 0);
    Action_HoldCall.Enabled           := (Call <> nil) and (Call.Features and LINECALLFEATURE_HOLD > 0);
    Action_SwapHold.Enabled           := (Call <> nil) and (Call.Features and LINECALLFEATURE_SWAPHOLD > 0);
    Action_BlindTransfer.Enabled      := (Call <> nil) and (Call.Features and LINECALLFEATURE_BLINDTRANSFER > 0);
  end
  else
  begin
    // If the driver does not set therese flags correctly, you need to use the call states.
    Action_Dial.Enabled               := (Call <> nil) and (Call.State = LINECALLSTATE_DIALTONE);
    Action_CancelCall.Enabled         := (Call <> nil) and (Call.State and (LINECALLSTATE_IDLE or LINECALLSTATE_UNKNOWN) = 0);
    Action_AnswerCall.Enabled         := (Call <> nil) and (Call.State = LINECALLSTATE_OFFERING);
    Action_HoldCall.Enabled           := (Call <> nil) and (Call.IsHeld or Call.IsConnected);
    Action_SwapHold.Enabled           := (Call <> nil) and (Call.IsHeld);
    Action_BlindTransfer.Enabled      := (Call <> nil) and (Call.IsConnected);
  end;
end;

procedure TFrameCallDisplay.UpdateView;
begin
  ImageState.Picture.Assign(nil);
  Label_CallerID.Caption := '';
  Label_CalledID.Caption := '';
  Label_Address.Caption  := '';
  Label_State.Caption    := '';
  Label_Detail.Caption   := '';
  Label_Features.Caption :=  '';
  Label_Mode.Caption     := '';

  if Call = nil then
    exit;

  Label_CallerID.Caption := Call.CallerID.Address;
  if Call.CallerID.NameAvail then
     Label_CallerID.Caption := Label_CallerID.Caption + ' (' + Call.CallerID.Name + ')';;
{$ifdef EDT_PROFESSIONAL}
  Label_CalledID.Caption := Call.CalledID.Address;
  if Call.CalledID.NameAvail then
     Label_CalledID.Caption := Label_CalledID.Caption + ' (' + Call.CalledID.Name + ')';;
{$endif}
  Label_Address.Caption  := Call.Address.AddressName;
  Label_State.Caption  := Call.StateText;

  if Call.State and (LINECALLSTATE_DISCONNECTED or LINECALLSTATE_CONNECTED or
     LINECALLSTATE_DIALTONE or LINECALLSTATE_OFFERING or LINECALLSTATE_SPECIALINFO) > 0 then
    Label_Detail.Caption := Call.StateModeText;
  Label_Features.Caption := Call.FeaturesText;
  Label_Mode.Caption := Call.MediaModeText;

  ImageState.Picture.Assign(nil);
  case Call.State of
    LINECALLSTATE_IDLE               : ImageList1.GetBitmap(1, ImageState.Picture.Bitmap);
    LINECALLSTATE_OFFERING           : ImageList1.GetBitmap(4, ImageState.Picture.Bitmap);
    LINECALLSTATE_ACCEPTED           :;
    LINECALLSTATE_DIALTONE           ,
    LINECALLSTATE_DIALING            ,
    LINECALLSTATE_RINGBACK           ,
    LINECALLSTATE_PROCEEDING         : ImageList1.GetBitmap(2, ImageState.Picture.Bitmap);
    LINECALLSTATE_BUSY               : ImageList1.GetBitmap(8, ImageState.Picture.Bitmap);
    LINECALLSTATE_SPECIALINFO        :;
    LINECALLSTATE_CONNECTED          : ImageList1.GetBitmap(3, ImageState.Picture.Bitmap);
    LINECALLSTATE_CONFERENCED        : ImageList1.GetBitmap(7, ImageState.Picture.Bitmap);
    LINECALLSTATE_ONHOLD             ,
    LINECALLSTATE_ONHOLDPENDCONF     ,
    LINECALLSTATE_ONHOLDPENDTRANSFER : ImageList1.GetBitmap(5, ImageState.Picture.Bitmap);
    LINECALLSTATE_DISCONNECTED       : ImageList1.GetBitmap(6, ImageState.Picture.Bitmap);
  end;

end;

procedure TFrameCallDisplay.DoAnswer(Sender: TObject);
begin
  if Call <> nil then
  begin
    try
      Call.Answer;
      MainForm.LogFmt('Answer started (RequestID=x%x)',[Call.Line.LastRequestID]);
    except
    on E:Exception do
      MainForm.LogFmt('Answer failed! %s', [E.Message]);
    end;
  end;
end;

procedure TFrameCallDisplay.DoDrop(Sender: TObject);
begin
  try
    Call.Owner := TRUE;
    Call.Drop;
    MainForm.LogFmt('Drop started (RequestID=x%x)',[Call.Line.LastRequestID]);
  except
    on E:Exception do
      MainForm.LogFmt('Drop failed! %s', [E.Message]);
  end;
end;

procedure TFrameCallDisplay.DoDial(Sender: TObject);
var s: String;
begin
  if Call = nil then
    exit;
  s := '';
  if InputQuery('Dial','Telephone number', s) and (s <> '')then
  begin
    try
      Call.Dial(s);
      MainForm.LogFmt('Dial started (RequestID= %d)',[Call.Line.LastRequestID]);
    except
      on E:Exception do
        MainForm.LogFmt('Dial failed! %s', [E.Message]);
    end;
  end;
end;

procedure TFrameCallDisplay.DoHold(Sender: TObject);
begin
  if (Call = nil) then
    exit;
  try
{$ifdef EDT_PROFESSIONAL}
    if Call.IsHeld then
    begin
      Call.UnHold;
      MainForm.LogFmt('UnHold started (RequestID= %d)',[Call.Line.LastRequestID]);
    end
    else
    begin
      Call.Hold;
      MainForm.LogFmt('Hold started (RequestID= %d)',[Call.Line.LastRequestID]);
    end;
{$else}
    MainForm.LogFmt('Hold is a feature of the hbTapi Professional version',[]);
{$endif}
  except
    on E:Exception do
      MessageDlg('Hold/Unhold failed. ' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFrameCallDisplay.DoSwapHold(Sender: TObject);
begin
  if (Call = nil) then
    exit;
  try
{$ifdef EDT_PROFESSIONAL}
    Call.SwapHold;
    MainForm.LogFmt('SwapHold started (RequestID= %d)',[Call.Line.LastRequestID]);
{$else}
    MainForm.LogFmt('SwapHold is a feature of the hbTapi Professional version',[]);
{$endif}
  except
    on E:Exception do
      MessageDlg('SwapHold failed. ' + E.Message, mtError, [mbOK], 0);
  end;
end;


procedure TFrameCallDisplay.DoBlindTransfer(Sender: TObject);
var s: String;
begin
  if Call = nil then
    exit;
  s := '';
{$ifdef EDT_PROFESSIONAL}
  if InputQuery('BlindTransfer','Telephone number', s) and (s <>'') then
  begin
    try
      Call.BlindTransfer(s);
      MainForm.LogFmt('BlindTransfer started (RequestID= %d)',[Call.Line.LastRequestID]);
    except
      on E:Exception do
        MainForm.LogFmt('BlindTransfer failed! %s', [E.Message]);
    end;
  end;
{$else}
  MainForm.LogFmt('BlindTransfer is a feature of the hbTapi Professional version',[]);
{$endif}
end;

end.

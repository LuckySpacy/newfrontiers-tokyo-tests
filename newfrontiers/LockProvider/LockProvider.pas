unit LockProvider;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  contnrs, Datasnap.dbclient, db, scktcomp, ExtCtrls, o_license_base, System.UITypes,
  MidasLib, o_lpUser, o_lpUserList;

type

  TSocketInterceptEvent = procedure(Sender: TObject; Socket: TCustomWinSocket; Text: string) of object;

type
  TLogUpdateEvent = procedure(Sender: TObject; Text: string) of object;

type
  TAppType = (AppTypeServer, AppTypeClient);

type
  TLockItem = class(TObject)
  public
    IncID: integer;
    Mandant: integer;
    Machine: string;
    Session: string;
    Key: integer;
    Lastupdate: TDateTime;
    ID: integer;
    User: string;
    Hint: string;
  end;

type
  TUserItem = class(TObject)
  public
    Mandant: integer;
    Machine: string;
    Session: string;
    User: string;
    AppType: TAppType;
    Lastupdate: TDateTime;
  end;

  { ***   LockProvider   *** }
type
  TLockProvider = class(TComponent)
  private
    FConnection: TServerSocket;
    FLicenseKey: TLicenseBase;

    LockItemList: TObjectList;
    LoggedUserList: TObjectList;
    CheckTimer: TTimer;

    LockInc: integer;

    InProgress: boolean;

    SessionTimeout: integer;
    KillTimeoutUser: boolean;

    FOnSocketInterceptRead: TSocketInterceptEvent;
    FOnSocketInterceptWrite: TSocketInterceptEvent;
    FOnLogUpdate: TLogUpdateEvent;

    procedure Check(Sender: TObject);

    procedure Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure Write(Sender: TObject; Socket: TCustomWinSocket; Text: string);

    procedure AddLock(Mandant: integer; Machine: string; Key: integer;
      ID: integer; User: string; Session: string; Hint: string; Socket: TCustomWinSocket);
    procedure AddLockID(Mandant: integer; IncID: integer; Machine: string;
      Key: integer; ID: integer; User: string; Session: string; Hint: string;  Socket: TCustomWinSocket);
    procedure DelLock(Mandant: integer; LockID: integer; Socket: TCustomWinSocket);
    procedure GetLockList(Mandant: integer; Socket: TCustomWinSocket);
    procedure GetLockListAll(Socket: TCustomWinSocket);
    procedure IsTableLocked(Mandant: integer; Key: integer; Socket: TCustomWinSocket);

    procedure Login(Mandant: integer; User, Machine, Session: string; aErzwingeAnmeldung: string; AppType: TAppType; Socket: TCustomWinSocket);
    procedure Logout(Mandant: integer; User, Session, Machine: string; Socket: TCustomWinSocket);
    procedure GetUserList(Mandant: integer; Socket: TCustomWinSocket);
    procedure GetUserListAll(Socket: TCustomWinSocket);
    function GetUserID(aUser, aSession, aMachine: string): integer;
    procedure IsLoggedIn(Mandant: integer; User: string; Socket: TCustomWinSocket);
    procedure KillUser(Mandant: integer; User, Machine, Session: string; Socket: TCustomWinSocket);

    procedure GetLicenseInfo(Socket: TCustomWinSocket);
    function isLicenceNeededFor(Mandant: integer; User: string; Machine: string): boolean;

    function SessionValid(aSession: string): boolean;
    procedure RefreshSession(aSession: string);
  protected
  public
    constructor Create(Sender: TComponent); override;
    destructor Destroy; override;

    procedure Reset;
    procedure Close;
    procedure setSessionExpireTime(aSeconds: integer; aKillUser: boolean);
    function getHintInfos: string;
    function getUserCount: integer;
    function getLicencesCount: integer;
  published
    property ServerSocket: TServerSocket read FConnection write FConnection;
    property LicenseKey: TLicenseBase read FLicenseKey write FLicenseKey;
    property OnSocketInterceptRead: TSocketInterceptEvent read FOnSocketInterceptRead write FOnSocketInterceptRead;
    property OnSocketInterceptWrite: TSocketInterceptEvent read FOnSocketInterceptWrite write FOnSocketInterceptWrite;
    property OnLogUpdate: TLogUpdateEvent read FOnLogUpdate write FOnLogUpdate;
  end;

  { ***   LockProviderClient   *** }
type
  TLockProviderClient = class(TComponent)
  private

    CurrentMachineName: string;
    CurrentActiveSession: string;
    fCurrentUserLimit: string;

    FConnection: TClientSocket;

    ReceivedMessage: string;
    MessageReturn: boolean;
    SocketConnected: boolean;
    SocketError: boolean;
    MandantID: integer;
    ErrorStr: string;
    ConnectionTime: TDateTime;
    LastSucchesfulCommuniction: TDateTime;

    // ** Lizens-Management **

    // Modules : array[0..63] of boolean;
    fModuleListe: TStringlist; // Ersetzt die Moduls-Array

    SerialNo: string;
    CustomerInfo: string;

    LicenseQueried: boolean;

    procedure Connected(Sender: TObject; Socket: TCustomWinSocket);
    procedure Disconnected(Sender: TObject; Socket: TCustomWinSocket);
    procedure Error(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: integer);
    function Init(aShowErrorMsg: Boolean): string;
    function SendAndGetMsg(MessageText: String): string;
    function getMachineName: string;
    function getActiveSession: string;
    function getCurrentUserLimit: string;

  protected
  public

    ErrLastUpdate: TDateTime;
    ErrMachineName: string;

    ErrTimeOut: boolean;

    property MachineName: string read getMachineName;
    property ActiveSession: string read getActiveSession;

    constructor Create(Sender: TComponent); override;
    destructor Destroy; override;

    procedure Close;

    function AddLock(Machine: string; Key: integer; ID: integer;
      var User: string; var Session: string; var Hint: string): integer;
    function AddLockTable(Machine: string; Key: integer; var User: string;
      var Session: string; var Hint: string): integer;
    function AddLockID(IncID: integer; Machine: string; Key: integer;
      ID: integer; var User: string; var Session: string;  var Hint: string): integer;
    function AddLockTableID(IncID: integer; Machine: string; Key: integer;
      var User: string; var Session: string; var Hint: string): integer;
    procedure DelLock(LockID: integer);
    procedure GetLockList(var List: TClientDataSet);
    function IsTableLocked(Key: integer): boolean;

    function getEmptyHandle: integer;

    /// <summary>
    /// An VeriLock anmelden
    /// </summary>
    /// <returns>
    /// <para>
    /// -1 = Es trat ein Fehler auf
    /// </para>
    /// <para>
    /// 1 = Session muss überpüft werden (mehrfache Anmeldung des gleichen
    /// Benutzers von der gleichen Maschine)
    /// </para>
    /// </returns>
    function Login(User, Machine, Session: string;  aErzwingeAnmeldung: Boolean; AppType: TAppType): integer;

    /// <summary>
    /// Von VeriLock abmelden. Entfernt den Benutzer und die Lizenz
    /// </summary>
    procedure Logout(User, Machine, Session: string);
    procedure GetUserList(var Users: TClientDataSet);
    procedure GetUserListAll(aUserList: Tlp_Userlist);
    procedure GetAllLockList(aUserList: Tlp_UserList);
    function IsLoggedIn(User: string): boolean;
    procedure KillUser(User, Machine, Session: string);

    procedure GetLicenseInfo(var SerialNo: string; var CustomerInfo: string);

    function isActiveModule(aModule: integer): boolean;
    function getSerialNo: string;
    function getCustomerInfo: string;

    procedure Prepare(aMandantID: integer);
    function CheckConnection(var aErrMsg : string): boolean;
  published
    property ClientSocket: TClientSocket read FConnection write FConnection;
    property CurrentUserLimit : string read getCurrentUserLimit;
  end;

procedure Register;

implementation

uses DateUtils;

procedure Register;
begin
  RegisterComponents('Optima', [TLockProvider, TLockProviderClient]);
end;

{ *******************************************************************************
  *             LockProvider                                                     *
  ******************************************************************************* }

constructor TLockProvider.Create(Sender: TComponent);
begin
  inherited;
  LockItemList := TObjectList.Create;
  LoggedUserList := TObjectList.Create;
  CheckTimer := TTimer.Create(self);
  CheckTimer.Interval := 30000;
end;

destructor TLockProvider.Destroy;
begin
  CheckTimer.Free;
  LockItemList.Free;
  LoggedUserList.Free;
  inherited;
end;


procedure TLockProvider.Reset;
begin
  FConnection.Close;
  LoggedUserList.Clear;
  LoggedUserList.Pack;
  LockItemList.Clear;
  LockItemList.Pack;
  LockInc := 0;

  FConnection.OnClientRead := Read;
  FConnection.Open;

  CheckTimer.Interval := 1000;
  CheckTimer.OnTimer := Check;
end;

procedure TLockProvider.Close;
begin
  FConnection.Close;
end;

// Read - Daten aus Buffer lesen -----------------------------------------------
procedure TLockProvider.Read(Sender: TObject; Socket: TCustomWinSocket);
var
  RecievedMessage, Logtext: string;
  IncID, Mandant, Machine, Key, ID, User, Hint, AppType, Session, Erzwingen: string;
begin

  while InProgress do
  begin
    Application.ProcessMessages;
  end;

  InProgress := true;

  RecievedMessage := string(Socket.ReceiveText);
  Delete(RecievedMessage, 1, 1);
  Delete(RecievedMessage, length(RecievedMessage), 1);
  Logtext := RecievedMessage;;
//  if Assigned(FOnSocketInterceptRead) then
//    FOnSocketInterceptRead(Sender, Socket, RecievedMessage);

  try
    // Auseinandernehmen!

    if pos('ADDLOCKID', RecievedMessage) <> 0 then
    begin
      Delete(RecievedMessage, 1, pos(' ', RecievedMessage));

      Mandant := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      IncID := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Machine := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Key := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      ID := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      User := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Session := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Hint := RecievedMessage;

      AddLockID(StrToInt(Mandant), StrToInt(IncID), Machine, StrToInt(Key), StrToInt(ID), User, Session, Hint, Socket);

      if Assigned(FOnSocketInterceptRead) then
         FOnSocketInterceptRead(Sender, Socket, Logtext);
    end

    else if pos('ADDLOCK', RecievedMessage) <> 0 then
    begin
      // Parameter lesen
      Delete(RecievedMessage, 1, pos(' ', RecievedMessage));

      Mandant := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Machine := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Key := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      ID := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      User := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Session := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Hint := RecievedMessage;

      AddLock(StrToInt(Mandant), Machine, StrToInt(Key), StrToInt(ID), User, Session, Hint, Socket);
      if Assigned(FOnSocketInterceptRead) then
         FOnSocketInterceptRead(Sender, Socket, Logtext);
    end

    else if pos('DELLOCK', RecievedMessage) <> 0 then
    begin
      Delete(RecievedMessage, 1, pos(' ', RecievedMessage));

      Mandant := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      ID := RecievedMessage;

      DelLock(StrToInt(Mandant), StrToInt(ID), Socket);

      if Assigned(FOnSocketInterceptRead) then
         FOnSocketInterceptRead(Sender, Socket, Logtext);
    end

    else if pos('GETLOCKLISTALL', RecievedMessage) <> 0 then
    begin
      GetLockListALL(Socket);

      if Assigned(FOnSocketInterceptRead) then
         FOnSocketInterceptRead(Sender, Socket, Logtext);
    end

    else if pos('GETLOCKLIST', RecievedMessage) <> 0 then
    begin
      Delete(RecievedMessage, 1, pos(' ', RecievedMessage));

      Mandant := RecievedMessage;

      GetLockList(StrToInt(Mandant), Socket);

 //     if Assigned(FOnSocketInterceptRead) then
 //        FOnSocketInterceptRead(Sender, Socket, Logtext);
    end

    else if pos('LOGIN', RecievedMessage) <> 0 then
    begin

      Delete(RecievedMessage, 1, pos(' ', RecievedMessage));

      Mandant := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      User := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Machine := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Session := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Erzwingen := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      AppType := RecievedMessage;

//      Logtext := 'Anmeldung. Mitarbeiter: ' + User + '. Session: ' + Session;
//      if Assigned(FOnSocketInterceptRead) then
//         FOnSocketInterceptRead(Sender, Socket, Logtext);

      if AppType = 'S' then
        Login(StrToInt(Mandant), User, Machine, Session, Erzwingen, AppTypeServer, Socket)
      else
        Login(StrToInt(Mandant), User, Machine, Session, Erzwingen, AppTypeClient, Socket);
    end

    else if pos('LOGOUT', RecievedMessage) <> 0 then
    begin

      Delete(RecievedMessage, 1, pos(' ', RecievedMessage));

      Mandant := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      User := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Machine := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Session := RecievedMessage;

      Logout(StrToInt(Mandant), User, Machine, Session, Socket);

      if Assigned(FOnSocketInterceptRead) then
         FOnSocketInterceptRead(Sender, Socket, Logtext);
    end

    else if pos('GETUSERLISTALL', RecievedMessage) <> 0 then
    begin
      GetUserListALL(Socket);
//      if Assigned(FOnSocketInterceptRead) then
//        FOnSocketInterceptRead(Sender, Socket, Logtext);
    end

    else if pos('GETUSERLIST', RecievedMessage) <> 0 then
    begin

      Delete(RecievedMessage, 1, pos(' ', RecievedMessage));

      Mandant := RecievedMessage;

      GetUserList(StrToInt(Mandant), Socket);
//      if Assigned(FOnSocketInterceptRead) then
//       FOnSocketInterceptRead(Sender, Socket, Logtext);
    end


    else if pos('ISLOGGEDIN', RecievedMessage) <> 0 then
    begin

      Delete(RecievedMessage, 1, pos(' ', RecievedMessage));

      Mandant := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      User := RecievedMessage;

      IsLoggedIn(StrToInt(Mandant), User, Socket);
      if Assigned(FOnSocketInterceptRead) then
         FOnSocketInterceptRead(Sender, Socket, Logtext);

    end

    else if pos('ISTABLELOCKED', RecievedMessage) <> 0 then
    begin
      Delete(RecievedMessage, 1, pos(' ', RecievedMessage));

      Mandant := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Key := RecievedMessage;

      IsTableLocked(StrToInt(Mandant), StrToInt(Key), Socket);

    end

    else if pos('KILLUSER', RecievedMessage) <> 0 then
    begin

      Delete(RecievedMessage, 1, pos(' ', RecievedMessage));

      Mandant := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      User := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Machine := copy(RecievedMessage, 1, pos('|', RecievedMessage) - 1);
      Delete(RecievedMessage, 1, pos('|', RecievedMessage));

      Session := RecievedMessage;

      Logtext := 'Benutzer löschen. Mitarbeiter: ' + User + '. Session: ' + Session;
      if Assigned(FOnSocketInterceptRead) then
         FOnSocketInterceptRead(Sender, Socket, Logtext);

      KillUser(StrToInt(Mandant), User, Machine, Session, Socket);
    end

    else if pos('GETLICENSEINFO', RecievedMessage) <> 0 then
    begin

      GetLicenseInfo(Socket);
//      if Assigned(FOnSocketInterceptRead) then
//         FOnSocketInterceptRead(Sender, Socket, Logtext);
    end

    else
    begin
      InProgress := false;
      Socket.SendText('CMD ERR Command not understood!');
      raise Exception.Create('Illegal expression');
    end;

  except
    on E: Exception do
    begin
      InProgress := false;
      Socket.SendText('CMD ERR conversion error');
      ShowMessage(E.Message);
    end;
  end;

  InProgress := false;

  end;

// Write - Schreiben von Daten über den Socket ---------------------------------
procedure TLockProvider.Write(Sender: TObject; Socket: TCustomWinSocket; Text: string);
begin
  if Assigned(FOnSocketInterceptWrite) then
    FOnSocketInterceptWrite(FConnection, Socket, Text);

  Text := #1 + Text + #2;
  Socket.SendText(AnsiString(Text));
end;

procedure TLockProvider.AddLock(Mandant: integer; Machine: string; Key: integer;
  ID: integer; User: string; Session: string; Hint: string; Socket: TCustomWinSocket);
var
  NewLockItem: TLockItem;
  x: integer;
  ItemExists: boolean;
  SelfLock: boolean;
  DateInc: integer;

  SameKey, SameMandant, SameID, SameUser, SameSession: boolean;

begin
  try
    RefreshSession(Session);

    x := 0;
    ItemExists := false;
    SelfLock := false;
    while (x <= LockItemList.Count - 1) do
    begin
      SameKey := TLockItem(LockItemList[x]).Key = Key;

      SameID := TLockItem(LockItemList[x]).ID = ID;
      // genau gleicher Datensatz soll gesperrt werden
      SameID := SameID or (TLockItem(LockItemList[x]).ID = -1);
      // Datensatz soll gesperrt werden, wenn Tabelle bereits gesperrt
      SameID := SameID or (ID = -1);
      // Tabelle soll gesperrt werden, wenn bereits ein Datensatz gesperrt

      SameMandant := TLockItem(LockItemList[x]).Mandant = Mandant;

      SameUser := TLockItem(LockItemList[x]).User = User;
      SameSession := TLockItem(LockItemList[x]).Session = Session;

      ItemExists := SameKey and SameID and SameMandant;
      SelfLock := ItemExists and SameUser and SameSession;

      if ItemExists then
        break;
      inc(x);
    end;

    if SelfLock then
    begin
      Write(self, Socket, 'ADDLOCK ERR USER ' +
        inttostr((LockItemList[x] as TLockItem).IncID) + '|' +
        inttostr((LockItemList[x] as TLockItem).Key) + '|' +
        inttostr((LockItemList[x] as TLockItem).ID) + '|' +
        (LockItemList[x] as TLockItem).Machine + '|' +
        DateTimeToStr((LockItemList[x] as TLockItem).Lastupdate) + '|' +
        (LockItemList[x] as TLockItem).User + '|' +
        (LockItemList[x] as TLockItem).Session + '|' +
        (LockItemList[x] as TLockItem).Hint);
      exit;
    end;

    if ItemExists then
    begin
      Write(self, Socket, 'ADDLOCK ERR DATASET ' +
            inttostr((LockItemList[x] as TLockItem).IncID) + '|' +
            inttostr((LockItemList[x] as TLockItem).Key) + '|' +
            inttostr((LockItemList[x] as TLockItem).ID) + '|' +
            (LockItemList[x] as TLockItem).Machine + '|' +
            DateTimeToStr((LockItemList[x] as TLockItem).Lastupdate) + '|' +
            (LockItemList[x] as TLockItem).User + '|' +
            (LockItemList[x] as TLockItem).Session + '|' +
            (LockItemList[x] as TLockItem).Hint);
      exit;
    end;

    DateInc := round(date);
    NewLockItem := TLockItem.Create;
    NewLockItem.Mandant := Mandant;
    NewLockItem.IncID := (LockInc * 100) + (DateInc mod 100);
    NewLockItem.Machine := Machine;
    NewLockItem.Key := Key;
    NewLockItem.Lastupdate := now;
    NewLockItem.ID := ID;
    NewLockItem.User := User;
    NewLockItem.Session := Session;
    NewLockItem.Hint := Hint;

    LockItemList.Add(NewLockItem);

    inc(LockInc);

    LockItemList.Pack;
    LockItemList.Capacity := LockItemList.Count;

    Write(self, Socket, 'ADDLOCK OK ' + inttostr(NewLockItem.IncID));

  except
    Write(self, Socket, 'ADDLOCK ERR ' + inttostr(9999999) + '|' + inttostr(9999999) + '|' + inttostr(9999999) + '|' +
         'Maschine' + '|' + DateTimeToStr(date) + '|' + 'User' + '|' + '9999999' + '|' + 'Sperren ist nicht möglich');

  end;

end;

procedure TLockProvider.AddLockID(Mandant: integer; IncID: integer;
  Machine: string; Key: integer; ID: integer; User: string; Session: string; Hint: string; Socket: TCustomWinSocket);
var
  NewLockItem: TLockItem;
  x: integer;
  ItemExists: boolean;
  SelfLock: boolean;
  SameKey, SameMandant, SameID, SameUser, SameSession: boolean;
begin
  try
    RefreshSession(Session);

    x := 0;
    ItemExists := false;
    SelfLock := false;
    while (x <= LockItemList.Count - 1) do
    begin
      SameKey := TLockItem(LockItemList[x]).Key = Key;
      SameMandant := TLockItem(LockItemList[x]).Mandant = Mandant;
      SameID := (TLockItem(LockItemList[x]).ID = ID) or (TLockItem(LockItemList[x]).ID = -1) or (ID = -1);
      SameUser := TLockItem(LockItemList[x]).User = User;
      SameSession := TLockItem(LockItemList[x]).Session = Session;

      ItemExists := SameKey and SameID and SameMandant;
      SelfLock := ItemExists and SameUser and SameSession;

      if ItemExists then
        break;
      inc(x);
    end;

    if SelfLock then
    begin
      Write(self, Socket, 'ADDLOCKID ERR USER ' +
        inttostr((LockItemList[x] as TLockItem).IncID) + '|' +
        inttostr((LockItemList[x] as TLockItem).Key) + '|' +
        inttostr((LockItemList[x] as TLockItem).ID) + '|' +
        (LockItemList[x] as TLockItem).Machine + '|' +
        DateTimeToStr((LockItemList[x] as TLockItem).Lastupdate) + '|' +
        (LockItemList[x] as TLockItem).User + '|' +
        (LockItemList[x] as TLockItem).Session + '|' +
        (LockItemList[x] as TLockItem).Hint);
      exit;
    end;

    if ItemExists then
    begin
      Write(self, Socket, 'ADDLOCKID ERR DATASET ' +
        inttostr((LockItemList[x] as TLockItem).IncID) + '|' +
        inttostr((LockItemList[x] as TLockItem).Key) + '|' +
        inttostr((LockItemList[x] as TLockItem).ID) + '|' +
        (LockItemList[x] as TLockItem).Machine + '|' +
        DateTimeToStr((LockItemList[x] as TLockItem).Lastupdate) + '|' +
        (LockItemList[x] as TLockItem).User + '|' +
        (LockItemList[x] as TLockItem).Session + '|' +
        (LockItemList[x] as TLockItem).Hint);

      exit;
    end;

    NewLockItem := TLockItem.Create;
    NewLockItem.Mandant := Mandant;
    NewLockItem.IncID := IncID;
    NewLockItem.Machine := Machine;
    NewLockItem.Key := Key;
    NewLockItem.Lastupdate := now;
    NewLockItem.ID := ID;
    NewLockItem.User := User;
    NewLockItem.Session := Session;
    NewLockItem.Hint := Hint;

    LockItemList.Add(NewLockItem);

    inc(LockInc);

    LockItemList.Pack;
    LockItemList.Capacity := LockItemList.Count;

    Write(self, Socket, 'ADDLOCKID OK ' + inttostr(NewLockItem.IncID));

  except
    Write(self, Socket, 'ADDLOCKID ERR ' + inttostr(9999999) + '|' + inttostr(9999999) + '|' + inttostr(9999999) + '|' +
           'Maschine' + '|' +DateTimeToStr(date) + '|' + 'User' + '|' + '9999999' + '|' + 'Sperren ist nicht möglich');
  end;

  // NewLockItem := nil;
end;

procedure TLockProvider.DelLock(Mandant: integer; LockID: integer; Socket: TCustomWinSocket);
var
  x: integer;
  Empty: boolean;
begin
  try
    // Kompliziertes Löschverfahren, probleme mit TObjectList
    Empty := false;

    while not Empty do
    begin
      x := 0;
      while x < LockItemList.Count do
      begin
        if (LockItemList[x] as TLockItem).IncID = LockID then
          break;
        inc(x);
      end;

      if x < LockItemList.Count then
      begin
        RefreshSession(TLockItem(LockItemList[x]).Session);
        LockItemList.Delete(x)
      end
      else
        Empty := true;

      LockItemList.Pack;
      LockItemList.Capacity := LockItemList.Count;
    end;

    Write(self, Socket, 'DELLOCK OK');

  except
    Write(self, Socket, 'DELLOCK OK');
  end;

end;

procedure TLockProvider.GetLockList(Mandant: integer; Socket: TCustomWinSocket);
var
  x: integer;
  MessageStr: string;
begin
  try
    x := 0;
    MessageStr := '';

    while (x <= LockItemList.Count - 1) do
    begin
      if (LockItemList[x] As TLockItem).Mandant = Mandant then
      begin
        MessageStr := MessageStr + '(';
        MessageStr := MessageStr + inttostr((LockItemList[x] as TLockItem).IncID) + '|';
        MessageStr := MessageStr + (LockItemList[x] as TLockItem).Machine + '|';
        MessageStr := MessageStr + inttostr((LockItemList[x] as TLockItem).Key) + '|';
        MessageStr := MessageStr + DateTimeToStr((LockItemList[x] as TLockItem).Lastupdate) + '|';
        MessageStr := MessageStr + inttostr((LockItemList[x] as TLockItem).ID) + '|';
        MessageStr := MessageStr + (LockItemList[x] as TLockItem).User + '|';
        MessageStr := MessageStr + (LockItemList[x] as TLockItem).Session + '|';
        MessageStr := MessageStr + (LockItemList[x] as TLockItem).Hint + ')';
      end;
      inc(x);
    end;

    if MessageStr = '' then
      MessageStr := '()';

    Write(self, Socket, 'GETLOCKLIST OK ' + MessageStr);
  except
    Write(self, Socket, 'GETLOCKLIST OK ' + MessageStr);
  end;

end;


procedure TLockProvider.GetLockListAll(Socket: TCustomWinSocket);
var
  x: integer;
  MessageStr: string;
begin
  try
    x := 0;
    MessageStr := '';

    while (x <= LockItemList.Count - 1) do
    begin
      MessageStr := MessageStr + '(';
      MessageStr := MessageStr + inttostr((LockItemList[x] as TLockItem).IncID) + '|';
      MessageStr := MessageStr + (LockItemList[x] as TLockItem).Machine + '|';
      MessageStr := MessageStr + inttostr((LockItemList[x] as TLockItem).Key) + '|';
      MessageStr := MessageStr + DateTimeToStr((LockItemList[x] as TLockItem).Lastupdate) + '|';
      MessageStr := MessageStr + inttostr((LockItemList[x] as TLockItem).ID) + '|';
      MessageStr := MessageStr + (LockItemList[x] as TLockItem).User + '|';
      MessageStr := MessageStr + (LockItemList[x] as TLockItem).Session + '|';
      MessageStr := MessageStr + (LockItemList[x] as TLockItem).Hint + ')';
      inc(x);
    end;

    if MessageStr = '' then
      MessageStr := '()';

    Write(self, Socket, 'GETLOCKLISTALL OK ' + MessageStr);
  except
    Write(self, Socket, 'GETLOCKLISTALL OK ' + MessageStr);
  end;

end;


procedure TLockProvider.IsTableLocked(Mandant: integer; Key: integer; Socket: TCustomWinSocket);
var
  x: integer;
  Locked: boolean;
begin
  try

    x := 0;
    Locked := false;

    if LockItemList.Count = 0 then
    begin
      Write(self, Socket, 'ISTABLELOCKED OK NO');
      exit;
    end;

    while (x <= LockItemList.Count - 1) do
    begin
      if ((LockItemList[x] as TLockItem).Mandant = Mandant) and
        ((LockItemList[x] as TLockItem).ID = -1) and
        ((LockItemList[x] as TLockItem).Key = Key) then
      begin
        Locked := true;
        break;
      end;
      inc(x);
    end;

    if Locked then
    begin
      Write(self, Socket, 'ISTABLELOCKED OK YES');
    end
    else
    begin
      Write(self, Socket, 'ISTABLELOCKED OK NO');
    end;

  except
    Write(self, Socket, 'ISTABLELOCKED OK NO');
  end;
end;

procedure TLockProvider.Login(Mandant: integer; User, Machine, Session, aErzwingeAnmeldung: string;
  AppType: TAppType; Socket: TCustomWinSocket);
var
  NewLogin: TUserItem;
  ClientCount: integer;
  SessionCheck: boolean;
  x: integer;
  NeedLicence: boolean;
  erzwingen : boolean;
  LogText : string;
  i : integer;
  Users : string;
begin

  try
    erzwingen := aErzwingeAnmeldung = 'T';
    ClientCount := 0;
    x := 0;
    i := 0;
    Users := '';
    SessionCheck := false;

    if AppType = AppTypeClient then
    begin
      // Client-Count vor der Anmeldung dieses Users
      ClientCount := getLicencesCount;

      NeedLicence := isLicenceNeededFor(Mandant, User, Machine);
      if (NeedLicence) then
        ClientCount := ClientCount + 1;

      if (ClientCount > FLicenseKey.getClientLimit) and (not erzwingen) then
      begin
        while (i <= LoggedUserList.Count - 1) do
        begin
          Users := Users + (LoggedUserList[i] as TUserItem).User + ';';
          inc(i);
        end;
        LogText := ' Mitarbeiter: ' + User +  ' überschreitet das Benutzerlimit.' + slinebreak +
                   '               Anzahl der verbrauchten Lizenzen: ' + inttostr(ClientCount)+ '. Benutzerlimit: ' + IntToStr(FLicenseKey.getClientLimit)+ slinebreak +
                   '               Angemeldete Mitarbeiter: ' + Users +slinebreak;

        Write(self, Socket, 'LOGIN ERR LIMIT' + LogText);

//        Write(self, Socket, 'LOGIN ERR LIMIT Client limit exceedet');
        exit;
      end;

    end
    else
    begin
      while (x <= LoggedUserList.Count - 1) do
      begin
        if ((LoggedUserList[x] as TUserItem).AppType = AppTypeServer) and
          ((LoggedUserList[x] as TUserItem).Mandant = Mandant) then
        begin
          if ((LoggedUserList[x] as TUserItem).Machine = Machine) then
            Write(self, Socket,'LOGIN ERR MACHINE Server is running on same machine')
          else
            Write(self, Socket, 'LOGIN ERR SERVER Server is running');

          exit;
        end;
        inc(x);
      end;
    end;

    NewLogin := TUserItem.Create;

    NewLogin.Mandant := Mandant;
    NewLogin.User := User;
    NewLogin.Machine := Machine;
    NewLogin.Session := Session;
    NewLogin.AppType := AppType;
    NewLogin.Lastupdate := now;

    LoggedUserList.Add(NewLogin);
    LoggedUserList.Pack;
    LoggedUserList.Capacity := LoggedUserList.Count;

    if SessionCheck then
      Write(self, Socket, 'LOGIN OK SESSIONCHECK ' + inttostr(ClientCount))
    else
    begin
      while (i <= LoggedUserList.Count - 1) do
      begin
        Users := Users + (LoggedUserList[i] as TUserItem).User + ';';
        inc(i);
      end;

      LogText := ' Mitarbeiter:  ' + User + ' wurde erfolgreich angemeldet. ' + slinebreak +
                 '                Anzahl der verbrauchten Lizenzen: ' + inttostr(ClientCount)+ slinebreak +
                 '                Angemeldete Mitarbeiter: ' + Users+slinebreak;

      Write(self, Socket, 'LOGIN OK ' + LogText);

//      Write(self, Socket, 'LOGIN OK ' + inttostr(ClientCount));
    end;


  except
    Write(self, Socket, 'LOGIN ERR MACHINE');
  end;

end;

procedure TLockProvider.Logout(Mandant: integer; User, Session, Machine: string; Socket: TCustomWinSocket);
var
  x: integer;
begin
  try
    x := 0;
    while (x <= LoggedUserList.Count - 1) do
    begin
      if ((LoggedUserList[x] as TUserItem).User = User) and
        ((LoggedUserList[x] as TUserItem).Mandant = Mandant) and
        ((LoggedUserList[x] as TUserItem).Session = Session) then
      begin
        if Assigned(FOnLogUpdate) then
          FOnLogUpdate(self, 'LougOut von Benutzer ' + TUserItem(LoggedUserList[x]).User);

        LoggedUserList.Delete(x);
      end;

      inc(x);
    end;
    LoggedUserList.Pack;
    LoggedUserList.Capacity := LoggedUserList.Count;

    Write(self, Socket, 'LOGOUT OK');
  except
    Write(self, Socket, 'LOGOUT OK');
  end;

end;

procedure TLockProvider.GetUserList(Mandant: integer; Socket: TCustomWinSocket);
var
  x: integer;
  MessageStr: string;
begin
  try
    x := 0;
    MessageStr := ''+ slinebreak;

    while (x <= LoggedUserList.Count - 1) do
    begin
      if ((LoggedUserList[x] as TUserItem).Mandant = Mandant) then
      begin
        MessageStr := MessageStr + '(';
        MessageStr := MessageStr + (LoggedUserList[x] as TUserItem).User + '|';
        MessageStr := MessageStr + (LoggedUserList[x] as TUserItem).Session + '|';
        MessageStr := MessageStr + (LoggedUserList[x] as TUserItem).Machine + '|';
        MessageStr := MessageStr + DateTimeToStr((LoggedUserList[x] as TUserItem).Lastupdate) + ')'+slinebreak;
      end;
      inc(x);
    end;

    if MessageStr = '' then
      MessageStr := '()';

    Write(self, Socket, 'GETUSERLIST OK ' + MessageStr);
  except
    Write(self, Socket, 'GETUSERLIST OK ' + MessageStr);
  end;
end;

procedure TLockProvider.GetUserListAll(Socket: TCustomWinSocket);
var
  x: integer;
  MessageStr: string;
begin
  try
    x := 0;
    MessageStr := ''+ slinebreak;

    while (x <= LoggedUserList.Count - 1) do
    begin
      MessageStr := MessageStr + '(';
      MessageStr := MessageStr + (LoggedUserList[x] as TUserItem).User + '|';
      MessageStr := MessageStr + (LoggedUserList[x] as TUserItem).Session + '|';
      MessageStr := MessageStr + (LoggedUserList[x] as TUserItem).Machine + '|';
      MessageStr := MessageStr + DateTimeToStr((LoggedUserList[x] as TUserItem).Lastupdate) + ')'+slinebreak;
      inc(x);
    end;

    if MessageStr = '' then
      MessageStr := '()';

    Write(self, Socket, 'GETUSERLISTALL OK ' + MessageStr);
  except
    Write(self, Socket, 'GETUSERLISTALL OK ' + MessageStr);
  end;
end;


function TLockProvider.isLicenceNeededFor(Mandant: integer; User, Machine: string): boolean;
var
  fingerprint: string;
  fingerprints: TStringlist;
  x: integer;
begin

  if (UpperCase(User) = 'SERVICE') then
  begin
    result := true;
  end

  else
  begin

    fingerprints := TStringlist.Create;
    fingerprints.Duplicates := dupIgnore;

    for x := 0 to getUserCount - 1 do
    begin
      if (TUserItem(LoggedUserList[x]).AppType = AppTypeClient) and
        (UpperCase(TUserItem(LoggedUserList[x]).User) <> 'SERVICE') then
      begin
        fingerprint := inttostr(TUserItem(LoggedUserList[x]).Mandant) + '|' +
          TUserItem(LoggedUserList[x]).User + '|' + TUserItem(LoggedUserList[x]).Machine;

        fingerprints.Add(fingerprint);
      end;
    end;

    result := fingerprints.IndexOf(inttostr(Mandant) + '|' + User + '|' + Machine) < 0;
    fingerprints.Free;

  end;

end;

procedure TLockProvider.IsLoggedIn(Mandant: integer; User: string; Socket: TCustomWinSocket);
var
  x: integer;
  UserFound: boolean;
begin
  try
    x := 0;
    UserFound := false;

    if LoggedUserList.Count = 0 then
    begin
      Write(self, Socket, 'ISLOGGEDIN OK NO');
      exit;
    end;

    while (x <= LoggedUserList.Count - 1) do
    begin
      if ((LoggedUserList[x] as TUserItem).User = User) and
        ((LoggedUserList[x] as TUserItem).Mandant = Mandant) then
      begin
        UserFound := true;
        break;
      end;
      inc(x);
    end;

    if UserFound then
    begin
      Write(self, Socket, 'ISLOGGEDIN OK YES');
    end
    else
    begin
      Write(self, Socket, 'ISLOGGEDIN OK NO');
    end;
  except
    Write(self, Socket, 'ISLOGGEDIN OK NO');
  end;
end;

procedure TLockProvider.KillUser(Mandant: integer; User, Machine, Session: string; Socket: TCustomWinSocket);
var
  x: integer;
  y: integer;
  current: TLockItem;
begin
  try
    x := 0;
    while x < LockItemList.Count do
    begin
      current := TLockItem(LockItemList[x]);

      y := GetUserID(current.User, current.Session, current.Machine);
      if y = -1 then
        break;

      if ((LockItemList[x] as TLockItem).User = User) and
        ((LoggedUserList[y] as TUserItem).Mandant = Mandant) and
        (((LoggedUserList[y] as TUserItem).Session = Session) or
        (Session = 'SSNALL')) then
      begin
        if Assigned(FOnLogUpdate) then
          FOnLogUpdate(self, 'KillUser für Benutzer ' + TUserItem(LoggedUserList[y]).User);
//          FOnLogUpdate(self, 'KillUser für Benutzer ' + TUserItem(LoggedUserList[x]).User);
        LockItemList.Delete(x)
      end
      else
        inc(x);
    end;

    LockItemList.Pack;
    LockItemList.Capacity := LockItemList.Count;

    for x := 0 to LoggedUserList.Count - 1 do
    begin

      if ((LoggedUserList[x] as TUserItem).User = User) and
        ((LoggedUserList[x] as TUserItem).Mandant = Mandant) and
        (((LoggedUserList[x] as TUserItem).Session = Session) or
        (Session = 'SSNALL')) then
      begin
        LoggedUserList.Delete(x);
        break;
      end;

    end; // For

    LoggedUserList.Pack;
    LoggedUserList.Capacity := LoggedUserList.Count;

    Write(self, Socket, 'KILLUSER OK' + ' Mitarbeiter: ' + User + ' wurde erfolgreich abgemeldet.');

//    Write(self, Socket, 'KILLUSER OK');
  except
    Write(self, Socket, 'KILLUSER OK' + ' Fehler.');
  end;

end;

procedure TLockProvider.GetLicenseInfo(Socket: TCustomWinSocket);
var
  Clientlimit : string;
begin
  Clientlimit := IntToStr(FLicenseKey.getClientLimit);
  Write(self, Socket, 'GETLICENSEINFO OK (' + FLicenseKey.getSerial + '|' +
         FLicenseKey.getModuleInfo + '|' + FLicenseKey.getCustomerInfo + '|' + Clientlimit+ ')');

end;

{ *******************************************************************************
  *             LockProviderClient                                               *
  ******************************************************************************* }

constructor TLockProviderClient.Create(Sender: TComponent);
begin
  LicenseQueried := false;
  fCurrentUserLimit := '0';
  fModuleListe := TStringlist.Create;
  inherited;
end;

destructor TLockProviderClient.Destroy;
begin
  FreeAndNil(fModuleListe);
  inherited;
end;

procedure TLockProviderClient.Disconnected(Sender: TObject; Socket: TCustomWinSocket);
begin
  SocketConnected := false;
end;

function TLockProviderClient.CheckConnection(var aErrMsg : string): boolean;
begin
  aErrMsg := '';
  result := true;

  if FConnection.Active then
  begin
    exit;
  end;

  aErrMsg := Init(false);
  if aErrMsg > '' then
  begin
     Result := false;
  end;

{
var
  ErrorString: string;
begin

  result := true;

  if FConnection.Active then
  begin
    exit;
  end;

  ErrorString := Init(false);
  if ErrorString > '' then
  begin
     MessageDlg('Fehler beim Verbinden mit Verilock. ' + #13 +
                'Fehlermeldung: Socket Error: ' + errorStr + #13 +
                'Der Verilock-Server scheint nicht zu laufen,' + #13 +
                'oder die Netzverbindung zum Verilock-Server konnte nicht hergestellt werden.' + #13 + #13 +
                'Das Programm beendet sich jetzt.' + #13 +
                'Nachdem das Problem behoben ist, können Sie das Programm erneut starten.', mtError, [mbOk], 0);
     Result := false;
  end;
  }
end;

function TLockProviderClient.Init(aShowErrorMsg: Boolean): string;
begin
  result := '';
  // wenn noch keine Verbindung steht / Verbindung abgebrochen wurde
  if not FConnection.Active then
  begin
    // Sperre aufheben
    MessageReturn := true;
    // noch kein Socketfehler
    SocketError := false;
    // noch nicht verbunden
    SocketConnected := false;
    // Ereignisroutinen zuordnen
    FConnection.OnConnect := Connected;
    FConnection.OnDisconnect := Disconnected;
    FConnection.OnError := Error;

    // Vebindung herstellen und warten, bis was passiert
    try
      FConnection.Open;
    except
      on E: Exception do
      begin
        SocketError := true;
        ErrorStr := E.Message;
      end;
    end;
    while not SocketConnected and not SocketError do
    begin
      Application.ProcessMessages;
    end;
    if SocketError then
    begin
       if aShowErrorMsg then
         raise Exception.Create('Socket Error: ' + errorStr);
      result := ErrorStr;
      exit;
    end;

    // Lokale IP merken
    CurrentMachineName := FConnection.Socket.LocalAddress;

    // Lokal über Loopback-Interface verbinden
    if FConnection.Address = FConnection.Socket.LocalAddress then
    begin
      FConnection.Close;
      FConnection.Address := '127.0.0.1';
      SocketConnected := false;
      try
        FConnection.Open;
      except
        SocketError := true;
      end;
      while not SocketConnected and not SocketError do
      begin
        Application.ProcessMessages;
      end;
      if SocketError then
      begin
        Result := 'socket error';
        if aShowErrorMsg then
          raise Exception.Create('socket error');
        exit;
      end;
    end;
  end;
end;

procedure TLockProviderClient.Close;
begin
  FConnection.Close;
end;

procedure TLockProviderClient.Error(Sender: TObject; Socket: TCustomWinSocket;
 ErrorEvent: TErrorEvent; var ErrorCode: integer);
begin
  SocketError := true;
  ErrorStr := ClientSocket.Address + ' / ' + inttostr(ErrorCode);
  ErrorCode := 0;
end;

procedure TLockProviderClient.Connected(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  SocketConnected := true;
  ConnectionTime := now;
  LastSucchesfulCommuniction := now;
end;

function TLockProviderClient.AddLock(Machine: string; Key: integer; ID: integer;
  var User: string; var Session: string; var Hint: string): integer;
var
  CallResult: string;
begin
  Init(true);

  try
    ReceivedMessage := SendAndGetMsg('ADDLOCK ' + inttostr(MandantID) + '|' +
      Machine + '|' + inttostr(Key) + '|' + inttostr(ID) + '|' + User + '|' +  Session + '|' + Hint);

    if pos('ADDLOCK', ReceivedMessage) = 0 then
    begin
      raise Exception.Create('response mismatch. could not get data. (' +
        ReceivedMessage + ')');
      exit;
    end;

    // RecievedMessage auseinandernehmen?
    Delete(ReceivedMessage, 1, pos(' ', ReceivedMessage));

    CallResult := copy(ReceivedMessage, 1, pos(' ', ReceivedMessage) - 1);

    if pos('ERR', CallResult) = 0 then
    begin
      Delete(ReceivedMessage, 1, pos(' ', ReceivedMessage));
      result := StrToInt(ReceivedMessage);
    end
    else
    begin
      if pos('DATASET', ReceivedMessage) <> 0 then
        result := -1
      else
        result := -2;

      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));
      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));
      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

      ErrMachineName := copy(ReceivedMessage, 1, pos('|', ReceivedMessage) - 1);
      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

      ErrLastUpdate := StrToDateTime(copy(ReceivedMessage, 1, pos('|', ReceivedMessage) - 1));
      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

      User := copy(ReceivedMessage, 1, pos('|', ReceivedMessage) - 1);
      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

      Session := copy(ReceivedMessage, 1, pos('|', ReceivedMessage) - 1);
      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

      Hint := ReceivedMessage;
    end;

  except
    on E: Exception do
    begin
      result := -1;
      Hint := 'Fehler beim Zugriff auf den Sperr-Server: ' + E.Message;
      FConnection.Active := false;
    end;
  end;

end;

function TLockProviderClient.AddLockID(IncID: integer; Machine: string;
  Key: integer; ID: integer; var User: string; var Session: string; var Hint: string): integer;
var
  CallResult: string;
begin
  if IncID = 0 then
  begin
    result := AddLock(Machine, Key, ID, User, Session, Hint);
    exit;
  end;

  Init(true);

  try

    ReceivedMessage := SendAndGetMsg('ADDLOCKID ' + inttostr(MandantID) + '|' +  inttostr(IncID) + '|' +
            Machine + '|' + inttostr(Key) + '|' + inttostr(ID) + '|' + User + '|' + Session + '|' + Hint);

    if pos('ADDLOCKID', ReceivedMessage) = 0 then
    begin
      raise Exception.Create('response mismatch. could not get data.');
      exit;
    end;

    // ReceivedMessage auseinandernehmen
    Delete(ReceivedMessage, 1, pos(' ', ReceivedMessage));

    CallResult := copy(ReceivedMessage, 1, pos(' ', ReceivedMessage) - 1);

    if pos('ERR', CallResult) = 0 then
    begin
      Delete(ReceivedMessage, 1, pos(' ', ReceivedMessage));
      result := StrToInt(ReceivedMessage);
    end
    else
    begin
      if pos('DATASET', ReceivedMessage) <> 0 then
        result := -1
      else
        result := -2;

      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));
      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));
      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

      ErrMachineName := copy(ReceivedMessage, 1, pos('|', ReceivedMessage) - 1);

      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

      ErrLastUpdate := StrToDateTime(copy(ReceivedMessage, 1, pos('|', ReceivedMessage) - 1));
      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

      User := copy(ReceivedMessage, 1, pos('|', ReceivedMessage) - 1);
      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

      Session := copy(ReceivedMessage, 1, pos('|', ReceivedMessage) - 1);
      Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

      Hint := ReceivedMessage;
    end;

  except
    on E: Exception do
    begin
      result := -1;
      Hint := 'Fehler beim Zugriff auf den Sperr-Server: ' + E.Message;
      FConnection.Active := false;
    end;
  end;

end;

function TLockProviderClient.AddLockTable(Machine: string; Key: integer;
  var User: string; var Session: string; var Hint: string): integer;
begin
  result := AddLock(Machine, Key, -1, User, Session, Hint);
end;

function TLockProviderClient.AddLockTableID(IncID: integer; Machine: string;
  Key: integer; var User: string; var Session: string;  var Hint: string): integer;
begin
  result := AddLockID(IncID, Machine, Key, -1, User, Session, Hint);
end;

procedure TLockProviderClient.DelLock(LockID: integer);
begin
  Init(true);
  ReceivedMessage := SendAndGetMsg('DELLOCK ' + inttostr(MandantID) + '|' + inttostr(LockID));

  if pos('DELLOCK', ReceivedMessage) = 0 then
  begin
    raise Exception.Create('response mismatch. could not get data.');
    exit;
  end;

end;

procedure TLockProviderClient.GetLockList(var List: TClientDataSet);
var
  DataSetString: string;
  IIncID: string;
  IMachine: string;
  IKey: string;
  IID: string;
  ILastupdate: string;
  IUser: string;
  IHint: string;
  ISession: string;

begin

  Init(true);

  ReceivedMessage := SendAndGetMsg('GETLOCKLIST ' + inttostr(MandantID));

  if pos('GETLOCKLIST', ReceivedMessage) = 0 then
  begin
    raise Exception.Create('response mismatch. could not get data.');
    exit;
  end;

  List.Close;

  // DataSet Erzeugen
  List.FieldDefs.Clear;
  with List.FieldDefs.AddFieldDef do
  begin
    Name := 'IncID';
    DataType := ftInteger;
  end;

  with List.FieldDefs.AddFieldDef do
  begin
    Name := 'Machine';
    DataType := ftString;
    Size := 40;
  end;

  with List.FieldDefs.AddFieldDef do
  begin
    Name := 'Key';
    DataType := ftInteger;
  end;

  with List.FieldDefs.AddFieldDef do
  begin
    Name := 'Lastupdate';
    DataType := ftDateTime;
  end;

  with List.FieldDefs.AddFieldDef do
  begin
    Name := 'ID';
    DataType := ftInteger;
  end;

  with List.FieldDefs.AddFieldDef do
  begin
    Name := 'User';
    DataType := ftString;
    Size := 40;
  end;

  with List.FieldDefs.AddFieldDef do
  begin
    Name := 'Session';
    DataType := ftString;
    Size := 20;
  end;

  with List.FieldDefs.AddFieldDef do
  begin
    Name := 'Hint';
    DataType := ftString;
    Size := 255;
  end;

  List.CreateDataSet;

  // ReceivedMessage auseinandernehmen?
  while pos('|', ReceivedMessage) <> 0 do
  begin
    Delete(ReceivedMessage, 1, pos('(', ReceivedMessage));

    DataSetString := copy(ReceivedMessage, 1, pos(')', ReceivedMessage) - 1);

    Delete(ReceivedMessage, 1, pos(')', ReceivedMessage));

    // '|' trennt werte!!!
    IIncID := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    IMachine := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    IKey := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    ILastupdate := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    IID := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    IUser := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    ISession := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    IHint := DataSetString;

    List.Append;
    List.FieldByName('IncID').AsInteger := StrToInt(IIncID);
    List.FieldByName('Machine').AsString := IMachine;
    List.FieldByName('Key').AsInteger := StrToInt(IKey);
    List.FieldByName('Lastupdate').AsDateTime := StrToDateTime(ILastupdate);
    List.FieldByName('ID').AsInteger := StrToInt(IID);
    List.FieldByName('User').AsString := IUser;
    List.FieldByName('Session').AsString := ISession;
    List.FieldByName('Hint').AsString := IHint;
    List.Post;
  end;

end;


procedure TLockProviderClient.GetAllLockList(aUserList: Tlp_UserList);
var
  DataSetString: string;
  User: Tlp_User;
begin

  aUserList.Clear;

  Init(true);

  ReceivedMessage := SendAndGetMsg('GETLOCKLISTALL');

  if pos('GETLOCKLISTALL', ReceivedMessage) = 0 then
  begin
    raise Exception.Create('response mismatch. could not get data.');
    exit;
  end;

  // ReceivedMessage auseinandernehmen?
  while pos('|', ReceivedMessage) <> 0 do
  begin

    User := aUserList.Add;

    Delete(ReceivedMessage, 1, pos('(', ReceivedMessage));

    DataSetString := copy(ReceivedMessage, 1, pos(')', ReceivedMessage) - 1);

    Delete(ReceivedMessage, 1, pos(')', ReceivedMessage));

    // '|' trennt werte!!!
    User.IncId := StrToInt(copy(DataSetString, 1, pos('|', DataSetString) - 1));
    Delete(DataSetString, 1, pos('|', DataSetString));

    User.Machine := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    User.Key := StrtoInt(copy(DataSetString, 1, pos('|', DataSetString) - 1));
    Delete(DataSetString, 1, pos('|', DataSetString));

    User.LastUpdate := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    User.Id := StrToInt(copy(DataSetString, 1, pos('|', DataSetString) - 1));
    Delete(DataSetString, 1, pos('|', DataSetString));

    User.User := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    User.Session := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    User.Hint := DataSetString;

  end;

end;


function TLockProviderClient.IsTableLocked(Key: integer): boolean;
begin
  Init(true);

  ReceivedMessage := SendAndGetMsg('ISTABLELOCKED ' + inttostr(MandantID) + '|' + inttostr(Key));

  if pos('ISTABLELOCKED', ReceivedMessage) = 0 then
  begin
    raise Exception.Create('response mismatch. could not get data.');
    exit;
  end;

  if pos('YES', ReceivedMessage) <> 0 then
    result := true
  else
    result := false;

end;

function TLockProviderClient.Login(User, Machine, Session: string; aErzwingeAnmeldung: Boolean; AppType: TAppType): integer;
var
  erzwingen : string;
begin
  erzwingen := 'F';
  Init(true);
  if aErzwingeAnmeldung then
     erzwingen := 'T';

  if AppType = AppTypeServer then
    ReceivedMessage := SendAndGetMsg('LOGIN '+ inttostr(MandantID) + '|' + User + '|' + Machine + '|' + Session + '|' + erzwingen +'|S')
  else
    ReceivedMessage := SendAndGetMsg('LOGIN '+ inttostr(MandantID) + '|' + User + '|' + Machine + '|' + Session + '|' + erzwingen +'|C');

  if pos('LOGIN', ReceivedMessage) = 0 then
  begin
    raise Exception.Create('response mismatch. could not get data.');
    exit;
  end;

  if pos('ERR', ReceivedMessage) <> 0 then
  begin
    if pos('MACHINE', ReceivedMessage) <> 0 then
      result := -2
    else
      result := -1;
  end
  else if pos('SESSIONCHECK', ReceivedMessage) <> 0 then
    result := 1
  else
    result := 0;

end;

procedure TLockProviderClient.Logout(User, Machine, Session: string);
begin
  Init(true);

  ReceivedMessage := SendAndGetMsg('LOGOUT ' + inttostr(MandantID) + '|' + User + '|' + Machine + '|' + Session);

  if pos('LOGOUT', ReceivedMessage) = 0 then
  begin
    raise Exception.Create('response mismatch. could not get data.');
    exit;
  end;

end;

procedure TLockProviderClient.GetUserList(var Users: TClientDataSet);
var
  DataSetString: string;
begin

  Init(true);

  ReceivedMessage := SendAndGetMsg('GETUSERLIST ' + inttostr(MandantID));

  if pos('GETUSERLIST', ReceivedMessage) = 0 then
  begin
    raise Exception.Create('response mismatch. could not get data.');
    exit;
  end;

  Users.Close;

  // DataSet Erzeugen
  Users.FieldDefs.Clear;

  with Users.FieldDefs.AddFieldDef do
  begin
    Name := 'User';
    DataType := ftString;
    Size := 40;
  end;

  with Users.FieldDefs.AddFieldDef do
  begin
    Name := 'Session';
    DataType := ftString;
    Size := 20;
  end;

  with Users.FieldDefs.AddFieldDef do
  begin
    Name := 'Machine';
    DataType := ftString;
    Size := 40;
  end;

  with Users.FieldDefs.AddFieldDef do
  begin
    Name := 'Lastupdate';
    DataType := ftDateTime;
  end;

  Users.CreateDataSet;

  while pos('|', ReceivedMessage) <> 0 do
  begin
    Delete(ReceivedMessage, 1, pos('(', ReceivedMessage));

    DataSetString := copy(ReceivedMessage, 1, pos(')', ReceivedMessage) - 1);

    Delete(ReceivedMessage, 1, pos(')', ReceivedMessage));

    // '|' trennt werte!!!
    Users.Append;
    Users.FieldByName('User').AsString := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    Users.FieldByName('Session').AsString := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    Users.FieldByName('Machine').AsString := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    Users.FieldByName('LastUpdate').AsDateTime := StrToDateTime(DataSetString);
    Users.Post;
  end;

end;


procedure TLockProviderClient.GetUserListAll(aUserList: Tlp_Userlist);
var
  DataSetString: string;
  User: Tlp_User;
begin

  aUserList.Clear;

  Init(true);

  ReceivedMessage := SendAndGetMsg('GETUSERLISTALL');

  if pos('GETUSERLISTALL', ReceivedMessage) = 0 then
  begin
    raise Exception.Create('response mismatch. could not get data.');
    exit;
  end;

  while pos('|', ReceivedMessage) <> 0 do
  begin
    User := aUserList.Add;
    Delete(ReceivedMessage, 1, pos('(', ReceivedMessage));

    DataSetString := copy(ReceivedMessage, 1, pos(')', ReceivedMessage) - 1);

    Delete(ReceivedMessage, 1, pos(')', ReceivedMessage));

    // '|' trennt werte!!!
    User.User := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    User.Session := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    User.Machine := copy(DataSetString, 1, pos('|', DataSetString) - 1);
    Delete(DataSetString, 1, pos('|', DataSetString));

    User.LastUpdate := DataSetString;
    //Users.FieldByName('LastUpdate').AsDateTime := StrToDateTime(DataSetString);
  end;

end;


function TLockProviderClient.IsLoggedIn(User: string): boolean;
begin
  Init(true);

  ReceivedMessage := SendAndGetMsg('ISLOGGEDIN ' + inttostr(MandantID) + '|' + User);

  if pos('ISLOGGEDIN', ReceivedMessage) = 0 then
  begin
    raise Exception.Create('response mismatch. could not get data.');
    exit;
  end;

  if pos('YES', ReceivedMessage) <> 0 then
    result := true
  else
    result := false;

end;

procedure TLockProviderClient.KillUser(User, Machine, Session: string);
begin

   Init(true);
  ReceivedMessage := SendAndGetMsg('KILLUSER ' + inttostr(MandantID) + '|' + User + '|' + Machine + '|' + Session);

  if pos('KILLUSER', ReceivedMessage) = 0 then
  begin
    raise Exception.Create('response mismatch. could not get data.');
    exit;
  end;

end;

procedure TLockProviderClient.GetLicenseInfo(var SerialNo: string; var CustomerInfo:string);
var
  ModuleString: string;
  Modulsnum: string;
begin

  Init(true);

  fModuleListe.Clear;

  ReceivedMessage := SendAndGetMsg('GETLICENSEINFO');

  if pos('GETLICENSEINFO', ReceivedMessage) = 0 then
  begin
    raise Exception.Create('response mismatch. could not get data.');
    exit;
  end;

  Delete(ReceivedMessage, 1, pos('(', ReceivedMessage));

  ReceivedMessage := copy(ReceivedMessage, 1, pos(')', ReceivedMessage) - 1);

  SerialNo := copy(ReceivedMessage, 1, pos('|', ReceivedMessage) - 1);
  Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

  ModuleString := copy(ReceivedMessage, 1, pos('|', ReceivedMessage) - 1);
  Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

//  CustomerInfo := ReceivedMessage;
  CustomerInfo := copy(ReceivedMessage, 1, pos('|', ReceivedMessage) - 1);
  Delete(ReceivedMessage, 1, pos('|', ReceivedMessage));

  fCurrentUserLimit := ReceivedMessage;

  while length(ModuleString) > 0 do
  begin
    Modulsnum := copy(ModuleString, 1, pos(';', ModuleString) - 1);
    fModuleListe.Add(Modulsnum);
    Delete(ModuleString, 1, pos(';', ModuleString));
  end;


end;

procedure TLockProviderClient.Prepare(aMandantID: integer);
begin
  MandantID := aMandantID;
end;

// SendAndGetMsg ---------------------------------------------------------------
function TLockProviderClient.SendAndGetMsg(MessageText: String): string;
var
  Timeout: boolean;

  // SENDEN --------------------------------------------------------------------
  function Senden(MessageText: String): boolean;
  begin
    // Message in Buffer schreiben
    MessageText := #1 + MessageText + #2;
    FConnection.Socket.SendText(AnsiString(MessageText));
    result := true;
  end;

// EMPFANGEN -----------------------------------------------------------------
  function Empfangen: string;
  var
    LastChar: char;
    Ticks: dword;
  begin
    // Verbindung aufbauen oder reaktivieren
    Init(true);

    // Buffer vorbereiten
    result := '';
    Ticks := GetTickCount;
    LastChar := #0;

    repeat

      if (GetTickCount - Ticks) > 20000 then
      begin
        Timeout := true;
        result := 'CMD ERR Timeout';
        break;
      end;

      result := result + string(FConnection.Socket.ReceiveText);

      if (pos(#2, result) > 0) then
        LastChar := #2;

      result := StringReplace(result, #1, '', [rfReplaceAll]);
      result := StringReplace(result, #2, '', [rfReplaceAll]);
      // break;

    until (LastChar = #2);

  end;

begin

  Timeout := false;
  Senden(MessageText);
  result := Empfangen;
  ErrTimeOut := Timeout;

  if Timeout then
  begin
    Timeout := false;
    Senden(MessageText);
    result := Empfangen;
    ErrTimeOut := Timeout;
    if Timeout then
      raise Exception.Create('request timed out');
  end;

end;

function TLockProviderClient.getActiveSession: string;
var
  SessionBase: string;
begin
  if CurrentActiveSession = '' then
  begin

    SessionBase := inttostr(GetTickCount);

    CurrentActiveSession := 'SSN';
    CurrentActiveSession := CurrentActiveSession + StringOfChar('0', 10 - length(SessionBase));
    CurrentActiveSession := CurrentActiveSession + SessionBase;

  end;
  result := CurrentActiveSession;

end;

function TLockProviderClient.getMachineName: string;
begin

  if (CurrentMachineName = '') then
    Init(true);

  result := CurrentMachineName;

end;

function TLockProvider.SessionValid(aSession: string): boolean;
var
  x: integer;
begin

  x := 0;
  result := false;
  while (x <= LoggedUserList.Count - 1) do
  begin
    if ((LoggedUserList[x] as TUserItem).Session = aSession) then
    begin
      result := true;
      break;
    end;

    inc(x);
  end;

end;

function TLockProvider.GetUserID(aUser, aSession, aMachine: string): integer;
var
  i: integer;
begin

  result := -1;

  for i := 0 to LoggedUserList.Count - 1 do
  begin
    if (TUserItem(LoggedUserList[i]).User = aUser) and
      (TUserItem(LoggedUserList[i]).Session = aSession) and
      (TUserItem(LoggedUserList[i]).Machine = aMachine) then
    begin
      result := i;
      break;
    end;
  end;

end;

procedure TLockProvider.RefreshSession(aSession: string);
var
  i: integer;
begin

  for i := 0 to LoggedUserList.Count - 1 do
  begin
    if (TUserItem(LoggedUserList[i]).Session = aSession) then
    begin
      TUserItem(LoggedUserList[i]).Lastupdate := now;
      break;
    end;
  end;

end;

procedure TLockProvider.Check(Sender: TObject);
var
  x: integer;
begin

  if SessionTimeout = 0 then
    exit;

  if KillTimeoutUser then
  begin
    x := 0;
    while (x <= LoggedUserList.Count - 1) do
    begin

      if (TUserItem(LoggedUserList[x]).Lastupdate < IncSecond(now,  SessionTimeout * -1)) then
      begin
        if Assigned(FOnLogUpdate) then
          FOnLogUpdate(self, 'Benutzer ' + TUserItem(LoggedUserList[x]).User +
                             ' hat Zeitlimit überschritten. Session wird gelöscht.');

        LoggedUserList.Delete(x);
      end;

      inc(x);
    end;
  end;

  x := 0;
  while (x <= LockItemList.Count - 1) do
  begin
    if (TLockItem(LockItemList[x]).Lastupdate) < IncSecond(now, SessionTimeout * -1) then
      LockItemList.Delete(x);

    inc(x);
  end;

  x := 0;
  while (x <= LockItemList.Count - 1) do
  begin
    if not SessionValid((LockItemList[x] As TLockItem).Session) then
      LockItemList.Delete(x);

    inc(x);
  end;

end;

procedure TLockProvider.setSessionExpireTime(aSeconds: integer;  aKillUser: boolean);
begin

  SessionTimeout := aSeconds;
  KillTimeoutUser := aKillUser;

end;

function TLockProvider.getHintInfos: string;
var
  x: integer;
begin

  result := '';

  for x := 0 to LoggedUserList.Count - 1 do
  begin
    result := result + TUserItem(LoggedUserList[x]).User + ' ' +
         DateTimeToStr(TUserItem(LoggedUserList[x]).Lastupdate) + ' ' +
                       TUserItem(LoggedUserList[x]).Machine + ' ' +
              inttostr(TUserItem(LoggedUserList[x]).Mandant) + slinebreak;
  end;

end;

function TLockProvider.getUserCount: integer;
begin

  result := LoggedUserList.Count;

end;

function TLockProvider.getLicencesCount: integer;
var
  x: integer;
  fingerprint: string;
  fingerprints: TStringlist;

begin

  fingerprints := TStringlist.Create;
  fingerprints.Duplicates := dupIgnore;
  fingerprints.Sorted := true;

  for x := 0 to getUserCount - 1 do
  begin
    if (TUserItem(LoggedUserList[x]).AppType = AppTypeClient) and
      (UpperCase(TUserItem(LoggedUserList[x]).User) <> 'SERVICE') then
    begin
      fingerprint := inttostr(TUserItem(LoggedUserList[x]).Mandant) + '|' +
                              TUserItem(LoggedUserList[x]).User + '|' +
                              TUserItem(LoggedUserList[x]).Machine;

      fingerprints.Add(fingerprint);
    end;
  end;

  result := fingerprints.Count;
  fingerprints.Free;

end;

{
  function TLockProvider.getNumberOfLoggedInClients(User: string; Machine: string; var SessionCheck: Boolean; Mandant: Integer): integer;
  var x: integer;
  begin

  // Benutzer vom gleichen Rechner werden nicht als neue Benutzer gezählt

  result := 0;
  x := 0;

  while (x <= LoggedUserList.Count - 1) do
  begin
  if ((LoggedUserList[x] as TUserItem).AppType = AppTypeClient) then
  inc(result);

  if ((LoggedUserList[x] as TUserItem).Mandant = Mandant) and
  ((LoggedUserList[x] as TUserItem).User = User) and
  ((LoggedUserList[x] as TUserItem).Machine = Machine) then
  begin
  SessionCheck := true;  // Bewirkt, dass die "Sie sind bereits angemeldet" Maske angezeigt wird.
  Dec(result);
  end;

  inc(x);
  end;
  end;
}

function TLockProviderClient.getCurrentUserLimit: string;
begin
  if not LicenseQueried then
  begin
    GetLicenseInfo(SerialNo, CustomerInfo);
    LicenseQueried := true;
  end;
  result := fCurrentUserLimit;
end;

function TLockProviderClient.getCustomerInfo: string;
begin

  if not LicenseQueried then
  begin
    GetLicenseInfo(SerialNo, CustomerInfo);
    LicenseQueried := true;
  end;

  result := CustomerInfo;

end;

function TLockProviderClient.getSerialNo: string;
begin

  if not LicenseQueried then
  begin
    GetLicenseInfo(SerialNo, CustomerInfo);
    LicenseQueried := true;
  end;

  result := SerialNo;

end;

function TLockProviderClient.isActiveModule(aModule: integer): boolean;
var
  i: integer;
  gefunden: boolean;
begin

  if not LicenseQueried then
  begin
    GetLicenseInfo(SerialNo, CustomerInfo);
    LicenseQueried := true;
  end;

  gefunden := false;

  for i := 0 to fModuleListe.Count - 1 do
  begin
    if fModuleListe[i] = inttostr(aModule) then
    begin
      gefunden := true;
      break;
    end;
  end;
  result := gefunden;

end;

function TLockProviderClient.getEmptyHandle: integer;
var
  User, Session, Hint: string;

begin

  User := 'temp';
  Session := '';
  Hint := '';

  repeat
    result := AddLock('temp', 999999, 999999, User, Session, Hint);

    if result = -1 then
      KillUser('temp', 'temp', 'SSNALL');

    if result <> -1 then
      DelLock(result);

  until (result <> -1);

end;

end.

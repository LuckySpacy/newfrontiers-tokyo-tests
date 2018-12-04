object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 560
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 912
    Height = 560
    ActivePage = tbs_Sendungsverfolgung
    Align = alClient
    TabOrder = 0
    object tbs_Einstellung: TTabSheet
      Caption = 'Einstellung'
      object Label5: TLabel
        Left = 32
        Top = 255
        Width = 13
        Height = 13
        Caption = 'Url'
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 24
        Width = 313
        Height = 89
        Caption = 'Authentication'
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 28
          Width = 43
          Height = 13
          Caption = 'Benutzer'
        end
        object Label2: TLabel
          Left = 16
          Top = 55
          Width = 44
          Height = 13
          Caption = 'Passwort'
        end
        object edt_Authentication_User: TEdit
          Left = 88
          Top = 25
          Width = 193
          Height = 21
          TabOrder = 0
          Text = 'edt_Authentication_User'
          OnExit = EditExit
        end
        object edt_Authentication_Password: TEdit
          Left = 88
          Top = 52
          Width = 193
          Height = 21
          TabOrder = 1
          Text = 'Edit1'
          OnExit = EditExit
        end
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 128
        Width = 313
        Height = 89
        Caption = 'Cis Authentication'
        TabOrder = 1
        object Label3: TLabel
          Left = 16
          Top = 28
          Width = 43
          Height = 13
          Caption = 'Benutzer'
        end
        object Label4: TLabel
          Left = 16
          Top = 55
          Width = 44
          Height = 13
          Caption = 'Passwort'
        end
        object edt_cis_User: TEdit
          Left = 88
          Top = 25
          Width = 193
          Height = 21
          TabOrder = 0
          Text = 'edt_Authentication_User'
          OnExit = EditExit
        end
        object edt_cis_Password: TEdit
          Left = 88
          Top = 52
          Width = 193
          Height = 21
          TabOrder = 1
          Text = 'Edit1'
          OnExit = EditExit
        end
      end
      object edt_Url: TEdit
        Left = 51
        Top = 252
        Width = 406
        Height = 21
        TabOrder = 2
        Text = 'edt_Url'
        OnExit = EditExit
      end
    end
    object tbs_Version: TTabSheet
      Caption = 'Version'
      ImageIndex = 1
    end
    object tbs_ShipmentOrder: TTabSheet
      Caption = 'ShipmentOrder'
      ImageIndex = 2
    end
    object tbs_ValidateShipmentOrder: TTabSheet
      Caption = 'ValidateShipmentOrder'
      ImageIndex = 3
    end
    object tbs_Sendungsverfolgung: TTabSheet
      Caption = 'Sendungsverfolgung'
      ImageIndex = 4
    end
  end
  object HTTPRIO1: THTTPRIO
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 548
    Top = 184
  end
end

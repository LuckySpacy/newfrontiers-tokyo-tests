object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 559
  ClientWidth = 1216
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 32
    Top = 47
    Width = 1161
    Height = 482
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object btn_SASL: TButton
    Left = 136
    Top = 16
    Width = 75
    Height = 25
    Caption = 'SASL'
    TabOrder = 2
    OnClick = btn_SASLClick
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    Body.Strings = (
      'Ich bin ein Test '#252'ber O365.')
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
        Address = 'theisel@anamed-gele.com'
        Name = 'Thomas Heisel'
        Text = 'Thomas Heisel <theisel@anamed-gele.com>'
        Domain = 'anamed-gele.com'
        User = 'theisel'
      end>
    From.Address = 'theisel@anamed-gele.com'
    From.Name = 'Thomas Heisel'
    From.Text = 'Thomas Heisel <theisel@anamed-gele.com>'
    From.Domain = 'anamed-gele.com'
    From.User = 'theisel'
    ReceiptRecipient.Address = 'bachmann@new-frontiers.de'
    ReceiptRecipient.Name = 'Thomas'
    ReceiptRecipient.Text = 'Thomas <bachmann@new-frontiers.de>'
    ReceiptRecipient.Domain = 'new-frontiers.de'
    ReceiptRecipient.User = 'bachmann'
    Recipients = <
      item
        Address = 'bachmann@new-frontiers.de'
        Name = 'Thomas'
        Text = 'Thomas <bachmann@new-frontiers.de>'
        Domain = 'new-frontiers.de'
        User = 'bachmann'
      end>
    InReplyTo = '<theisel@anamed-gele.com>'
    ReplyTo = <>
    Subject = 'Ich bin ein Test.'
    Sender.Address = 'theisel@anamed-gele.com'
    Sender.Text = 'theisel@anamed-gele.com'
    Sender.Domain = 'anamed-gele.com'
    Sender.User = 'theisel'
    ConvertPreamble = True
    Left = 240
    Top = 112
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 680
    Top = 224
  end
  object IdSMTP2: TIdSMTP
    SASLMechanisms = <>
    Left = 832
    Top = 120
  end
  object IdUserPassProvider1: TIdUserPassProvider
    Left = 384
    Top = 72
  end
end

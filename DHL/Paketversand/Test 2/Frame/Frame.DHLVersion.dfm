object fra_DHLVersion: Tfra_DHLVersion
  Left = 0
  Top = 0
  Width = 695
  Height = 417
  TabOrder = 0
  object Button1: TButton
    Left = 16
    Top = 32
    Width = 177
    Height = 25
    Caption = 'Versionsinformation holen'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edt_majorRelease: TLabeledEdit
    Left = 96
    Top = 80
    Width = 137
    Height = 21
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'major Release'
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object edt_minorRelease: TLabeledEdit
    Left = 96
    Top = 107
    Width = 137
    Height = 21
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = 'minor Release'
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object edt_Build: TLabeledEdit
    Left = 96
    Top = 134
    Width = 137
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'build'
    LabelPosition = lpLeft
    TabOrder = 3
  end
end

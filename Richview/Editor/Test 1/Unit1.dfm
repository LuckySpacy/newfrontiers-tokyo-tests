object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 563
  ClientWidth = 1132
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = pop
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object rv: TNFSRichViewEdit
    Left = 29
    Top = 321
    Width = 860
    Height = 211
    ReadOnly = False
    PopupMenu = NFSRichviewPopUp1
    TabOrder = 0
    DoInPaletteMode = rvpaCreateCopies
    RTFReadProperties.TextStyleMode = rvrsAddIfNeeded
    RTFReadProperties.ParaStyleMode = rvrsAddIfNeeded
    RVFOptions = [rvfoSavePicturesBody, rvfoSaveControlsBody, rvfoSaveBinary, rvfoSaveTextStyles, rvfoSaveParaStyles, rvfoSaveDocProperties, rvfoLoadDocProperties, rvfoSaveDocObjects, rvfoLoadDocObjects]
  end
  object Button1: TButton
    Left = 895
    Top = 56
    Width = 75
    Height = 25
    Caption = 'LiveSpelling'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 895
    Top = 87
    Width = 122
    Height = 25
    Caption = 'Stop LiveSpelling'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 895
    Top = 118
    Width = 122
    Height = 25
    Caption = 'Nummerieren'
    TabOrder = 2
    OnClick = Button3Click
  end
  object SpinEdit1: TSpinEdit
    Left = 1023
    Top = 118
    Width = 57
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 0
  end
  object btn_Sichtbar: TButton
    Left = 903
    Top = 149
    Width = 122
    Height = 25
    Caption = 'Sichtbar'
    TabOrder = 5
    OnClick = btn_SichtbarClick
  end
  object Panel1: TPanel
    Left = 895
    Top = 223
    Width = 257
    Height = 170
    Caption = 'Panel1'
    TabOrder = 6
    object NfsLabel1: TNfsLabel
      Left = 64
      Top = 47
      Width = 65
      Height = 17
      Caption = 'NfsLabel1'
      MinFontSize = 8
    end
    object NFSCustomPanel1: TNFSCustomPanel
      Left = 80
      Top = 152
      Width = 185
      Height = 41
    end
  end
  object Toolbar: TNFSRichViewtoolbar
    Left = 40
    Top = 16
    Width = 870
    Height = 24
    BevelOuter = bvNone
    FontSizeBox.Visible = True
    Fontbox.Visible = True
    Fontbox.Margins.Top = 1
    Fontbox.Margins.Bottom = 0
    Fontbox.Witdh = 145
    Buttons.Bold.Visible = True
    Buttons.Bold.Margins.Left = 0
    Buttons.Bold.Margins.Top = 0
    Buttons.Bold.Margins.Right = 0
    Buttons.Bold.Margins.Bottom = 0
    Buttons.Italic.Visible = True
    Buttons.Italic.Margins.Left = 0
    Buttons.Italic.Margins.Top = 0
    Buttons.Italic.Margins.Right = 0
    Buttons.Italic.Margins.Bottom = 0
    Buttons.Underline.Visible = True
    Buttons.Underline.Margins.Left = 0
    Buttons.Underline.Margins.Top = 0
    Buttons.Underline.Margins.Right = 0
    Buttons.Underline.Margins.Bottom = 0
    Buttons.Left.Visible = True
    Buttons.Left.Margins.Left = 0
    Buttons.Left.Margins.Top = 0
    Buttons.Left.Margins.Right = 0
    Buttons.Left.Margins.Bottom = 0
    Buttons.Center.Visible = True
    Buttons.Center.Margins.Left = 0
    Buttons.Center.Margins.Top = 0
    Buttons.Center.Margins.Right = 0
    Buttons.Center.Margins.Bottom = 0
    Buttons.Right.Visible = True
    Buttons.Right.Margins.Left = 0
    Buttons.Right.Margins.Top = 0
    Buttons.Right.Margins.Right = 0
    Buttons.Right.Margins.Bottom = 0
    Buttons.Justify.Visible = True
    Buttons.Justify.Margins.Left = 0
    Buttons.Justify.Margins.Top = 0
    Buttons.Justify.Margins.Right = 0
    Buttons.Justify.Margins.Bottom = 0
    Buttons.Fontcolor.Visible = True
    Buttons.Fontcolor.Margins.Left = 0
    Buttons.Fontcolor.Margins.Top = 0
    Buttons.Fontcolor.Margins.Right = 0
    Buttons.Fontcolor.Margins.Bottom = 0
    Buttons.Backgroundcolor.Visible = True
    Buttons.Backgroundcolor.Margins.Left = 0
    Buttons.Backgroundcolor.Margins.Top = 0
    Buttons.Backgroundcolor.Margins.Right = 0
    Buttons.Backgroundcolor.Margins.Bottom = 0
    Buttons.ParagraphBackground.Visible = True
    Buttons.ParagraphBackground.Margins.Left = 0
    Buttons.ParagraphBackground.Margins.Top = 0
    Buttons.ParagraphBackground.Margins.Right = 0
    Buttons.ParagraphBackground.Margins.Bottom = 0
    Buttons.Bullets.Visible = True
    Buttons.Bullets.Margins.Left = 0
    Buttons.Bullets.Margins.Top = 0
    Buttons.Bullets.Margins.Right = 0
    Buttons.Bullets.Margins.Bottom = 0
    Buttons.Number.Visible = True
    Buttons.Number.Margins.Left = 0
    Buttons.Number.Margins.Top = 0
    Buttons.Number.Margins.Right = 0
    Buttons.Number.Margins.Bottom = 0
    Buttons.Save.Visible = True
    Buttons.Save.Margins.Left = 0
    Buttons.Save.Margins.Top = 0
    Buttons.Save.Margins.Right = 0
    Buttons.Save.Margins.Bottom = 0
    Buttons.Open.Visible = True
    Buttons.Open.Margins.Left = 0
    Buttons.Open.Margins.Top = 0
    Buttons.Open.Margins.Right = 0
    Buttons.Open.Margins.Bottom = 0
    Buttons.Picture.Visible = True
    Buttons.Picture.Margins.Left = 0
    Buttons.Picture.Margins.Top = 0
    Buttons.Picture.Margins.Right = 0
    Buttons.Picture.Margins.Bottom = 0
    Buttons.LargeEditor.Visible = True
    Buttons.LargeEditor.Margins.Left = 0
    Buttons.LargeEditor.Margins.Top = 0
    Buttons.LargeEditor.Margins.Right = 0
    Buttons.LargeEditor.Margins.Bottom = 0
    Buttons.TextHoch.Visible = True
    Buttons.TextHoch.Margins.Left = 0
    Buttons.TextHoch.Margins.Top = 0
    Buttons.TextHoch.Margins.Right = 0
    Buttons.TextHoch.Margins.Bottom = 0
    Buttons.TextTief.Visible = True
    Buttons.TextTief.Margins.Left = 0
    Buttons.TextTief.Margins.Top = 0
    Buttons.TextTief.Margins.Right = 0
    Buttons.TextTief.Margins.Bottom = 0
    Buttons.Standardfont.Visible = True
    Buttons.Standardfont.Margins.Left = 0
    Buttons.Standardfont.Margins.Top = 0
    Buttons.Standardfont.Margins.Right = 0
    Buttons.Standardfont.Margins.Bottom = 0
    Buttons.Fontfavoriten.Visible = True
    Buttons.Fontfavoriten.Margins.Left = 0
    Buttons.Fontfavoriten.Margins.Top = 0
    Buttons.Fontfavoriten.Margins.Right = 0
    Buttons.Fontfavoriten.Margins.Bottom = 0
    Buttons.IndentInc.Visible = True
    Buttons.IndentInc.Margins.Left = 0
    Buttons.IndentInc.Margins.Top = 0
    Buttons.IndentInc.Margins.Right = 0
    Buttons.IndentInc.Margins.Bottom = 0
    Buttons.IndentDec.Visible = True
    Buttons.IndentDec.Margins.Left = 0
    Buttons.IndentDec.Margins.Top = 0
    Buttons.IndentDec.Margins.Right = 0
    Buttons.IndentDec.Margins.Bottom = 0
    Buttons.Linespace.Visible = True
    Buttons.Linespace.Margins.Left = 0
    Buttons.Linespace.Margins.Top = 0
    Buttons.Linespace.Margins.Right = 0
    Buttons.Linespace.Margins.Bottom = 0
    Buttons.Print.Visible = True
    Buttons.Print.Margins.Left = 0
    Buttons.Print.Margins.Top = 0
    Buttons.Print.Margins.Right = 0
    Buttons.Print.Margins.Bottom = 0
    Buttons.Clipboard.Visible = True
    Buttons.Clipboard.Margins.Left = 0
    Buttons.Clipboard.Margins.Top = 0
    Buttons.Clipboard.Margins.Right = 0
    Buttons.Clipboard.Margins.Bottom = 0
    Buttons.Reverse.Visible = True
    Buttons.Reverse.Margins.Left = 0
    Buttons.Reverse.Margins.Top = 0
    Buttons.Reverse.Margins.Right = 0
    Buttons.Reverse.Margins.Bottom = 0
    Buttons.Cut.Visible = True
    Buttons.Cut.Margins.Left = 0
    Buttons.Cut.Margins.Top = 0
    Buttons.Cut.Margins.Right = 0
    Buttons.Cut.Margins.Bottom = 0
    Buttons.Paste.Visible = True
    Buttons.Paste.Margins.Left = 0
    Buttons.Paste.Margins.Top = 0
    Buttons.Paste.Margins.Right = 0
    Buttons.Paste.Margins.Bottom = 0
    Buttons.SpellCheck.Visible = True
    Buttons.SpellCheck.Margins.Left = 0
    Buttons.SpellCheck.Margins.Top = 0
    Buttons.SpellCheck.Margins.Right = 0
    Buttons.SpellCheck.Margins.Bottom = 0
    RichviewEdit = rv
    ButtonFrameColor = clSilver
    UseButtonFrame = False
    Positions.Bold = 1
    Positions.Italic = 3
    Positions.Underline = 2
    Positions.Left = 4
    Positions.Center = 5
    Positions.Right = 6
    Positions.Justify = 7
    Positions.Fontcolor = 10
    Positions.Backgroundcolor = 28
    Positions.ParagraphBackground = 30
    Positions.Bullets = 13
    Positions.Number = 14
    Positions.Save = 20
    Positions.Open = 21
    Positions.Picture = 22
    Positions.LargeEditor = 12
    Positions.TextHoch = 18
    Positions.TextTief = 19
    Positions.Standardfont = 11
    Positions.Fontfavoriten = 8
    Positions.IndentInc = 15
    Positions.IndentDec = 16
    Positions.Linespace = 17
    Positions.Print = 23
    Positions.Clipboard = 24
    Positions.Reverse = 25
    Positions.Cut = 26
    Positions.Paste = 27
    Positions.SpellCheck = 31
    Positions.Fontbox = 2
    Positions.Fontsize = 9
    Hunspell = NFSRvHunspell1
  end
  object Button4: TButton
    Left = 760
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 760
    Top = 223
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 975
    Top = 16
    Width = 105
    Height = 25
    Caption = 'ReadOnly = true'
    TabOrder = 10
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 991
    Top = 47
    Width = 105
    Height = 25
    Caption = 'ReadOnly = false'
    TabOrder = 11
    OnClick = Button7Click
  end
  object NFSCustomPanel2: TNFSCustomPanel
    Left = 536
    Top = 140
    Width = 185
    Height = 41
  end
  object pop: TPopupMenu
    Left = 752
    Top = 112
    object Hallo1: TMenuItem
      Caption = 'Hallo'
      OnClick = Hallo1Click
    end
  end
  object NFSRichviewPopUp1: TNFSRichviewPopUp
    RichviewEdit = rv
    Left = 408
    Top = 208
    object mnu_HDatei: TMenuItem
      Caption = 'Datei'
      object mnu_Oeffnen: TMenuItem
        Caption = #214'ffnen'
      end
      object mnu_Speichern: TMenuItem
        Caption = 'Speichern'
      end
      object mnu_AllesEntfernen: TMenuItem
        Caption = 'Alles entfernen'
      end
      object mnu_Druckvorschau: TMenuItem
        Caption = 'Druckvorschau'
      end
      object mnu_Drucken: TMenuItem
        Caption = 'Drucken'
      end
    end
    object mnu_HBearbeiten: TMenuItem
      Caption = 'Bearbeiten'
      object mnu_Rueckgaengig: TMenuItem
        Caption = 'R'#252'ckg'#228'ngig'
        ShortCut = 16474
      end
      object mnu_Strich1: TMenuItem
        Caption = '-'
      end
      object mnu_Ausschneiden: TMenuItem
        Caption = 'Ausschneiden'
        ShortCut = 16472
      end
      object mnu_Kopieren: TMenuItem
        Caption = 'Kopieren'
        ShortCut = 16451
      end
      object mnu_Einfuegen: TMenuItem
        Caption = 'Einf'#252'gen'
        ShortCut = 16470
      end
      object mnu_Loeschen: TMenuItem
        Caption = 'L'#246'schen'
        ShortCut = 46
      end
      object mnu_Strich2: TMenuItem
        Caption = '-'
      end
      object mnu_AllesMarkieren: TMenuItem
        Caption = 'Alles markieren'
        ShortCut = 16449
      end
      object mnu_Suchen: TMenuItem
        Caption = 'Suchen'
        ShortCut = 16454
      end
      object mnu_SuchenUndErsetzen: TMenuItem
        Caption = 'Suchen und Ersetzen'
        ShortCut = 16456
      end
      object mnu_Strich3: TMenuItem
        Caption = '-'
      end
      object mnu_Seitenumbruch: TMenuItem
        Caption = 'Seitenumbruch'
      end
    end
    object mnu_HEinfuegen: TMenuItem
      Caption = 'Einf'#252'gen'
      object mnu_DateiEinfuegen: TMenuItem
        Caption = 'Datei einf'#252'gen'
      end
      object mnu_BildEinfuegen: TMenuItem
        Caption = 'Bild einf'#252'gen'
      end
      object mnu_Linie: TMenuItem
        Caption = 'Linie'
      end
    end
    object mnu_HTabelle: TMenuItem
      Caption = 'Tabelle'
      object mnu_TabEinfuegen: TMenuItem
        Caption = 'Tabelle einf'#252'gen'
      end
      object mnu_TabelleEinfuegen: TMenuItem
        Caption = 'Einf'#252'gen'
        object mnu_ZeileEinfuegen: TMenuItem
          Caption = 'Zeile einf'#252'gen'
        end
        object mnu_SpalteLinksEinfuegen: TMenuItem
          Caption = 'Spalte links einf'#252'gen'
        end
        object mnu_SpalteRechtsEinfuengen: TMenuItem
          Caption = 'Spalte rechts einf'#252'gen'
        end
      end
      object mnu_ZLoeschen: TMenuItem
        Caption = 'L'#246'schen'
        object mnuZeileLoeschen: TMenuItem
          Caption = 'Zeile l'#246'schen'
        end
        object mnu_SpalteLoeschen: TMenuItem
          Caption = 'Spalte l'#246'schen'
        end
      end
      object mnu_Verbinden: TMenuItem
        Caption = 'Verbinden'
        object mnu_ZeilenVerbinden: TMenuItem
          Caption = 'Zeilen verbinden'
        end
      end
      object mnu_Trennen: TMenuItem
        Caption = 'Trennen'
        object mnu_ZeilenTrennen: TMenuItem
          Caption = 'Zeilen trennen'
        end
        object mnu_SpaltenTrennen: TMenuItem
          Caption = 'Spalten trennen'
        end
        object mnu_SpaltenUndZeilenTrennen: TMenuItem
          Caption = 'Spalten und Zeilen trennen'
        end
      end
      object mnu_Splitten: TMenuItem
        Caption = 'Splitten'
        object mnu_ZelleHorSplitten: TMenuItem
          Caption = 'Zelle Horizontal splitten'
        end
        object mnu_ZelleVerSplitten: TMenuItem
          Caption = 'Zelle Vertikal splitten'
        end
      end
    end
    object mnu_HZwischenablage: TMenuItem
      Caption = 'Zwischenablage'
      object mnu_Format_Zwischenablage: TMenuItem
        Caption = 'Formatierung aus Zwischenablage beibehalten'
      end
    end
  end
  object NFSRvHunspell1: TNFSRvHunspell
    Spell.FormStyle = rvhfClassic
    Spell.DLLName = 'hunspell32.dll'
    Spell.DLLDir = 'C:\Users\tbachmann.GB\AppData\Roaming\Optima\Hunspell\TBACH\'
    Spell.DictName = 'German.dic'
    Spell.DictDir = 'C:\Users\tbachmann.GB\AppData\Roaming\Optima\Hunspell\TBACH\'
    Spell.DictCustomerName = 'Custom.woe'
    Spell.DictCustomerDir = 'C:\Users\tbachmann.GB\AppData\Roaming\Optima\Hunspell\TBACH\'
    Spell.UseSpell = False
    Spell.UseSpellOnlyWriteCapability = True
    Left = 432
    Top = 104
  end
end

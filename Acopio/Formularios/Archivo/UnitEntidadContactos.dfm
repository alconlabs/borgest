object EntidadContactos: TEntidadContactos
  Left = 0
  Top = 0
  Caption = 'Contactos'
  ClientHeight = 200
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object panelgrilla: TAdvPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 200
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '1.7.5.1'
    AutoHideChildren = False
    BorderColor = clGray
    Caption.Color = clWhite
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clBtnFace
    CollapsDelay = 0
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BevelInner = True
    StatusBar.BorderColor = clNone
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clBlack
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Text = 'F9-Aceptar'
    StatusBar.Visible = True
    Styler = Princ.AdvPanelStyler1
    FullHeight = 0
    object Label4: TLabel
      Left = 7
      Top = 15
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nombre y Apellido'
    end
    object Label1: TLabel
      Left = 59
      Top = 38
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Puesto'
    end
    object Label3: TLabel
      Left = 43
      Top = 61
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro Celular'
    end
    object Label2: TLabel
      Left = 67
      Top = 84
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Email'
    end
    object Label5: TLabel
      Left = 21
      Top = 119
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observaciones'
    end
    object btncancelar: TButton
      Left = 404
      Top = 146
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    object btnaceptar: TButton
      Left = 330
      Top = 146
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 5
      OnClick = btnaceptarClick
    end
    object entcontacto_celular: TDBAdvEdit
      Left = 102
      Top = 57
      Width = 121
      Height = 21
      EditType = etNumeric
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      TabOrder = 2
      Text = '0'
      Visible = True
      Version = '2.7.0.5'
    end
    object entcontacto_nombre: TEdit
      Left = 101
      Top = 12
      Width = 378
      Height = 21
      TabOrder = 0
    end
    object entcontacto_puesto: TEdit
      Left = 101
      Top = 34
      Width = 218
      Height = 21
      TabOrder = 1
    end
    object entcontacto_email: TEdit
      Left = 101
      Top = 80
      Width = 218
      Height = 21
      TabOrder = 3
    end
    object entcontacto_observaciones: TEdit
      Left = 101
      Top = 116
      Width = 378
      Height = 21
      TabOrder = 4
    end
  end
  object ZQEntidadContactos: TZQuery
    Connection = Princ.ZBase
    CachedUpdates = True
    SQL.Strings = (
      'select * from entidadcontactos'
      'where entcontacto_id=-1')
    Params = <>
    Left = 328
  end
  object AdvPopupMenu1: TAdvPopupMenu
    Version = '2.0.0.0'
    Left = 368
    Top = 48
    object Codigodereferencia1: TMenuItem
      Caption = 'Codigo de referencia'
    end
    object Historial1: TMenuItem
      Caption = 'Historial de Ventas'
    end
  end
end

object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 215
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Counter: TLabel
    Left = 328
    Top = 26
    Width = 39
    Height = 13
    Caption = 'Counter'
  end
  object ThreadCount: TLabel
    Left = 328
    Top = 61
    Width = 63
    Height = 13
    Caption = 'ThreadCount'
  end
  object Label1: TLabel
    Left = 247
    Top = 26
    Width = 67
    Height = 13
    Caption = 'Work Counter'
  end
  object Label2: TLabel
    Left = 248
    Top = 61
    Width = 66
    Height = 13
    Caption = 'Thread Count'
  end
  object Button1: TButton
    Left = 35
    Top = 21
    Width = 143
    Height = 25
    Caption = 'Run with no thread pool'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 80
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Button2: TButton
    Left = 35
    Top = 56
    Width = 143
    Height = 25
    Caption = 'Run with thread pool'
    TabOrder = 2
    OnClick = Button2Click
  end
end

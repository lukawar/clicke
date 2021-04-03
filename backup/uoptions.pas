unit uoptions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dbf, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DBGrids, StdCtrls, DBCtrls, Windows, Messages, Variants;

type

  { TFOptions }
  MouseLLHookStruct = record
    pt          : TPoint;
    mouseData   : cardinal;
    flags       : cardinal;
    time        : cardinal;
    dwExtraInfo : cardinal;
  end;

  TFOptions = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DBEdit1: TDBEdit;
    DBposx: TDBEdit;
    DBPosy: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ToggleBox1: TToggleBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private

  public

  end;

  function LowLevelMouseHookProc(nCode: integer; wParam: WPARAM; lParam : LPARAM): LRESULT; stdcall;

var
  FOptions: TFOptions;
  mHook : cardinal;

implementation
  uses UClicker;

{$R *.lfm}

{ TFOptions }

procedure TFOptions.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFOptions.Button2Click(Sender: TObject);
begin
  FClicker.Dbf.Insert;
end;

procedure TFOptions.Button3Click(Sender: TObject);
begin
  FClicker.Dbf.Edit;
end;

procedure TFOptions.Button4Click(Sender: TObject);
begin
  FClicker.Dbf.Post;
end;

procedure TFOptions.Button5Click(Sender: TObject);
begin
  FClicker.Dbf.Delete;
end;

procedure TFOptions.ToggleBox1Change(Sender: TObject);
const
 WH_MOUSE_LL = 14;
begin
  if(ToggleBox1.Checked) then begin
    Screen.Cursor := crHandPoint;
    mHook := SetWindowsHookEx(WH_MOUSE_LL, @LowLevelMouseHookProc, hInstance, 0);

  end;
end;

function LowLevelMouseHookProc(nCode: integer; wParam: WPARAM; lParam : LPARAM): LRESULT; stdcall;
var
  info : ^MouseLLHookStruct absolute lParam;
begin
  result := CallNextHookEx(mHook, nCode, wParam, lParam);
  with info^ do begin
    case wParam of
      wm_lbuttondown : begin
        FOptions.DBPosx.Text:=IntToStr(pt.x);
        FOptions.DBPosy.Text:=IntToStr(pt.y);
        UnhookWindowsHookEx(mHook);
        FOptions.ToggleBox1.Checked:=false;
      end;
    end;
  end;
end;

end.


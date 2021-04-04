unit uoptions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dbf, Forms, Controls, Graphics, Dialogs, umodalback,
  ExtCtrls, DBGrids, StdCtrls, DBCtrls, Windows, Messages, Variants, LCLType, DB;

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
    Button6: TButton;
    DBEdit1: TDBEdit;
    DBposx: TDBEdit;
    DBPosy: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupSave: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupButtons: TPanel;
    ToggleBox1: TToggleBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DBposxChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private

  public

  end;

  function LowLevelMouseHookProc(nCode: integer; wParam: WPARAM; lParam : LPARAM): LRESULT; stdcall;
  function drawCircle():boolean;

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
  GroupSave.Enabled:=true;
  GroupButtons.Enabled:=false;
  FClicker.Dbf.Insert;
end;

procedure TFOptions.Button3Click(Sender: TObject);
begin
  GroupSave.Enabled:=true;
  GroupButtons.Enabled:=false;
  FClicker.Dbf.Edit;
end;

procedure TFOptions.Button4Click(Sender: TObject);
begin
  GroupSave.Enabled:=false;
  GroupButtons.Enabled:=true;
  FClicker.Dbf.Post;
  GroupSave.Enabled:=false;
  //getAllActiveRecords();
end;

procedure TFOptions.Button5Click(Sender: TObject);
var
  Reply: Integer;
begin
  Reply := Application.MessageBox('Usunąć rekord?', 'Clicker', MB_YESNO);
  if Reply = IDYES then
     FClicker.Dbf.Delete;
end;

procedure TFOptions.Button6Click(Sender: TObject);
begin
  GroupSave.Enabled:=false;
  GroupButtons.Enabled:=true;
  FClicker.Dbf.Cancel;
end;

procedure TFOptions.DBposxChange(Sender: TObject);
begin
  drawCircle();
end;

procedure TFOptions.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if(FModalBack.Showing=true) then FModalBack.Close;
end;

procedure TFOptions.FormShow(Sender: TObject);
begin
  drawCircle();
end;

procedure TFOptions.ToggleBox1Change(Sender: TObject);
const
 WH_MOUSE_LL = 14;
begin
  ToggleBox1.Caption:='Kliknij w wybrane miejsce';
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

        FModalBack.Shape.Left:=pt.x - 10;
        FModalBack.Shape.Top:=pt.y - 10;

        FOptions.Cursor:=crArrow;
        FOptions.ToggleBox1.Checked:=false;
        FOptions.ToggleBox1.Caption:='Wybierz miejsce kliknięcia';
      end;
    end;
  end;
end;

function drawCircle():boolean;
begin
  if(FClicker.DSDbf.DataSet.State=dsBrowse) then
     begin
       FModalBack.Shape.Left:=FClicker.DSDbf.DataSet.FieldByName('posx').asInteger - 10;
       FModalBack.Shape.Top:=FClicker.DSDbf.DataSet.FieldByName('posy').asInteger - 10;

       FModalBack.Label1.Caption:=FClicker.DSDbf.DataSet.FieldByName('posx').asString;
       FModalBack.Label2.Caption:=FClicker.DSDbf.DataSet.FieldByName('posy').asString;
       result:=true;
     end
  else result:=false;
end;

end.


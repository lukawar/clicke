unit UClicker;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, Menus,
  ExtCtrls;

type

  { TFClicker }

  TFClicker = class(TForm)
    MenuItem3: TMenuItem;
    StopApp: TAction;
    DisplayForm: TAction;
    ActionList: TActionList;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    PopupMenu1: TPopupMenu;
    TrayIcon: TTrayIcon;
    procedure DisplayFormExecute(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure StopAppExecute(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
  private

  public

  end;

var
  FClicker: TFClicker;

implementation

{$R *.lfm}

{ TFClicker }



procedure TFClicker.FormShow(Sender: TObject);
begin
  FClicker.Hide;
  FClicker.ShowInTaskBar:=stNever;
end;

procedure TFClicker.FormWindowStateChange(Sender: TObject);
begin
  if FClicker.WindowState=wsMinimized then begin
      FClicker.WindowState:=wsNormal;
      FClicker.Hide;
      FClicker.ShowInTaskBar:=stNever;

  end;
end;

procedure TFClicker.StopAppExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFClicker.TrayIconClick(Sender: TObject);
begin

end;

procedure TFClicker.MenuItem1Click(Sender: TObject);
begin

end;

procedure TFClicker.DisplayFormExecute(Sender: TObject);
begin
  FClicker.Show;
  FClicker.WindowState:=wsNormal;
end;

end.


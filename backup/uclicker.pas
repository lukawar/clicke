unit UClicker;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, Menus,
  ExtCtrls, uabout, uoptions, umodalback, DB, dbf, StdCtrls, Windows;

type

  { TFClicker }
  TClickRecord = record
    posx : integer;
    posy : integer;
    hour : string;
  end;

  TFClicker = class(TForm)
    About: TAction;
    DbfACTIVE: TBooleanField;
    DbfDATE: TStringField;
    DbfID: TLongintField;
    DbfINTERVAL: TLargeintField;
    DbfNAME: TStringField;
    DbfPOSX: TLongintField;
    DbfPOSY: TLongintField;
    DbfTYPE: TStringField;
    DSDbf: TDataSource;
    Dbf: TDbf;
    MenuItem3: TMenuItem;
    StopApp: TAction;
    DisplayForm: TAction;
    ActionList: TActionList;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    PopupMenu1: TPopupMenu;
    Timer: TTimer;
    TrayIcon: TTrayIcon;
    procedure AboutExecute(Sender: TObject);
    procedure DisplayFormExecute(Sender: TObject);
    procedure FClickerSizeConstraintsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure StopAppExecute(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
  private

  public

  end;


    procedure getAllActiveRecords();

var
  FClicker: TFClicker;
  ClickArray: array[1..3] of TClickRecord;

implementation

{$R *.lfm}

{ TFClicker }

procedure getAllActiveRecords();
var i: integer;
begin
  FClicker.Dbf.First;
  i:=1;
  while not(FClicker.Dbf.EOF) do
    begin
      if(FClicker.Dbf.FieldByName('date').AsString<>null) then begin
        ClickArray[i].hour:=FClicker.Dbf.FieldByName('date').AsString;
        ClickArray[i].posx:=FClicker.Dbf.FieldByName('posx').AsInteger;
        ClickArray[i].posy:=FClicker.Dbf.FieldByName('posy').AsInteger;
        FClicker.Dbf.Next;
        i:=i+1; //wtf, no i++?
      end;
    end;
end;

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

procedure TFClicker.TimerTimer(Sender: TObject);
var
  actualTime: TDateTime;
  formatedTime: string;
  clickr: TClickRecord;
begin
  actualTime:= Now;
  formatedTime:=FormatDateTime('hh:nn', actualTime);

  for clickr in ClickArray do
    begin
      if(clickr.hour=formatedTime) then
        begin
          //showmessage(clickr.hour + ' - ' + formatedTime + ' tak')
          SetCursorPos(clickr.posx, clickr.posy);
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
          Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
        end

    end;

end;

procedure TFClicker.TrayIconClick(Sender: TObject);
begin
  if(FOptions.Showing=false) then
  begin
    FModalBack.Show;
    FOptions.ShowModal;
  end;
end;

procedure TFClicker.MenuItem1Click(Sender: TObject);
begin

end;

procedure TFClicker.DisplayFormExecute(Sender: TObject);
begin
  if(FOptions.Showing=false) then
  begin
    FModalBack.Show;
    FOptions.ShowModal;
  end;
end;

procedure TFClicker.FClickerSizeConstraintsChange(Sender: TObject);
begin

end;

procedure TFClicker.FormCreate(Sender: TObject);
begin
   getAllActiveRecords();
end;

procedure TFClicker.FormResize(Sender: TObject);
begin

end;

procedure TFClicker.AboutExecute(Sender: TObject);
begin
  FAbout.Show;

end;

end.


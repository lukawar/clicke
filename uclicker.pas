unit UClicker;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, Menus,
  ExtCtrls;

type

  { TFClicker }

  TFClicker = class(TForm)
    ActionList: TActionList;
    PopupMenu1: TPopupMenu;
    TrayIcon: TTrayIcon;
  private

  public

  end;

var
  FClicker: TFClicker;

implementation

{$R *.lfm}

end.


unit uoptions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, csvdataset, dbf, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DBGrids, StdCtrls, DBCtrls, DBDateTimePicker;

type

  { TFOptions }

  TFOptions = class(TForm)
    Button1: TButton;
    DBDateTimePicker1: TDBDateTimePicker;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  FOptions: TFOptions;

implementation

{$R *.lfm}

{ TFOptions }

procedure TFOptions.Button1Click(Sender: TObject);
begin
  Close;
end;

end.


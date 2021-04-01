unit uoptions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, csvdataset, dbf, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DBGrids, StdCtrls, DBCtrls;

type

  { TFOptions }

  TFOptions = class(TForm)
    Button1: TButton;
    CSVDataset1: TCSVDataset;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
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


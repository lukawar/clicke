unit uoptions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dbf, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DBGrids, StdCtrls, DBCtrls;

type

  { TFOptions }

  TFOptions = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
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
  private

  public

  end;

var
  FOptions: TFOptions;

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

end.


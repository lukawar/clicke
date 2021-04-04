unit umodalback;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFModalBack }

  TFModalBack = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Shape: TShape;
  private

  public

  end;

var
  FModalBack: TFModalBack;

implementation

{$R *.lfm}

end.


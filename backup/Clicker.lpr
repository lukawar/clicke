program Clicker;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, dbflaz, UClicker, uabout, uoptions
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFClicker, FClicker);
  Application.CreateForm(TFAbout, FAbout);
  Application.CreateForm(TFOptions, FOptions);
  Application.Run;
end.


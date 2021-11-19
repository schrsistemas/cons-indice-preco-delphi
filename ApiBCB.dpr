program ApiBCB;

uses
  Vcl.Forms,
  UFrmApiBCB in 'UFrmApiBCB.pas' {FrmApiBCB},
  UClasseBCBData in 'UClasseBCBData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmApiBCB, FrmApiBCB);
  Application.Run;
end.

program ResponsiveProject;

uses
  System.StartUpCopy,
  FMX.Forms,
  uApp in 'uApp.pas' {fApp},
  Responsividade in 'Responsividade.pas',
  uFuncoesGenericas in 'uFuncoesGenericas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfApp, fApp);
  Application.Run;
end.

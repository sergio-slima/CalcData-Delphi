program CalcData;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal in 'Principal.pas' {FormCalcData},
  UCalcular in 'UCalcular.pas',
  uFormat in 'uFormat.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCalcData, FormCalcData);
  Application.Run;
end.

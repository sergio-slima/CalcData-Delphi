unit UCalcular;

interface

uses
  System.Classes, System.SysUtils, Math, DateUtils;

type
  TCalcular = class
  private
    FDatas: TDateTime;
    FDataNascimento: TDateTime;
  public
    procedure SetDatas(aValue1, aValue2 : String);
    procedure SetDataNascimento(aValue : String);
    function TempoVividoDatas(Data1, Data2 : TDateTime; var Dias, Meses, Anos: Integer) : TDateTime;
    function TempoVividoNascimento(Nascimento : TDateTime; var Dias, Meses, Anos: Integer) : TDateTime;
  end;

implementation

{ TCalcular }

procedure TCalcular.SetDatas(aValue1, aValue2: String);
begin
  if not TryStrToDateTime(aValue1, FDatas) then
    raise Exception.Create('A Data Inicial é Inválida');

  FDatas := StrToDateTime(aValue1);

  if not TryStrToDateTime(aValue2, FDatas) then
    raise Exception.Create('A Data Final é Inválida');

  FDatas := StrToDateTime(aValue2);
end;

procedure TCalcular.SetDataNascimento(aValue: String);
begin
  if not TryStrToDateTime(aValue, FDataNascimento) then
    raise Exception.Create('A Data é Inválida');

  FDataNascimento := StrToDateTime(aValue);
end;

function TCalcular.TempoVividoDatas(Data1, Data2: TDateTime; var Dias, Meses,
  Anos: Integer): TDateTime;
var
  TempoVivido : TDateTime;
begin
  TempoVivido := Data2 - (Data1-1);

  Dias := StrToInt(FormatDateTime('dd',TempoVivido))-1;
  Meses := StrToInt(FormatDateTime('mm',TempoVivido))-1;
  Anos := StrToInt(FormatDateTime('yy',TempoVivido));

  Result := TempoVivido;
end;

function TCalcular.TempoVividoNascimento(Nascimento: TDateTime; var Dias, Meses,
  Anos: Integer): TDateTime;
var
  TempoVivido : TDateTime;
begin
  TempoVivido := Now - (Nascimento-1);

  Dias := StrToInt(FormatDateTime('dd',TempoVivido))-1;
  Meses := StrToInt(FormatDateTime('mm',TempoVivido))-1;
  Anos := StrToInt(FormatDateTime('yy',TempoVivido));

  Result := TempoVivido;
end;

end.

unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.DateTimeCtrls, UCalcular, FMX.Edit,
  Math, DateUtils, FMX.TabControl, FMX.Layouts, System.Actions, FMX.ActnList,
  uFormat;

type
  TFormCalcData = class(TForm)
    rtgPrincipal: TRectangle;
    ToolBar1: TToolBar;
    Label1: TLabel;
    rtgNascimento: TRectangle;
    Label2: TLabel;
    rtgDataNasc: TRectangle;
    btnCalcNascimento: TButton;
    rtgCalcular: TRectangle;
    rtgIdade: TRectangle;
    Label3: TLabel;
    rtgFData: TRectangle;
    rgtAno: TRectangle;
    rtgMes: TRectangle;
    rtgDia: TRectangle;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblAno: TLabel;
    lblMes: TLabel;
    lblDia: TLabel;
    edtNascimento: TEdit;
    rtgTotal: TRectangle;
    Label7: TLabel;
    rtgTotalDados: TRectangle;
    Rectangle2: TRectangle;
    Label8: TLabel;
    Rectangle4: TRectangle;
    lblTotalAnos: TLabel;
    Line1: TLine;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    lblTotalMeses: TLabel;
    LblTotalHoras: TLabel;
    LblTotalDias: TLabel;
    btnSair: TButton;
    ScrollBar2: TScrollBar;
    btnDia: TButton;
    btnLimpar: TButton;
    rtgLimpar: TRectangle;
    StyleBook1: TStyleBook;
    TabControl1: TTabControl;
    TabData: TTabItem;
    TabNascimento: TTabItem;
    Label12: TLabel;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    EdtAniversario: TEdit;
    ScrollBar1: TScrollBar;
    Rectangle3: TRectangle;
    Rectangle5: TRectangle;
    Label14: TLabel;
    Rectangle6: TRectangle;
    EdtDataInicial: TEdit;
    Rectangle7: TRectangle;
    BtnCalcData: TButton;
    Rectangle8: TRectangle;
    Label15: TLabel;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Label16: TLabel;
    LblAnoData: TLabel;
    Rectangle11: TRectangle;
    Label18: TLabel;
    LblMesData: TLabel;
    Rectangle12: TRectangle;
    Label20: TLabel;
    LblDiaData: TLabel;
    Rectangle13: TRectangle;
    Label22: TLabel;
    Rectangle14: TRectangle;
    Rectangle15: TRectangle;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Rectangle16: TRectangle;
    LblTAnosData: TLabel;
    LblTMesData: TLabel;
    LblTHoraData: TLabel;
    LblTMinData: TLabel;
    LblTDiaData: TLabel;
    Line2: TLine;
    Rectangle17: TRectangle;
    Button2: TButton;
    ToolBar2: TToolBar;
    Label34: TLabel;
    Button3: TButton;
    Button4: TButton;
    Rectangle19: TRectangle;
    EdtDataFinal: TEdit;
    ActionList1: TActionList;
    ActTabData: TChangeTabAction;
    ActTabNascimento: TChangeTabAction;
    Layout2: TLayout;
    ImgData: TImage;
    Rectangle18: TRectangle;
    ImgNascimento: TImage;
    RtgSelecao: TRectangle;
    procedure btnCalcNascimentoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnDiaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure BtnCalcDataClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImgDataClick(Sender: TObject);
    procedure ImgNascimentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtDataFinalTyping(Sender: TObject);
    procedure EdtDataInicialTyping(Sender: TObject);
    procedure edtNascimentoTyping(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCalcData: TFormCalcData;

implementation

{$R *.fmx}

procedure SelecionaIcone(Sender: TObject);
begin
  with FormCalcData do
  begin
    ImgData.Tag := 0;
    ImgNascimento.Tag := 0;

    TImage(Sender).Tag := 1;

    RtgSelecao.AnimateFloat('Position.X', TImage(Sender).Position.X, 0.2);
  end;

end;

procedure TFormCalcData.BtnCalcDataClick(Sender: TObject);
var
  Dia, Mes, Ano : Integer;
  Calculando : TDateTime;
  Calcular : TCalcular;
begin
  if (EdtDataInicial.Text = '') and  (EdtDataFinal.Text = '') then
  begin
    ShowMessage('Informe as duas datas!');
    Exit;
  end;

  Calcular := TCalcular.Create;
  try
    Calculando := Calcular.TempoVividoDatas(StrToDateTime(EdtDataInicial.Text),StrToDateTime(EdtDataFinal.Text), Dia, Mes, Ano);
    LblAnoData.Text := IntToStr(Ano);
    LblMesData.Text := IntToStr(Mes);
    btnDiaClick(Sender);
    //LblDiaData.Text := IntToStr(Dia);

    Calcular.SetDatas(EdtDataInicial.Text, EdtDataFinal.Text);
  finally
    Calcular.Free;
  end;


  //LblAnoData.Text:= IntToStr(YearsBetween(StrToDateTime(EdtDataInicial.Text), StrToDateTime(EdtDataFinal.Text)));
  //LblMesData.Text:= IntToStr(MonthsBetween(StrToDateTime(EdtDataInicial.Text), StrToDateTime(EdtDataFinal.Text)));
  //LblDiaData.Text:= IntToStr(DaysBetween(StrToDateTime(EdtDataInicial.Text), StrToDateTime(EdtDataFinal.Text)));
  LblTAnosData.Text:= IntToStr(YearsBetween(StrToDateTime(EdtDataInicial.Text), StrToDateTime(EdtDataFinal.Text)));
  LblTMesData.Text:= IntToStr(MonthsBetween(StrToDateTime(EdtDataInicial.Text), StrToDateTime(EdtDataFinal.Text)));
  LblTDiaData.Text:= IntToStr(DaysBetween(StrToDateTime(EdtDataInicial.Text), StrToDateTime(EdtDataFinal.Text)));
  LblTHoraData.Text:= IntToStr(HoursBetween(StrToDateTime(EdtDataInicial.Text), StrToDateTime(EdtDataFinal.Text)));
  LblTMinData.Text:= IntToStr(MinutesBetween(StrToDateTime(EdtDataInicial.Text), StrToDateTime(EdtDataFinal.Text)));

end;

procedure TFormCalcData.btnCalcNascimentoClick(Sender: TObject);
var
  Dia, Mes, Ano, tAno, tMes, tDia, tHora, tMin, tSec, fDia: Integer;
  Calculando, Niver: TDateTime;
  Calcular : TCalcular;
begin
  if edtNascimento.Text = '' then
  begin
    ShowMessage('Informe sua data de nascimento!');
    Exit;
  end;

  Calcular := TCalcular.Create;
  try
    Calculando := Calcular.TempoVividoNascimento(StrToDateTime(EdtNascimento.Text), Dia, Mes, Ano);
    lblAno.Text := IntToStr(Ano);
    lblMes.Text := IntToStr(Mes);
    btnDiaClick(Sender);
//    lblDia.Text := IntToStr(Dia);

    tAno := YearsBetween(StrToDateTime(edtNascimento.Text), Date);
    tMes := MonthsBetween(StrToDateTime(edtNascimento.Text), Date);
    tDia := DaysBetween(StrToDateTime(edtNascimento.Text), Date);
    tHora := HoursBetween(StrToDateTime(edtNascimento.Text), Date);
    tMin := MinutesBetween(StrToDateTime(edtNascimento.Text), Date);
    tSec := SecondsBetween(StrToDateTime(edtNascimento.Text), Date);

    lblTotalAnos.Text := IntToStr(tAno);
    lblTotalMeses.Text := IntToStr(tMes);
    LblTotalDias.Text := IntToStr(tDia);
    LblTotalHoras.Text := IntToStr(tHora);

    Niver := IncYear(StrToDate(edtNascimento.Text),tAno+1);
    EdtAniversario.Text := 'Daqui '+IntToStr(DaysBetween(Now,Niver))+' Dias';

    Calcular.SetDataNascimento(edtNascimento.Text);
  finally
    Calcular.Free;
  end;
end;

procedure TFormCalcData.btnLimparClick(Sender: TObject);
begin
  edtNascimento.Text := '';
  lblAno.Text := '';
  lblMes.Text := '';
  lblDia.Text := '';
  lblTotalAnos.Text := '';
  lblTotalMeses.Text := '';
  LblTotalHoras.Text := '';
  LblTotalDias.Text := '';
  EdtAniversario.Text := '';
  EdtDataInicial.Text := '';
  EdtDataFinal.Text := '';
  LblAnoData.Text := '';
  LblMesData.Text := '';
  LblDiaData.Text := '';
  LblTAnosData.Text := '';
  LblTMesData.Text := '';
  LblTDiaData.Text := '';
  LblTHoraData.Text := '';
  LblTMinData.Text := '';
end;

procedure TFormCalcData.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormCalcData.EdtDataFinalTyping(Sender: TObject);
begin
  Formatar(EdtDataFinal, TFormato.Dt);
end;

procedure TFormCalcData.EdtDataInicialTyping(Sender: TObject);
begin
  Formatar(EdtDataInicial, TFormato.Dt);
end;

procedure TFormCalcData.edtNascimentoTyping(Sender: TObject);
begin
  Formatar(edtNascimento, TFormato.Dt);
end;

procedure TFormCalcData.FormCreate(Sender: TObject);
begin
  TabControl1.TabPosition := TTabPosition.None;
  TabControl1.ActiveTab := TabData;
end;

procedure TFormCalcData.FormShow(Sender: TObject);
begin
  SelecionaIcone(ImgData);
end;

procedure TFormCalcData.ImgDataClick(Sender: TObject);
begin
  SelecionaIcone(Sender);
  ActTabData.Execute;
end;

procedure TFormCalcData.ImgNascimentoClick(Sender: TObject);
begin
  SelecionaIcone(Sender);
  ActTabNascimento.Execute;
end;

procedure TFormCalcData.btnDiaClick(Sender: TObject);
var
 d1, d2, d3: TDate;
 a,m,d: integer;
 yy1,mm1,dd1, yy2, mm2, dd2: word;
begin
  if TabControl1.ActiveTab = TabData then
  begin
    d1 := StrToDate(EdtDataInicial.Text);
    d2 := StrToDate(EdtDataFinal.Text);
  end else
  begin
    d1 := StrToDate(edtNascimento.Text);
    d2 := Date;
  end;

  if d1 = StartOfTheMonth(d1) then
    d2 := IncDay(d2);

  a := YearsBetween(d1, d2);
  m := MonthsBetween(d1, d2);

  while m >= MonthsPerYear do
    Dec(m, MonthsPerYear);

  decodedate(d1, yy1,mm1,dd1);
  decodedate(d2, yy2,mm2,dd2);
  d3 := EncodeDate(yy2, IfThen(dd1>dd2, mm2-1, mm2), dd1);
  d := DaysBetween(d3, d2);

//  lblAno.Text := IntToStr(a);
//  lblMes.Text := IntToStr(m);
  if TabControl1.ActiveTab = TabData then
    LblDiaData.Text := IntToStr(d)
  else
    lblDia.Text := IntToStr(d);

end;

end.

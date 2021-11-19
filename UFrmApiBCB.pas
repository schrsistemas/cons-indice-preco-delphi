unit UFrmApiBCB;

{
  Módulo simplificado de consulta aos Indices de Preço de Mercado IGPM, IGP, IPCA, INPC,...

  Para consumo de informações do banco central esta sendo utilizado a biblioteca: RESTRequest4D

  Ref.:
  https://github.com/viniciussanchez/RESTRequest4Delphi

  Daniel Schroeder - ByteCom
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, UClasseBCBData, RESTRequest4D, Generics.Collections, Rest.Json,
  Math, Vcl.ExtCtrls, DateUtils;

type
  TFrmApiBCB = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btnConsultar: TButton;
    cbxIndice: TComboBox;
    mmBody: TMemo;
    lblInfo: TLabel;
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Consultar;
    procedure Calcular;
  public
    { Public declarations }
  end;

var
  FrmApiBCB: TFrmApiBCB;

implementation

{$R *.dfm}

procedure TFrmApiBCB.btnConsultarClick(Sender: TObject);
begin
  mmBody.Clear;
  if cbxIndice.ItemIndex > -1 then
  begin
    Consultar;
    Calcular;
  end
  else
  begin
    cbxIndice.SetFocus;
    mmBody.Text := 'Selecione o Indice de Preço!';
  end;

end;

procedure TFrmApiBCB.Calcular;
begin
  var root: TRootClass := TRootClass.FromJsonString('{"items":' + mmBody.Text + '}');
  mmBody.Clear;
  mmBody.Lines.add('Índice de Preço: ' + cbxIndice.Text);
  mmBody.Lines.Add('Data: ' + DateToStr(Now) + ' - Acum. 12 meses %');
  mmBody.Lines.Add('-');
  mmBody.Lines.Add('Ref.:      |   % Mês |   % Acum.');
  var acumulado: Double := 0.0;
  for var I: Integer := Length(root.Items) - 12 to Length(root.Items) - 1 do
  begin
    var aux: Double := ((root.Items[I].valor / 100) + 1);
    if acumulado > 0 then
      acumulado := acumulado * aux
    else
      acumulado := aux;
    mmBody.Lines.Add(root.Items[I].data + ' |    ' + FormatFloat(',0.00', root.Items[I].valor) + ' |    ' + FormatFloat(',0.00', SimpleRoundTo(acumulado * 100 - 100)));
  end;
  acumulado := acumulado * 100 - 100;
  mmBody.Lines.Add('-');
  mmBody.Lines.Add('% Ref. de Calculo: ' + FormatFloat(',0.00', SimpleRoundTo(acumulado)));
  mmBody.Lines.Add('');

end;

procedure TFrmApiBCB.Consultar;
begin
{
  Ref:
  http://indiceseconomicos.secovi.com.br/indicadormensal.php?idindicador=58
  https://conteudos.quintoandar.com.br/reajuste-de-aluguel-calculadora-igpm/
  https://www.cashme.com.br/blog/igpm-2020/
}

  var LResponse: IResponse;
  var aux: string := '';

  case cbxIndice.ItemIndex of
    0:
      aux := '188'; // BCB_INPC
    1:
      aux := '28655'; // BCB_IGPM
    2:
      aux := '190'; // BCB_IGPDI
    3:
      aux := '191'; // BCB_IPCBR
    4:
      aux := '193'; // BCB_IPCSP
    5:
      aux := '433'; // BCB_IPCA
  end;

  var str_url: string := 'https://api.bcb.gov.br/dados/serie/bcdata.sgs.' + aux + '/dados?formato=json';

  LResponse := TRequest.New.BaseURL(str_url).Accept('application/json').Get;

  mmBody.Lines.Text := LResponse.Content;

  lblInfo.Caption := 'Informações obtidas do link: ' + #13#10 + str_url;

end;

end.


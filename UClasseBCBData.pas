unit UClasseBCBData;

//  *************************************************
// https://api.bcb.gov.br/dados/serie/bcdata.sgs.???/dados?formato=json
//  *************************************************

{
Ref:
http://indiceseconomicos.secovi.com.br/indicadormensal.php?idindicador=58
???
    const BCB_INPC = 188;
    const BCB_IGPM = 28655;
    const BCB_IGPDI = 190;
    const BCB_IPCBR = 191;
    const BCB_IPCSP = 193;
    const BCB_IPCA = 433;

}

interface

uses
  Generics.Collections, Rest.Json;

type
  TItemClass = class
  private
    FData: string;
    FValor: Double;
  public
    property data: string read FData write FData;
    property valor: Double read FValor write FValor;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TItemClass;
  end;

  TRootClass = class
  private
    FItems: TArray<TItemClass>;
  public
    property Items: TArray<TItemClass> read FItems write FItems;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TRootClass;
  end;

implementation

{TItemClass}

function TItemClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TItemClass.FromJsonString(AJsonString: string): TItemClass;
begin
  result := TJson.JsonToObject<TItemClass>(AJsonString)
end;

{TRootClass}

destructor TRootClass.Destroy;
var
  LItemsItem: TItemClass;
begin

  for LItemsItem in FItems do
    LItemsItem.free;

  inherited;
end;

function TRootClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TRootClass.FromJsonString(AJsonString: string): TRootClass;
begin
  result := TJson.JsonToObject<TRootClass>(AJsonString)
end;

end.


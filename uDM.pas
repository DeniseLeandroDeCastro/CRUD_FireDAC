unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef;

type
  TDM = class(TDataModule)
    FDConexao: TFDConnection;
    FDQryLembrete: TFDQuery;
    DSLembrete: TDataSource;
    FDQryUser: TFDQuery;
    DSUser: TDataSource;
    FDQryLembreteidlembrete: TFDAutoIncField;
    FDQryLembretetitulo: TStringField;
    FDQryLembretedescricao: TStringField;
    FDQryLembretedataHora: TDateTimeField;
    FDQryLembreteidusuario: TIntegerField;
    procedure FDQryLembreteNewRecord(DataSet: TDataSet);
  private
    FidUsuario: Integer;
    { Private declarations }
  public
    property idUsuario: Integer read FidUsuario write FidUsuario;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.FDQryLembreteNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('idusuario').AsInteger := idUsuario;
end;

end.

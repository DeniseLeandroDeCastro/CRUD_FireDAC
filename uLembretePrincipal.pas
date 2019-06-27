unit uLembretePrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  uDM,
  Data.DB, Vcl.Grids, Vcl.DBGrids, uLembreteInserir, uLembreteEditar, uLogin,
  FireDAC.Stan.Param;

type
  TuFrmCadastroPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EdtBuscarPorTitulo_Descricao: TEdit;
    BtnBuscar: TSpeedButton;
    Panel3: TPanel;
    Panel4: TPanel;
    BtnNovo: TSpeedButton;
    BtnEditar: TSpeedButton;
    BtnDeletar: TSpeedButton;
    DBGridLembrete: TDBGrid;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmCadastroPrincipal: TuFrmCadastroPrincipal;

implementation

{$R *.dfm}

procedure TuFrmCadastroPrincipal.BtnBuscarClick(Sender: TObject);
var
  conteudo: String;
begin
  conteudo := EdtBuscarPorTitulo_Descricao.Text;
  DM.FDQryLembrete.Close;
  if DM.idUsuario = 1 then
  begin
    DM.FDQryLembrete.ParamByName('IDUSUARIO').AsString := '%';
  end
  else
  begin
    DM.FDQryLembrete.ParamByName('IDUSUARIO').AsString := DM.idUsuario.ToString;
  end;

  DM.FDQryLembrete.ParamByName('TITULO').AsString := '%' + conteudo + '%';
  DM.FDQryLembrete.Open;
end;

procedure TuFrmCadastroPrincipal.BtnDeletarClick(Sender: TObject);
begin
  DM.FDQryLembrete.Delete;
end;

procedure TuFrmCadastroPrincipal.BtnEditarClick(Sender: TObject);
begin
  if not DM.FDQryLembrete.Active then
  begin
    DM.FDQryLembrete.Open;
  end;
  DM.FDQryLembrete.Edit;
  FrmLembreteEditar := TFrmLembreteEditar.Create(Self);
  FrmLembreteEditar.ShowModal;
end;

procedure TuFrmCadastroPrincipal.BtnNovoClick(Sender: TObject);
begin
  if not DM.FDQryLembrete.Active then
  begin
    DM.FDQryLembrete.Open;
  end;
  DM.FDQryLembrete.Insert;
  FrmLembreteInserir := TFrmLembreteInserir.Create(Self);
  FrmLembreteInserir.ShowModal;
end;

procedure TuFrmCadastroPrincipal.FormShow(Sender: TObject);
begin
  uFrmLogin := TuFrmLogin.Create(Self);
  try
    uFrmLogin.ShowModal;
  finally
    uFrmLogin.Free;
  end;
end;

end.

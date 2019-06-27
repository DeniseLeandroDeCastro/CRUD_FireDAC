unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, uDM, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef;

type
  TuFrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;

    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmLogin: TuFrmLogin;

implementation

uses
  uLembretePrincipal;

{$R *.dfm}

procedure TuFrmLogin.SpeedButton1Click(Sender: TObject);

var
  user: String;
  senha: string;
begin
  user := EdtUsuario.Text;
  senha := EdtSenha.Text;

  if (EdtUsuario.Text = '') or (EdtSenha.Text = '') then
  begin
    Application.MessageBox('O Usu�rio e senha n�o podem ser vazios.', 'Aten��o', mb_OK);
  end
  else
  begin
    DM.FDQryUser.Close;
    DM.FDQryUser.ParamByName('USUARIO').AsString := user;
    DM.FDQryUser.ParamByName('SENHA').AsString := senha;
    DM.FDQryUser.Open;



    if DM.FDQryUser.IsEmpty then
    begin
      Application.MessageBox('Usu�rio n�o cadastrado, por favor tente novamente.', 'Informa��o', mb_OK);
    end
    else
    begin
      DM.idUsuario := DM.FDQryUser.FieldByName('idusuario').AsInteger;
      ModalResult := mrOk;
    end;
    //DM.FDQryUser.Close;
  end;
end;

procedure TuFrmLogin.SpeedButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.

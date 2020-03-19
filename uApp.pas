unit uApp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, Responsividade, uFuncoesGenericas, fmx.ani,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

  Type

  TfApp = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Label1: TLabel;
    Text1: TText;
    Circle1: TCircle;
    Rectangle4: TRectangle;
    ListView1: TListView;

    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }


  public
    { Public declarations }
  end;

var
  fApp: TfApp;
  ArrayResponsivity: TArrayResponsivity;
//  responsive:TResponsivity;

implementation

{$R *.fmx}

{ TForm14 }

procedure TfApp.FormCreate(Sender: TObject);
begin
  ArrayResponsivity:= TFuncoesGenericas.tudoResponsivo(fApp, Layout1); // Opção 1 Coloca todos os Objetos da tela responsivos
//  responsive := TResponsivity.Create(rectangle1,Layout1);    // Opção 2 coloca um objeto específico responsivo
end;

procedure TfApp.FormResize(Sender: TObject);
  var resp:TResponsivity;
begin
  for resp in ArrayResponsivity do resp.responsive; //Continuação da opção 1
  //  responsive.responsive;                          //Continuação da opção 2
end;

end.

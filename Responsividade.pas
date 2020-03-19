unit Responsividade;

interface
  uses fmx.Controls, System.SysUtils, System.UITypes, FMX.Types;

type
  TPadroes = array of Single;

  TResponsivity = class
  private
    FarrayPadroes: array of Single;
    Fobj: TControl;
    Frelative: TControl;
    Fpadroes: TPadroes;
    procedure Setobj(const Value: TControl);
    procedure Setrelative(const Value: TControl);
    procedure Setpadroes(const Value: TPadroes);

  published
    property obj            : TControl read Fobj write Setobj;
    property relative       : TControl read Frelative write Setrelative;
    property padroes        : TPadroes read Fpadroes write Setpadroes;

  public
    constructor Create(obj, Relative:TControl);
    procedure responsive(parametros: array of String); overload;
    procedure responsive; overload;

  end;

implementation

{ TResponsive }

constructor TResponsivity.Create(obj,relative:TControl);
begin
  Setpadroes([obj.Width, obj.Height, obj.Position.X, obj.Position.Y,
             relative.Width, relative.Height]);
  self.obj:=obj;
  self.relative:=relative;
end;

procedure TResponsivity.responsive(parametros: array of String);
var i:integer;
begin
  self.obj.Anchors:= [TAnchorKind.akLeft, TAnchorKind.akTop];

  for i:= 0 to length(parametros) do
  begin
    if  parametros[i] = 'width' then
    begin
      self.obj.Width:=(self.relative.Width*(self.padroes[0]/self.padroes[4]));
    end else
    if parametros[i] = 'heigth' then
    begin
      self.obj.height:=(self.relative.height*(self.padroes[1]/self.padroes[5]));
    end else
    if parametros[i]= 'posx' then
    begin
      self.obj.position.x:=(self.relative.width*(self.padroes[2]/self.padroes[4]));
    end else
    if parametros[i] = 'posy' then
    begin
      self.obj.position.y:=(self.relative.height*(self.padroes[3]/self.padroes[5]));
    end else
    if parametros[i] ='todos' then
    begin
      self.obj.Width      := (self.relative.Width*(self.padroes[0]/self.padroes[4]));
      self.obj.height     := (self.relative.height*(self.padroes[1]/self.padroes[5]));
      self.obj.position.x := (self.relative.width*(self.padroes[2]/self.padroes[4]));
      self.obj.position.y := (self.relative.height*(self.padroes[3]/self.padroes[5]));
    end;
  end;
end;

procedure TResponsivity.responsive;
begin
  self.obj.Anchors:= [TAnchorKind.akLeft, TAnchorKind.akTop];

  self.obj.Width      := (self.relative.Width*(self.padroes[0]/self.padroes[4]));
  self.obj.height     := (self.relative.height*(self.padroes[1]/self.padroes[5]));
  self.obj.position.x := (self.relative.width*(self.padroes[2]/self.padroes[4]));
  self.obj.position.y := (self.relative.height*(self.padroes[3]/self.padroes[5]));
end;

procedure TResponsivity.Setobj(const Value: TControl);
begin
  Fobj := Value;
end;

procedure TResponsivity.Setpadroes(const Value: TPadroes);
begin
  Fpadroes := Value;
end;

procedure TResponsivity.Setrelative(const Value: TControl);
begin
  Frelative := Value;
end;

end.

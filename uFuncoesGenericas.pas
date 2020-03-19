unit uFuncoesGenericas;

interface

uses Responsividade, fmx.forms,FMX.Controls;

  Type
  TArrayResponsivity = Array of TResponsivity;

  TFuncoesGenericas = class
  class function tudoResponsivo(form:TForm;layout:TControl):TArrayResponsivity;
  end;

implementation

{ TFuncoesGenericas }

class function TFuncoesGenericas.tudoResponsivo(form:TForm;layout:TControl):TArrayResponsivity;
var i:integer;
    ArrayResponsivity:TArrayResponsivity;
begin
  SetLength(ArrayResponsivity,form.ComponentCount);
  for I := 0 to form.ComponentCount-1 do
  begin
    if form.Components[i] is TControl then
    begin
      try
        ArrayResponsivity[i]:=TResponsivity.Create(TControl(form.Components[i]),layout);
      except end;
    end;
  end;
  result :=ArrayResponsivity;
end;

end.

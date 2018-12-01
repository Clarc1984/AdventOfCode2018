program Day1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  input : TextFile;
  num, sum, sum_all : Integer;
  //not optimal but faster than TList
  wyn : array [-1000000..1000000] of Boolean;
  first, freq : Boolean;
  first_wyn : Integer;

begin
  sum_all := 0;
  freq := False;
  first := False;
  repeat
    AssignFile(input, 'data');
    Reset(input);
    while not Eof(input) do
    begin
      Readln(input, num);
      sum_all := sum_all + num;
      if wyn[sum_all] = False then
        wyn[sum_all] := True
      else
      begin
        if not first then
        begin
          first_wyn := sum_all;
          first := True;
          Break;
        end;
      end;
    end;
    CloseFile(input);
    if not freq then
    begin
      sum := sum_all;
      freq := True;
    end;
  until first;
  Writeln('1. sum: ',sum.ToString);
  writeln('2. first repeat: ',first_wyn.ToString);
  Readln;
end.

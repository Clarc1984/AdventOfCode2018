program Day2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function Differences(const str1, str2 : string; var out : string) : Integer;
var
  i : Integer;

begin
  Result := 0;
  out := '';
  for I := 1 to Length(str1) do
  begin
    if str1[i] = str2[i] then
      out := out + str1[i]
    else
      inc(Result);
  end;
end;

var
  input : TextFile;
  line, commonID, tryID : string;
  i, j : Integer;
  b_doubles, b_triples : Boolean;
  doubles, triples : Integer;
  boxIDs : array of string;

begin
  AssignFile(input, 'input');
  Reset(input);
  doubles := 0;
  triples := 0;
  commonID := '';
  while not eof(input) do
  begin
    b_doubles := False;
    b_triples := False;
    readln(input, line);
    SetLength(boxIDs, high(boxIDs) + 2);
    boxIDs[high(boxIDs)] := line;
    for i := 0 to High(line) do
      case line.CountChar(line[i]) of
        2 : b_doubles := True;
        3 : b_triples := True;
      end;
    if b_doubles then
      Inc(doubles);
    if b_triples then
      Inc(triples);
  end;
  CloseFile(input);
  for I := 0 to High(boxIDs) - 2 do
    for j := i + 1 to High(boxIDs) - 1 do
      if Differences(boxIDs[i], boxIDs[j], tryID) = 1 then
      begin
        commonID := tryID;
        Break;
      end;

  Writeln(doubles * triples);
  Writeln('common: ',commonID);
  Readln;

end.

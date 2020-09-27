unit counter;

//---------------------- INTERFACE ---------------------------------------------

interface
  procedure init(baseCharset, sLms: word);
  procedure prepare(name: string[25]);
  procedure print;
  procedure overwrite;

var
  stop              : boolean absolute 0;
  vblk              : pointer;

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

uses gr;

var
  chbas             : byte absolute $D409;
  benchName         : string[25];
  charset, scoreLms : word;
  position, i       : byte;

procedure vblCounter; interrupt;
var
  a : byte absolute gr.counterLms;
  b : byte absolute gr.counterLms + 1;
  c : byte absolute gr.counterLms + 2;
  d : byte absolute gr.counterLms + 3;
  e : byte absolute gr.counterLms + 4;
begin
  asm {
    phr
  };
  if not stop then begin
    inc(e);
    if e = 10 then begin inc(d); e := 0 end;
    if d = 10 then begin inc(c); d := 0 end;
    if c = 10 then begin inc(b); c := 0 end;
    if b = 10 then begin inc(a); b := 0 end;
  end;
  asm {
    plr
  };
end;

procedure init(baseCharset, sLms: word);
begin
  scoreLms := sLms;
  charset := baseCharset + $400;
  Move(pointer(baseCharset), pointer(charset), $400);
  Move(pointer(baseCharset + $80), pointer(charset), 80);
  for i := 0 to 7 do
    poke(charset + $400 - 8 + i, peek(baseCharset + $80 + i) xor $ff);
  FillChar(pointer(charset + $400 - 16), 8, $ff);
end;

procedure prepare(name: string[25]);
begin
  pause; gr.counterRow;
  chbas := hi(charset);
  benchName := name;
  FillChar(pointer(gr.counterLms), $28, $fe);
  FillChar(pointer(gr.counterLms), 5, 0);
  for i := 1 to length(name) do
    if name[i] = chr(0) then name[i] := chr($fe);
  Move(name[1], pointer(gr.counterLms + 6), length(name));
  inc(position);
  pause;
end;

procedure print;
var
  printRow    : word;
begin
  printRow := scoreLms + (40 * position);
  Move(benchName[1], pointer(printRow), length(benchName));
  inc(printRow, 26);
  for i := 0 to 4 do
    poke(printRow + i, peek(gr.counterLms + i) + 16);
end;

procedure overwrite;
begin
  Move(pointer(gr.counterLms + $23), pointer(gr.counterLms), 5);
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
  vblk := @vblCounter;
  stop := true;
  position := $ff;
end.

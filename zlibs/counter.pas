unit counter;

//---------------------- INTERFACE ---------------------------------------------

interface
  procedure init(baseCharset, sLms: word);
  procedure prepare(name: string[25]);
  procedure printScore(name: string[25]);

const
  lms = $20;

var
  stop          : boolean absolute 0;
  vblk          : pointer;

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

const
  dlCounter: array [0..8] of byte = (
    $70,$70,$70,
    $42,lms,$00,
    $41,lo(word(@dlCounter)),hi(word(@dlCounter))
  );

var
  sdlstl            : word absolute $D402;
  chbas             : byte absolute $D409;
  charset, scoreLms : word;
  position          : byte;

procedure vblCounter; interrupt;
var
  a : byte absolute lms;
  b : byte absolute lms+1;
  c : byte absolute lms+2;
  d : byte absolute lms+3;
  e : byte absolute lms+4;
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
var
  i           : byte;
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
  pause;
  sdlstl := word(@dlCounter);
  chbas := hi(charset);
  FillChar(pointer(lms), $28, $fe);
  FillChar(pointer(lms), 5, 0);
  Move(name[1], pointer(lms+6), length(name));
  inc(position);
  pause;
end;

procedure printScore(name: string[25]);
var
  crow    : word;
  i       : byte;
begin
  crow := scoreLms + (40 * counter.position);
  Move(name[1], pointer(crow), length(name));
  for i := 0 to 4 do
    poke(crow + i + 26, peek(counter.lms + i) + 16);
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
  stop := true;
  vblk := @vblCounter;
  position := $ff;
end.

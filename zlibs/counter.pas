unit counter;

//---------------------- INTERFACE ---------------------------------------------

interface
  procedure init(baserCharset : word);
  procedure prepare(name: string[15]);

const
  lms = $20;

var
  stop          : boolean absolute 0;
  vblk          : pointer;
  sdlstl        : word;
  chbas         : byte;


//---------------------- IMPLEMENTATION ----------------------------------------

implementation

const
  charset = $8400;

  dlCounter: array [0..8] of byte = (
    $70,$70,$70,
    $42,lms,$00,
    $41,lo(word(@dlCounter)),hi(word(@dlCounter))
  );

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

procedure init(baserCharset : word);
var
  i       : byte;
begin
  Move(pointer(baserCharset), pointer(charset), $400);
  Move(pointer(baserCharset + $80), pointer(charset), 80);
  for i := 0 to 7 do
    poke(charset + $400 - 8 + i, peek(baserCharset + $80 + i) xor $ff);
  FillChar(pointer(charset + $400 - 16), 8, $ff);
end;

procedure prepare(name: string[15]);
begin
  FillChar(pointer(lms), $28, $fe);
  FillChar(pointer(lms), 5, 0);
  Move(name[1], pointer(lms+6), length(name));
  pause;
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
  stop := true;
  vblk := @vblCounter;
  sdlstl := word(@dlCounter);
  chbas := hi(charset);
end.

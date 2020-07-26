{$librarypath 'blibs'}

unit counter;

//---------------------- INTERFACE ---------------------------------------------

interface
  procedure init;
  procedure prepare(name: string[15]);

var
  stop        : boolean absolute 0;

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

uses
  b_system;

var
  sdlstl      : word absolute $D402;
  chbas       : byte absolute $D409;

procedure vblCounter; interrupt;
var
  a  : byte absolute $20;
  b  : byte absolute $21;
  c  : byte absolute $22;
  d  : byte absolute $23;
  e  : byte absolute $24;
begin
  asm {
    phr
  };
  if not stop then begin
    inc(e);
    if e=10 then begin inc(d); e := 0 end;
    if d=10 then begin inc(c); d := 0 end;
    if c=10 then begin inc(b); c := 0 end;
    if b=10 then begin inc(a); b := 0 end;
  end;
  asm {
    plr
  };
end;

procedure dlCounter:assembler;
asm
{
  :3  .byte $70
      .byte $42,$20,$00
      .byte $41,a(dlCounter)
};
end;

procedure init;
var
  i       : byte;
begin
  Move(pointer($8000), pointer($8400), $400);
  Move(pointer($8080), pointer($8400), 80);
  for i := 0 to 7 do
    poke($87f8+i, peek($8080+i) xor $ff);
  FillChar(pointer($87f0), 8, $ff);
  chbas := $84;
  sdlstl := word(@dlCounter);
  EnableVBLI(@vblCounter);
end;

procedure prepare(name: string[35]);
begin
  FillChar(pointer($20), $28, $fe);
  FillChar(pointer($20), 5, 0);
  Move(name[1], pointer($26), length(name));
  pause;
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
  stop := true;
end.

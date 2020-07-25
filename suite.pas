{$librarypath 'blibs'}
{$librarypath 'benchmarks'}

program Suite;

uses
  b_system,
  bsort, sieve, countdown_while, countdown_for,
  montecarlo, chessboard, yoshplus;

const
  lms = $e000;

var
  sdlstl  : word absolute $D402;
  chbas   : byte absolute $D409;

{$i 'includes/counter.inc'}

procedure initSuite();
begin
  Move(pointer($e000), pointer($8000), $400);
  SystemOff;
  FillChar(pointer($20), $28, 0);
  FillChar(pointer(lms), $fff, 0);
end;

procedure printScore(name: string[15]; row: byte);
var
  crow    : word;
  i       : byte;
begin
  crow := lms+(40*row);
  Move(name[1], pointer(crow), length(name));
  for i := 0 to 4 do
    poke(crow+i+$10,peek($20+i)+16);
end;

procedure dlScore():assembler;
asm
{
  :3  .byte $70
      .byte $42,a(lms)
  :21 .byte $02
      .byte $41,a(dlScore)
};
end;

begin
  initSuite;
  initCounter;

  {$i 'includes/runners.inc'}

  chbas := $80;
  sdlstl := word(@dlScore);

  repeat until false;
end.

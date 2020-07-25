{$librarypath 'blibs'}
{$librarypath 'zlibs'}
{$librarypath 'benchmarks'}

program Suite;

uses
  b_system, counter,
  yoshplus, sieve, bsort, countdown_while, countdown_for,
  montecarlo, chessboard;

const
  lms = $e000;

var
  sdlstl      : word absolute $D402;
  chbas       : byte absolute $D409;

//------------------------------------------------------------------------------

procedure dlScore():assembler;
asm
{
  :3  .byte $70
      .byte $42,a(lms)
  :21 .byte $02
      .byte $41,a(dlScore)
};
end;

procedure printScore(name: string[35]; row: byte);
var
  crow    : word;
  i       : byte;
begin
  crow := lms+(40*row);
  Move(name[1], pointer(crow), length(name));
  for i := 0 to 4 do
    poke(crow+i+$10,peek($20+i)+16);
end;

procedure initSuite();
begin
  Move(pointer($e000), pointer($8000), $400);
  SystemOff;
  FillChar(pointer($20), $28, 0);
  FillChar(pointer(lms), $fff, 0);
end;

//------------------------------------------------------------------------------

begin
  initSuite; counter.init;

  //--------------------------

  {$i 'includes/runners.inc'}

  //--------------------------

  chbas := $80;
  sdlstl := word(@dlScore);

  repeat until false;
end.

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

  dlScore : array [0..29] of byte = (
    $70,$70,$70,
    $42,lo(lms),hi(lms),
    $02,$02,$02,$02,$02,$02,$02,$02,
    $02,$02,$02,$02,$02,$02,$02,$02,
    $02,$02,$02,$02,$02,
    $41,lo(word(@dlScore)),hi(word(@dlScore))
  );

var
  sdlstl      : word absolute $D402;
  chbas       : byte absolute $D409;

//------------------------------------------------------------------------------

procedure printScore(name: string[15]; row: byte);
var
  crow    : word;
  i       : byte;
begin
  crow := lms + (40 * row);
  Move(name[1], pointer(crow), length(name));
  for i := 0 to 4 do
    poke(crow + i + 16, peek(counter.lms + i) + 16);
end;

procedure initSuite();
begin
  Move(pointer($e000), pointer($8000), $400);
  SystemOff;
  FillChar(pointer(counter.lms), 40, 0);
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

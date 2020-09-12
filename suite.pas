{$librarypath 'blibs'}
{$librarypath 'zlibs'}
{$librarypath 'benchmarks'}

program Suite;

uses
  b_system, counter,
  yoshplus, sieve1028, bsort, countdown_while, countdown_for,
  montecarlo, chessboard, sieve1899, lipsum, guessing;

const
  lms = $e000;
  charset = $8000;

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

procedure initSuite;
begin
  Move(pointer($e000), pointer(charset), $400);
  SystemOff;
  FillChar(pointer(counter.lms), 40, 0);
  FillChar(pointer(lms), $fff, 0);
  counter.init(charset, lms);
  EnableVBLI(counter.vblk);
end;

procedure showScore;
begin
  pause;
  chbas := hi(charset);
  sdlstl := word(@dlScore);
  repeat until false;
end;

procedure startRunners;
begin
  chessboard.run;
  countdown_for.run;
  countdown_while.run;
  sieve1028.run;
  sieve1899.run;
  bsort.run;
  montecarlo.run;
  yoshplus.run;
  lipsum.run;
  guessing.run;
end;

//------------------------------------------------------------------------------

begin
  initSuite;
  startRunners;
  showScore;
end.

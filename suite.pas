{$librarypath 'blibs'}
{$librarypath 'zlibs'}
{$librarypath 'benchmarks'}

program Suite;

uses
  b_system, counter,
  yoshplus, bsort, countdown_while, countdown_for,
  ludolphian, montecarlo, sieve1028, sieve1899, guessing, qr_2d, qr_1d,
  matrix_trans, floating_single, md5_hash, lipsum, chessboard;

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
  lipsum.run;
  qr_2d.run;
  qr_1d.run;
  countdown_for.run;
  countdown_while.run;
  sieve1028.run;
  sieve1899.run;
  bsort.run;
  montecarlo.run;
  ludolphian.run;
  yoshplus.run;
  guessing.run;
  floating_single.run;
  matrix_trans.run;
  md5_hash.run;
end;

//------------------------------------------------------------------------------

begin
  initSuite;
  startRunners;
  showScore;
end.

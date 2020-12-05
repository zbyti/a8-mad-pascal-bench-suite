{$librarypath 'blibs'}
{$librarypath 'zlibs'}
{$librarypath 'benchmarks'}

program Suite;

uses
  landscape, b_system, gr, counter,
  lipsum, bsort, chessboard, countdown_while, countdown_for,
  ludolphian, montecarlo, sieve1028, sieve1899, guessing, qr_2d, qr_1d,
  matrix_trans, floating_single, md5_hash, flames, flames2, yoshplus;

//------------------------------------------------------------------------------

procedure initSuite;
begin
  dmactl := $22;
  Move(pointer($e000), pointer(charset), $400);
  SystemOff;
  FillChar(pointer(counterLms), 40, 0);
  FillChar(pointer(scoreLms), $fff, 0);
  counter.init;
  EnableVBLI(counter.vblk);
end;

procedure startRunners;
begin

  flames.run;
  flames2.run;
  landscape.run;
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
  md5_hash.run;
  matrix_trans.run;

end;

//------------------------------------------------------------------------------

begin
  initSuite;
  startRunners;
  showScore;
  repeat until false;
end.

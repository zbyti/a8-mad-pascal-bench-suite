{$librarypath 'blibs'}
{$librarypath 'benchmarks'}

program Suite;

uses
  b_system,
  bsort, sieve, count_while, count_for, montecarlo, chessboard;

const
  lms = $e000;

var
  sdlstl  : word absolute $D402;
  chbas   : byte absolute $D409;

{$i counter.inc}

procedure dlScore():assembler;
asm
{
  :3  .byte $70
      .byte $42,a(lms)
  :21 .byte $02
      .byte $41,a(dlScore)
};
end;

procedure initSuite();
begin
  Move(pointer($e000), pointer($8000), $400);
  SystemOff;
  FillChar(pointer($20), $28, $ff);
  FillChar(pointer(lms), $fff, 0);
end;

procedure printScore(name: string; row: byte);
var
  crow    : word;
  i       : byte;
begin
  crow := lms+(40*row);
  Move(name[1], pointer(crow), length(name));
  for i := 0 to 4 do begin
    poke(crow+i+$f,peek($20+i)+16);
  end;
end;

begin
  initSuite;

  initCounter;

  startCounter(bsort.name);
  bsort.run;
  DisableVBLI;
  printScore(bsort.name,0);

  pause(50);

  startCounter(sieve.name);
  sieve.run;
  DisableVBLI;
  printScore(sieve.name,1);

  pause(50);

  startCounter(count_for.name);
  count_for.run;
  DisableVBLI;
  printScore(count_for.name,2);

  pause(50);

  startCounter(count_while.name);
  count_while.run;
  DisableVBLI;
  printScore(count_while.name,3);

  pause(50);

  startCounter(montecarlo.name);
  montecarlo.run;
  DisableVBLI;
  printScore(montecarlo.name,4);

  startCounter(chessboard.name);
  chessboard.run;
  DisableVBLI;
  pause(50);
  chessboard.rewriteCounter;
  printScore(chessboard.name,5);

  chbas := $80;
  sdlstl := word(@dlScore);

  repeat until false;
end.

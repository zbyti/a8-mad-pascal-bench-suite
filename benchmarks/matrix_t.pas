unit matrix_t;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure benchmark;
const
  size = 255;
var
  x         : byte absolute $e0;
  y         : byte absolute $e1;
  A, B      : array[0..0, 0..0] of byte;

begin
  for y := 0 to size do
    for x := 0 to size do A[y][x] := rnd;
  for y := 0 to size do
    for x := 0 to size do B[x][y] := A[y][x];
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Matrix 256x256 Trans'~;
end.

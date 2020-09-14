unit matrix_t;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure benchmark;
var
  x         : byte absolute $e0;
  y         : byte absolute $e1;
  A, B      : array[0..0, 0..0] of byte;

begin
  for y := 0 to 255 do
    for x := 0 to 255 do A[y][x] := rnd;
  for y := 0 to 255 do
    for x := 0 to 255 do B[x][y] := A[y][x];
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Matrix 256x256 Trans'~;
end.

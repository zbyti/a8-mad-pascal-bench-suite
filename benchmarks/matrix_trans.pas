unit matrix_trans;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure benchmark;
const
  size = 63;
var
  x         : byte absolute $e0;
  y         : byte absolute $e1;
  A         : array[0..size, 0..size] of byte absolute $a000;
  B         : array[0..size, 0..size] of byte absolute $b000;

begin
  for y := size downto 0 do
    for x := size downto 0 do A[y][x] := rnd;

  for y := size downto 0 do
    for x := size downto 0 do B[x][y] := A[y][x];
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Matrix 64x64 Trans'~;
end.

unit montecarlo;

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure benchmark;
var
  r         : word absolute $e0;
  x         : word absolute $e2;
  y         : word absolute $e4;
  bingo     : word absolute $e6;
  probe     : word absolute $e8;
  n         : byte absolute $ea;
  pi        : word absolute $ec;
begin
  bingo := 0;
  r := 127 * 127;
  for probe := 9999 downto 0 do begin
    n := rnd;
    if (n > 127) then n:= n xor %10000000;
    x := n * n;
    n := rnd;
    if (n > 127) then n:= n xor %10000000;
    y := n * n;
    if (x + y) <= r then inc(bingo);
  end;
  pi := 4 * bingo;
end;

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'MonteCarlo 10K: PI'~;
end.

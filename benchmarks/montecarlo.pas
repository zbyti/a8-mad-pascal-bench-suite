unit montecarlo;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../interface.inc'}

//---------------------- TYPES -------------------------------------------------

//---------------------- CONSTANS ----------------------------------------------
const
  name      : string = 'montecarlo';

//---------------------- VARIABLES ---------------------------------------------

var
  score     : word absolute $ec;

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

procedure run;
var
  rndNumber : byte absolute $D20A;
  i         : word absolute $e0;
  r         : word absolute $e2;
  x         : word absolute $e4;
  y         : word absolute $e6;
  bingo     : word absolute $e8;
  probe     : word absolute $ea;
  n         : byte absolute $ee;
begin
  bingo := 0;
  r := 127 * 127;
  probe := 10000;
  for i := 0 to probe do begin
    n := rndNumber;
    if (n > 127) then n:= n xor %10000000;
    x := n * n;
    n := rndNumber;
    if (n > 127) then n:= n xor %10000000;
    y := n * n;
    if (x + y) <= r then Inc(bingo);
  end;
  score := 4 * bingo;
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
end.

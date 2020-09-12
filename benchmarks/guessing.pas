unit guessing;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure benchmark;
var
  r          : word absolute $e0;
  g          : word absolute $e2;
  i          : word absolute $e4;
begin
  g := 500;
  i := 0;
  for r := 1000 downto 1 do begin
    while true do begin
      if g > r then dec(g, 100-i) else
      if g < r then inc(g, 100-i) else
        break;
      inc(i);
    end;
  end;
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Guessing Game'~;
end.

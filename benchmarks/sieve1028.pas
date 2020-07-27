unit sieve1028;

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure benchmark;
var
  flags     : array [0..8191] of boolean;
  n         : byte absolute $e0;
  k         : word absolute $e2;
  bi        : byte absolute $e4;
  count     : word absolute $e6;
begin
  for bi := 9 downto 0 do begin
    count := 0;
    fillchar(flags, sizeof(flags), true);
    for n := 2 to 91 do begin
      if flags[n] then begin
        k := n shl 1;
        while k <= 8191 do begin
          flags[k] := false;
          inc(k,n);
        end;
      end;
    end;
  end;

  for k := 2 to 8191 do begin
    if flags[k] then inc(count);
  end;
end;

procedure rewriteCounter; begin end;

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Sieve 1028 10x'~;
end.

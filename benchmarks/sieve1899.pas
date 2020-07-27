{$librarypath 'zlibs'}

unit sieve1899;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../interface.inc'}

var
  score     : word absolute $e0;

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

uses counter;

procedure benchmark;
var
  i         : word absolute $e2;
  k         : word absolute $e4;
  prime     : word absolute $e6;
  bi        : byte absolute $e8;
  flags     : array [0..8191] of boolean;
begin
  for bi := 9 downto 0 do begin
    fillchar(flags, sizeof(flags), true);
    i:=0; score := 0;
    while i <= 8191 do begin
      if flags[i] then begin
        prime := (i * 2) + 3;
        k := prime + i;
        while (k <= 8191) do begin
          flags[k] := false;
          inc(k, prime);
        end;
        inc(score);
      end;
      inc(i);
    end;
  end;
end;

procedure run;
begin
  counter.prepare(name);
  counter.stop := false;
  benchmark;
  counter.stop := true;
  pause(50);
  counter.printScore('Sieve 1899 10x'~);
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'sieve1899'~;
end.
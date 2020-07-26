{$librarypath 'zlibs'}

unit sieve1028;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../includes/interface.inc'}

var
  score     : word absolute $e6;

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

uses counter;

procedure benchmark;
var
  flags     : array [0..8191] of boolean;
  n         : byte absolute $e0;
  k         : word absolute $e2;
  bi        : byte absolute $e4;
begin
  for bi := 9 downto 0 do begin
    score := 0;
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
    if flags[k] then inc(score);
  end;
end;

procedure run;
begin
  counter.prepare(name);
  counter.stop := false;
  benchmark;
  counter.stop := true;
  pause(50);
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'sieve1028'~;
end.

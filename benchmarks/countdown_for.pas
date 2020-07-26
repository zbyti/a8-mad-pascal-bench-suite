{$librarypath 'zlibs'}

unit countdown_for;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../includes/interface.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

uses counter;

procedure benchmark;
var
  za         : byte absolute counter.lms + $21;
  zb         : byte absolute counter.lms + $22;
  zc         : byte absolute counter.lms + $23;
  zd         : byte absolute counter.lms + $24;
  ze         : byte absolute counter.lms + $25;
  zf         : byte absolute counter.lms + $26;
  zg         : byte absolute counter.lms + $27;
begin
  for za:=1 downto 0 do
    for zb:=9 downto 0 do
      for zc:=9 downto 0 do
        for zd:=9 downto 0 do
          for ze:=9 downto 0 do
            for zf:=9 downto 0 do
              for zg:=9 downto 0 do;
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
  name := 'countdown_for';
end.

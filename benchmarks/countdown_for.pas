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
  za         : byte absolute $41;
  zb         : byte absolute $42;
  zc         : byte absolute $43;
  zd         : byte absolute $44;
  ze         : byte absolute $45;
  zf         : byte absolute $46;
  zg         : byte absolute $47;
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

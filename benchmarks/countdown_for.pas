unit countdown_for;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure benchmark;
var
  za         : byte absolute gr.counterLms + $21;
  zb         : byte absolute gr.counterLms + $22;
  zc         : byte absolute gr.counterLms + $23;
  zd         : byte absolute gr.counterLms + $24;
  ze         : byte absolute gr.counterLms + $25;
  zf         : byte absolute gr.counterLms + $26;
  zg         : byte absolute gr.counterLms + $27;
begin
  for za := 1 downto 0 do
    for zb := 9 downto 0 do
      for zc := 9 downto 0 do
        for zd := 9 downto 0 do
          for ze := 9 downto 0 do
            for zf := 9 downto 0 do
              for zg := 9 downto 0 do;
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Countdown 2ML: FOR'~;
end.

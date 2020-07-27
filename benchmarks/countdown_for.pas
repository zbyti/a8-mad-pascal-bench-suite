unit countdown_for;

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

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
  for za := 1 downto 0 do
    for zb := 9 downto 0 do
      for zc := 9 downto 0 do
        for zd := 9 downto 0 do
          for ze := 9 downto 0 do
            for zf := 9 downto 0 do
              for zg := 9 downto 0 do;
end;

{$i '../inc/footer.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Countdown 2ML: FOR'~;
  isRewritable := false;
end.

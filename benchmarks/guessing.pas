unit guessing;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure benchmark;
var
  zd         : byte absolute counter.lms + $24;
  ze         : byte absolute counter.lms + $25;
  zf         : byte absolute counter.lms + $26;
  zg         : byte absolute counter.lms + $27;
  r          : word absolute $e0;
  g          : word absolute $e2;
  i          : word absolute $e4;
begin
  FillChar(pointer(counter.lms + $23), 5, 0);
  for r := 1 to 1000 do begin
    g := 500; i := 0;
    while true do begin
      if g > r then dec(g, 100-i) else
      if g < r then inc(g, 100-i) else begin
        inc(zg);
        if zg = 10 then begin inc(zf); zg := 0 end;
        if zf = 10 then begin inc(ze); zf := 0 end;
        if ze = 10 then begin inc(zd); ze := 0 end;
        break;
      end;
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

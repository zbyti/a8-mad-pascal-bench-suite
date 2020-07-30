unit yoshplus;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure benchmark;
var
  zc         : byte absolute counter.lms + $23;
  zd         : byte absolute counter.lms + $24;
  ze         : byte absolute counter.lms + $25;
  zf         : byte absolute counter.lms + $26;
  zg         : byte absolute counter.lms + $27;
begin
  FillChar(pointer(counter.lms + $23), 5, 0);
  rtclok := 0;
  while rtclok < 100 do begin
    inc(zg);
    if zg = 10 then begin inc(zf); zg := 0 end;
    if zf = 10 then begin inc(ze); zf := 0 end;
    if ze = 10 then begin inc(zd); ze := 0 end;
    if zd = 10 then begin inc(zc); zd := 0 end;
  end;
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'YoshPlus 100 frames'~;
  isRewritable := true;
end.

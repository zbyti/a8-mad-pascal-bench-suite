{$librarypath 'zlibs'}

unit yoshplus;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../interface.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

uses counter;

procedure benchmark;
var
  rtclok     : byte absolute $14;
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

procedure rewriteCounter;
begin
  Move(pointer(counter.lms + $23), pointer(counter.lms), 5);
end;

procedure run;
begin
  counter.prepare(name);
  counter.stop := false;
  benchmark;
  counter.stop := true;
  pause(50);
  rewriteCounter;
  counter.printScore('YoshPlus 100 frames'~);
end;


//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'yoshplus';
end.

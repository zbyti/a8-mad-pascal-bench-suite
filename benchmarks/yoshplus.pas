{$librarypath 'zlibs'}

unit yoshplus;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../includes/interface.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

uses counter;

procedure benchmark;
var
  rtclok     : byte absolute $14;
  zc         : byte absolute $43;
  zd         : byte absolute $44;
  ze         : byte absolute $45;
  zf         : byte absolute $46;
  zg         : byte absolute $47;
begin
  FillChar(pointer($43), 5, 0);
  rtclok := 0;
  while rtclok < 100 do begin
    inc(zg);
    if zg=10 then begin inc(zf); zg := 0 end;
    if zf=10 then begin inc(ze); zf := 0 end;
    if ze=10 then begin inc(zd); ze := 0 end;
    if zd=10 then begin inc(zc); zd := 0 end;
  end;
end;

procedure rewriteCounter;
begin
  Move(pointer($43), pointer($20), 5);
end;

procedure run;
begin
  counter.prepare(name);
  counter.stop := false;
  benchmark;
  counter.stop := true;
  pause(50);
  rewriteCounter;
end;


//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'yoshplus';
end.

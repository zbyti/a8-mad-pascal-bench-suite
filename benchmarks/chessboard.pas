{$librarypath 'zlibs'}

unit chessboard;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../includes/interface.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

uses counter;

procedure benchmark;
var
  rtclok    : byte absolute $14;
  zc        : byte absolute counter.lms + $25;
  zd        : byte absolute counter.lms + $26;
  ze        : byte absolute counter.lms + $27;
  i1b       : byte absolute $e2;
  i2b       : byte absolute $e3;
  i3b       : byte absolute $e4;
  p         : PByte absolute $e0;
begin
  FillChar(pointer($45), 3, 0);
  rtclok := 0;
  while rtclok < 150 do begin
    p := pointer($a000);
    for i3b := 7 downto 0 do begin
      for i2b := 23 downto 0 do begin
        for i1b := 3 downto 0 do begin
            p[0] := 255;
            p[1] := 255;
            p[2] := 255;
            inc(p,6);
        end;
        inc(p,16);
      end;
      if (i3b and %1) = 0 then dec(p,3) else inc(p,3);
    end;
    inc(ze);
    if ze = 10 then begin inc(zd); ze := 0 end;
    if zd = 10 then begin inc(zc); zd := 0 end;
  end;
end;

procedure rewriteCounter;
begin
  FillChar(pointer(counter.lms), 5, 0);
  Move(pointer(counter.lms + $25), pointer(counter.lms + 2), 3);
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
  name := 'Chessboard'~;
end.

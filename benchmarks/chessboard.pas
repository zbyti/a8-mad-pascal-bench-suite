unit chessboard;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../includes/interface.inc'}

var
  score     : word;

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

procedure run;
var
  rtclok    : byte absolute $14;
  zc        : byte absolute $45;
  zd        : byte absolute $46;
  ze        : byte absolute $47;
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
    if ze=10 then begin inc(zd); ze := 0 end;
    if zd=10 then begin inc(zc); zd := 0 end;
  end;
end;

procedure rewriteCounter;
begin
  FillChar(pointer($20), 5, 0);
  Move(pointer($45), pointer($22), 3);
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'chessboard';
end.

unit permutation;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

const
  pSize  = 6;
  pBoard = $e2;

procedure generate(n: byte);
var
  zd         : byte absolute counterLms + $24;
  ze         : byte absolute counterLms + $25;
  zf         : byte absolute counterLms + $26;
  zg         : byte absolute counterLms + $27;
  i          : byte;
  tmp        : byte absolute $e0;
  board      : array [0..pSize] of byte absolute pBoard;
begin

  if n = 0 then
    begin
        inc(zg);
        if zg = 10 then begin inc(zf); zg := 0 end;
        if zf = 10 then begin inc(ze); zf := 0 end;
        if ze = 10 then begin inc(zd); ze := 0 end;
    end
  else
    begin
      for i := 0 to n do begin
        tmp := board[i]; board[i] := board[n]; board[n] := tmp;
        generate(n-1);
        tmp := board[i]; board[i] := board[n]; board[n] := tmp;
      end;
    end;

end;

procedure benchmark;
var
  i          : byte absolute $e1;
begin
  for i := 0 to pSize do Poke(pBoard + i, i);
  FillChar(pointer(counterLms + $23), 5, 0);
  generate(pSize);
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := #$5d'Recur.: Permutation 7 el.'~;
end.
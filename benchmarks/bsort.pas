unit bsort;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure benchmark;
var
  i         : byte absolute $f0;
  n1        : byte absolute $f1;
  n2        : byte absolute $f2;
  size      : byte absolute $f3;
  sorttable : array[0..254] of byte absolute $a000;
begin
  for i := 0 to 254 do
    sorttable[i] := $ff - i;

  for size := 253 downto 0 do begin
    for i := 0 to 253 do begin
      n1 := sorttable[i];
      n2 := sorttable[i+1];
      if n1>n2 then begin
        sorttable[i] := n2;
        sorttable[i+1] := n1;
      end;
    end;
  end;
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Bubble Sort: 255 elements'~;
end.

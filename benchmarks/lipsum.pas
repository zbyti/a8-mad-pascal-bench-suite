unit lipsum;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure writeGr8(x, y: byte; text: string);
var
  bi1       : byte absolute $e0;
  bi2       : byte absolute $e1;
  tmp1      : word absolute $e2;
  tmp2      : word absolute $e4;
  textChar  : word absolute $e6;
begin
    tmp2 := (lms + y * 320) + x - 1;
    for bi2 := length(text) downto 1 do begin
      textChar := charset + ord(text[bi2]) * 8;
      tmp1 := tmp2 + bi2;
      for bi1 := 7 downto 0 do
        Poke(tmp1 + 40 * bi1, Peek(textChar + bi1));
    end;
end;

procedure benchmark;
var
  iter      : byte absolute $e8;
begin
  mode8;
  for iter := 23 downto 0 do
    writeGr8(0, iter, 'Lorem ipsum dolor sit amet orci aliquam.'~);
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := #$5d'Lorem Ipsum GR8'~;
end.

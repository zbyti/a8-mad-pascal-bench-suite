unit lipsum;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

const
  dlIpsum: array [0..205] of byte = (
    $70,$70,$70,
    $42,counter.lms,$00,
    $70,
    $4f,lo(lms),hi(lms),
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,
    $4f,lo(lms)-$10,hi(lms)+$10,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,
    $0f,$41,
    lo(word(@dlIpsum)),
    hi(word(@dlIpsum))
  );

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
  sdlstl := word(@dlIpsum);
  for iter := 23 downto 0 do
    writeGr8(0, iter, 'Lorem ipsum dolor sit amet orci aliquam.'~);
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Lorem Ipsum GR.8'~;
end.

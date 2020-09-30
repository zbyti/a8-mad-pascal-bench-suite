unit landscape;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

const
  base: array[0..13] of byte = (
    170,150,144,144,122,122,110,110,94,94,86,86,82,80
  );

var
  pOff     : pointer absolute $e8;
  pOn      : pointer absolute $ea;
  color4   : byte absolute $d01a;
  gprior   : byte absolute $d01b;

procedure g9off; assembler; interrupt;
asm
{
  pha
  mva #0 gprior
  mwa pOn __dlivec
  pla
};
end;

procedure g9on; assembler; interrupt;
asm
{
  pha
  mva #$40 gprior
  mwa pOff __dlivec
  pla
};
end;


procedure benchmark;
var
  stop     : byte  absolute $e0;
  start    : byte  absolute $e1;
  c        : byte  absolute $e2;
  x        : byte  absolute $e3;
  i        : byte  absolute $e4;
  z        : byte  absolute $e5;
  p        : pbyte absolute $e6;

  colheight: array[0..13] of byte;

begin
  pOff := @g9off; pOn := @g9on;
  EnableDLI(pOff); mode8;
  gprior := $40; color4 := $b0;

  for z := 9 downto 0 do begin
    move(@base, @colheight, 14);
    for x := 39 downto 0 do begin
      for i := 1 downto 0 do begin
        p := pointer(lms + x); start := 0;
        for c := 13 downto 0 do begin

          stop := colheight[c];
          if start > stop then begin
            dec(p,(start - stop) * 40);
            stop := start;
            start := colheight[c];
          end;

          if i = 1 then begin
            while start < stop do begin
              p^ := c;
              inc(p,40); inc(start);
            end;
          end else begin
            while start < stop do begin
              p^ := (p^ and %00001111) or (c shl 4);
              inc(p,40); inc(start);
            end;
          end;

          start := stop;
          if boolean(rnd and 1) then dec(colheight[c]);
          if boolean(rnd and 1) then inc(colheight[c]);

        end;
      end;
    end;
  end;
  DisableDLI; gprior := 0;
end;

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Quatari Landscape GR9 10x'~;
end.

{$librarypath 'zlibs'}

unit countdown_while;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../inc/interface.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

uses counter;

procedure benchmark;
var
  za         : byte absolute counter.lms + $21;
  zb         : byte absolute counter.lms + $22;
  zc         : byte absolute counter.lms + $23;
  zd         : byte absolute counter.lms + $24;
  ze         : byte absolute counter.lms + $25;
  zf         : byte absolute counter.lms + $26;
  zg         : byte absolute counter.lms + $27;
begin
  za := 1; zb := 9; zc := 9; zd := 9;
  ze := 9; zf := 9; zg := 9;
  while za <> $ff do begin
    zb := 9;
    while zb <> $ff do begin
      zc := 9;
      while zc <> $ff do begin
        zd := 9;
        while zd <> $ff do begin
          ze := 9;
          while ze <> $ff do begin
            zf := 9;
            while zf <> $ff do begin
              zg := 9;
              while zg <> $ff do begin
                dec(zg);
              end;
              dec(zf);
            end;
            dec(ze);
          end;
          dec(zd);
        end;
        dec(zc);
      end;
      dec(zb);
    end;
    dec(za);
  end;
end;

procedure rewriteCounter;
begin
end;

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Countdown 2ML: WHILE'~;
end.

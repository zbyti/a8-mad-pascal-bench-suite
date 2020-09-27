unit countdown_while;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

procedure benchmark;
var
  za         : byte absolute gr.counterLms + $21;
  zb         : byte absolute gr.counterLms + $22;
  zc         : byte absolute gr.counterLms + $23;
  zd         : byte absolute gr.counterLms + $24;
  ze         : byte absolute gr.counterLms + $25;
  zf         : byte absolute gr.counterLms + $26;
  zg         : byte absolute gr.counterLms + $27;
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

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'Countdown 2ML: WHILE'~;
end.

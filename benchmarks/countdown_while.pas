unit countdown_while;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../includes/interface.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

procedure run;
var
  za         : byte absolute $41;
  zb         : byte absolute $42;
  zc         : byte absolute $43;
  zd         : byte absolute $44;
  ze         : byte absolute $45;
  zf         : byte absolute $46;
  zg         : byte absolute $47;
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

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := 'countdown_while';
end.

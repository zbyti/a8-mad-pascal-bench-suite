unit count_while;

//---------------------- INTERFACE ---------------------------------------------

interface
  {$i '../interface.inc'}

//---------------------- TYPES -------------------------------------------------

//---------------------- CONSTANS ----------------------------------------------
const
  name      : string = 'count_while';

//---------------------- VARIABLES ---------------------------------------------
var
  score     : word;

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

procedure run;
var
  a         : byte absolute $41;
  b         : byte absolute $42;
  c         : byte absolute $43;
  d         : byte absolute $44;
  e         : byte absolute $45;
  f         : byte absolute $46;
  g         : byte absolute $47;
begin
  a := 1; b := 9; c := 9; d := 9;
  e := 9; f := 9; g := 9;
  while a <> $ff do begin
    b := 9;
    while b <> $ff do begin
      c := 9;
      while c <> $ff do begin
        d := 9;
        while d <> $ff do begin
          e := 9;
          while e <> $ff do begin
            f := 9;
            while f <> $ff do begin
              g := 9;
              while g <> $ff do begin
                dec(g);
              end;
              dec(f);
            end;
            dec(e);
          end;
          dec(d);
        end;
        dec(c);
      end;
      dec(b);
    end;
    dec(a);
  end;
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
end.

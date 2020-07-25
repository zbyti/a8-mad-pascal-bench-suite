var
  digi_a  : byte absolute $20;
  digi_b  : byte absolute $21;
  digi_c  : byte absolute $22;
  digi_d  : byte absolute $23;
  digi_e  : byte absolute $24;

procedure dlCounter:assembler;
asm
{
  :3  .byte $70
      .byte $42,$20,$00
      .byte $41,a(dlCounter)
};
end;

procedure vblCounter; interrupt;
begin
  asm {
    phr
  };
  inc(digi_e);
  if digi_e=10 then begin inc(digi_d); digi_e := 0 end;
  if digi_d=10 then begin inc(digi_c); digi_d := 0 end;
  if digi_c=10 then begin inc(digi_b); digi_c := 0 end;
  if digi_b=10 then begin inc(digi_a); digi_b := 0 end;
  asm {
    plr
  };
end;

procedure initCounter;
var
  i       : byte;
begin
  Move(pointer($8000), pointer($8400), $400);
  Move(pointer($8080), pointer($8400), 80);
  for i := 0 to 7 do
    poke($87f8+i, peek($8080+i) xor $ff);
  FillChar(pointer($87f0), 8, $ff);
  chbas := $84; sdlstl := word(@dlCounter);
end;

procedure startCounter(name: string);
begin
  FillChar(pointer($20), $28, $fe);
  FillChar(pointer($20), 5, 0);
  Move(name[1], pointer($26), length(name));
  pause;
  EnableVBLI(@vblCounter);
end;

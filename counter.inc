var
  a       : byte absolute $20;
  b       : byte absolute $21;
  c       : byte absolute $22;
  d       : byte absolute $23;
  e       : byte absolute $24;

procedure dlCouner:assembler;
asm
{
  :3	.byte $70
      .byte $42,$20,$00
      .byte $41,a(dlCouner)
};
end;

procedure vblCounter; interrupt;
begin
  asm {
    phr
  };
  inc(e);
  if e=10 then begin inc(d); e := 0 end;
  if d=10 then begin inc(c); d := 0 end;
  if c=10 then begin inc(b); c := 0 end;
  if b=10 then begin inc(a); b := 0 end;
  asm {
    plr
  };
end;

procedure initCounter;
begin
  Move(pointer($8000), pointer($8400), $400);
  Move(pointer($8080), pointer($8400), 80);
  FillChar(pointer($87f8), 8, $ff);
  chbas := $84; sdlstl := word(@dlCouner);
end;

procedure startCounter(name: string);
begin
  FillChar(pointer($20), $28, $ff);
  a := 0; b := 0; c :=0; d := 0; e := 0;
  Move(name[1], pointer($26), length(name));
  pause;
  EnableVBLI(@vblCounter);
end;

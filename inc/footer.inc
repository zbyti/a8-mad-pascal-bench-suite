procedure rewriteCounter;
begin
  FillChar(pointer(counter.lms), 5, 0);
  Move(pointer(counter.lms + $23), pointer(counter.lms), 5);
end;

procedure run;
begin
  counter.prepare(name);
  counter.stop := false;
  benchmark;
  counter.stop := true;
  pause(50);
  if isRewritable then rewriteCounter;
  counter.printScore;
end;
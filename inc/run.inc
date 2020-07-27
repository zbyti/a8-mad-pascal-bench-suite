procedure run;
begin
  counter.prepare(name);
  counter.stop := false;
  benchmark;
  counter.stop := true;
  pause(50);
  if isRewritable then counter.rewriteCounter;
  counter.printScore;
end;
procedure run;
begin
  counter.prepare(name);
  counter.stop := false;
  benchmark;
  counter.stop := true;
  pause(50);
  rewriteCounter;
  counter.printScore(name);
end;
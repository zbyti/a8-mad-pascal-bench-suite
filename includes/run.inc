startCounter(bsort.name);
bsort.run;
DisableVBLI;
printScore(bsort.name,0);

pause(50);

startCounter(sieve.name);
sieve.run;
DisableVBLI;
printScore(sieve.name,1);

pause(50);

startCounter(countdown_for.name);
countdown_for.run;
DisableVBLI;
printScore(countdown_for.name,2);

pause(50);

startCounter(countdown_while.name);
countdown_while.run;
DisableVBLI;
printScore(countdown_while.name,3);

pause(50);

startCounter(montecarlo.name);
montecarlo.run;
DisableVBLI;
printScore(montecarlo.name,4);

pause(50);

startCounter(chessboard.name);
chessboard.run;
DisableVBLI;
pause(50);
chessboard.rewriteCounter;
printScore(chessboard.name,5);

startCounter(yoshplus.name);
yoshplus.run;
DisableVBLI;
pause(50);
yoshplus.rewriteCounter;
printScore(yoshplus.name,6);

//---------------------------

startCounter(yoshplus.name);
yoshplus.run;
countFrames := false;
pause(50);
yoshplus.rewriteCounter;
printScore(yoshplus.name, 0);

//---------------------------

startCounter(sieve.name);
sieve.run;
countFrames := false;
printScore(sieve.name, 1);

pause(50);

//---------------------------

startCounter(bsort.name);
bsort.run;
countFrames := false;
printScore(bsort.name, 2);

pause(50);

//---------------------------

startCounter(countdown_for.name);
countdown_for.run;
countFrames := false;
printScore(countdown_for.name, 3);

pause(50);

//---------------------------

startCounter(countdown_while.name);
countdown_while.run;
countFrames := false;
printScore(countdown_while.name, 4);

pause(50);

//---------------------------

startCounter(montecarlo.name);
montecarlo.run;
countFrames := false;
printScore(montecarlo.name, 5);

pause(50);

//---------------------------

startCounter(chessboard.name);
chessboard.run;
countFrames := false;
pause(50);
chessboard.rewriteCounter;
printScore(chessboard.name, 6);

//---------------------------

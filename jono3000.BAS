lineCount = 9
DIM lines(lineCount) AS INTEGER
DIM myPosInLine(2) AS INTEGER
DIM myLine(2) AS INTEGER

REM init
CLS
RANDOMIZE TIMER
FOR i = 0 TO lineCount - 1 STEP 1
lines(i) = INT(RND * 10) + 6
REM PRINT lines(i)
NEXT i
FOR i = 0 TO 1 STEP 1
 myPosInLine(i) = 99
 myLine(i) = 99
NEXT i
myLine(1) = INT(RND * (lineCount - 1))
myPosInLine(1) = lines(myLine(1)) - 1


100
CLS
COLOR 14
PRINT "Jonotuspeli 3000"
PRINT ""
COLOR 13
PRINT "Credits: MiesJokaJuoMustikkamehuaAssemlyilla & Maitotuote"
PRINT "(C) Jumalauta 2019"
PRINT ""
PRINT ""

REM PRINT myLine(0)
REM PRINT myPisInLine(0)
FOR i = 0 TO lineCount - 1 STEP 1
 COLOR 2
 PRINT i + 1;
 COLOR 3
 PRINT CHR$(8);
 COLOR 6

 FOR j = 0 TO lines(i) - 1 STEP 1

  IF i = myLine(0) AND j = myPosInLine(0) THEN
   COLOR 10
   PRINT CHR$(2);

  ELSEIF i = myLine(1) AND j = myPosInLine(1) THEN
   COLOR 12
   PRINT CHR$(2);
  ELSE
   COLOR 6
   PRINT CHR$(1);
  END IF

 NEXT j

 PRINT ""
NEXT i
IF myPosInLine(0) = 0 THEN
 GOTO 9000
END IF
IF myPosInLine(1) = 0 THEN
 GOTO 8000
END IF
PRINT ""
2000
COLOR 11
firstTime = 0
IF myLine(0) = 99 THEN
 firstTime = 1
 PRINT "Valitse jono 1 -"; lineCount:
ELSE
 PRINT "Valitse jono 1 - "; lineCount; "tai  <enter>"
END IF

INPUT ""; inputLine
PRINT inputLine
IF firstTime = 1 THEN
 IF inputLine = 0 THEN
  GOTO 2000
 END IF
ELSE
 IF inputLine > 9 THEN
  GOTO 2000
END IF

 
END IF

IF inputLine = 0 THEN
 GOTO 200
 ELSEIF inputLine < lineCount + 1 THEN
  myLine(0) = inputLine - 1
  myPosInLine(0) = lines(myLine(0))
  lines(myLine(0)) = lines(myLine(0)) + 1

  GOTO 200
END IF
GOTO 10000

200
REM GAMELOOP
FOR i = 0 TO lineCount - 1 STEP 1
 isShrinking = INT(RND * 2)
 IF isShrinking = 1 THEN
  lines(i) = lines(i) - 1
 
  IF lines(i) < 0 THEN
  lines(i) = 0
  END IF

  IF i = myLine(0) THEN
   myPosInLine(0) = myPosInLine(0) - 1
  END IF

  IF i = myLine(1) THEN
   myPosInLine(1) = myPosInLine(1) - 1
  END IF

 ELSEIF i <> inputLine - 1 THEN

  growingCount = INT(RND * 2)
  lines(i) = lines(i) + growingCount
  
 END IF

NEXT i
GOTO 100

8000
COLOR 12
PRINT ""
PRINT "H„visit!"
GOTO 10000

9000
COLOR 10
PRINT ""
PRINT "Voitit! P„„sit kassalle ennen Lameria!"
10000


unit count_for;

//---------------------- INTERFACE ---------------------------------------------

interface
  procedure run;

//---------------------- TYPES -------------------------------------------------

//---------------------- CONSTANS ----------------------------------------------
const
  name      : string = 'count_for';

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
  for a:=1 downto 0 do
    for b:=9 downto 0 do
      for c:=9 downto 0 do
        for d:=9 downto 0 do
          for e:=9 downto 0 do
            for f:=9 downto 0 do
              for g:=9 downto 0 do;
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
end.

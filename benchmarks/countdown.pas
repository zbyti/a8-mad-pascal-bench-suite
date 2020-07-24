unit countdown;

//---------------------- INTERFACE ---------------------------------------------

interface
	procedure run;

//---------------------- TYPES -------------------------------------------------

//---------------------- CONSTANS ----------------------------------------------
const
	name		: string = 'countdown';

//---------------------- VARIABLES ---------------------------------------------

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

procedure run;
var
	a : byte absolute $30;
	b : byte absolute $31;
	c : byte absolute $32;
	d : byte absolute $33;
	e : byte absolute $34;
	f : byte absolute $35;
	g : byte absolute $36;
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

unit sieve;

//---------------------- INTERFACE ---------------------------------------------

interface
	procedure run;

//---------------------- TYPES -------------------------------------------------

//---------------------- CONSTANS ----------------------------------------------
const
	name		: string = 'sieve';

//---------------------- VARIABLES ---------------------------------------------

//---------------------- IMPLEMENTATION ----------------------------------------

implementation

procedure run;
var
  flags		: array [0..8191] of boolean;
  n			: byte absolute $e0;
  k			: word absolute $e2;
  count		: word absolute $e4;
begin
	count :=0;
	fillchar(flags, sizeof(flags), true);
	for n := 2 to 91 do begin
		if flags[n] then begin
			k := n shl 1;
			while k <= 8191 do begin
				flags[k] := false;
				Inc(k,n);
			end;
		end;
	end;

	for k := 2 to 8191 do begin
		if flags[k] then Inc(count);
	end;
end;

//---------------------- INITIALIZATION ----------------------------------------

initialization
end.

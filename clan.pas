program numberOfClan;
uses crt;
Var
  a: array[1..3000000] of longint;
	free: array[1..3000000] of longint;
	numClan: longint;
	n, i, count: longint;

Begin
  clrscr;
	
	write('n = ');
	readln(n);
	for i := 1 to n Do
	  readln(a[i]);

  FillChar(free, SizeOf(free[1])*n, 0);
	count := 0;
	for i := 1 to n Do
	  begin
			//Increase number of people of i clan
	    inc(free[a[i]]);

			//If number of people = max people
			if free[a[i]] = a[i] Then
			  Begin
					inc(count);
					free[a[i]] := 0;
					writeln('Clan ', count, ' - Population: ', a[i]);
				end;
		end;
	readln;
end.
uses crt;
var n: longint;
		tmp: integer;

Begin
  clrscr;
  write('n=');
	readln(n);
	while n > 0 Do
	  Begin
      tmp := n mod 10;
			writeln(tmp);
			n := n div 10;
		end;
	readln;
end.
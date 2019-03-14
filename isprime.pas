uses crt;
var n, count: qword;
  i: longint;


Function isPrime(n: longint): boolean;
var i: longint;
Begin
  if n <= 3 then exit(true);
	for i := 2 to trunc(sqrt(n)) Do
	  if n mod i = 0 Then
		  exit(false);
	exit(true);
end;

Begin
  clrscr;
  write('n = ');
	readln(n);
	count := 0;
	for i := n to 2*n Do
	  if isPrime(i) Then
		  inc(count);
	writeln('Count = ', count);
	readln;
end.

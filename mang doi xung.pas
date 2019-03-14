Program mangdoixung;
Const
  input = 'array.in';
	output = 'array.out';
var
  a: array[1..10000, 1..10000] of longint;
	n: longint;
Procedure PrintArray;
var i, j: integer;
Begin
  for i := 1 to n Do
	  Begin
 		  for j := 1 to n Do
			  write(a[i, j]:5);
			writeln;
		end;
end;

Procedure ReadFile;
var
  f: text;
	n: longint;
Begin
  Assign(f, input);
	reset(f);
	readln(f, n);
	for i := 1 to n Do
	  for j := 1 to n Do
		  read(a[i, j]);
	close(f);
end;

function CheoChinh: Boolean;
var i, j: integer;
Begin
	for i := 1 to n Do
	  for j := 1 to i Do
		  if a[i, j] <> a[j, i] Then
			  exit(false);
	exit(true);  
end;

function CheoPhu: Boolean;
var i, j: integer;
Begin
	for i := 1 to n Do
	  for j := 1 to i Do
		  if a[i, j] <> a[j, i] Then
			  exit(false);
	exit(true);
end;
Begin
end.
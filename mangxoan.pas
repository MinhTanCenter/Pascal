Uses crt;
Var
  m, n, x, y, i: Longint;
  dir: Integer;
  a: Array[0..10000, 0..10000] Of Longint;
Const move: Array[0..3, 1..2] Of Integer = ((0, 1), (1, 0), (0, -1), (-1, 0));

Procedure PrintArray;
Var
  i, j: Longint;
Begin
  For i := 1 To m Do
    Begin
      For j := 1 To n Do
        Write(a[i, j]:5);
        Writeln;
    End;
End;


Begin
  Clrscr;
  write('m, n = ');
  Readln(m, n);
	FillChar(a, sizeof(a),0);
	a[0, 1] := 1;
	a[1, n+1] := 1;
	a[m+1, n] := 1;
	a[m, 0] := 1;
  i := 1;
  x := 1;			// row
  y := 1;     // column
	a[1, 1] := 1;
  dir := 0;
  for i := 2 to m*n Do
	  Begin
		  //Neu cham bien hoac o da co thi phai doi huong
		  if a[y + move[dir, 1], x + move[dir,2]] <> 0 then
			   dir := (dir + 1) mod 4;
			//Gan i cho phan tu ke
		  y := y + move[dir, 1];  
			x := x + move[dir, 2]; 
			a[y, x] := i;
		end;
	PrintArray;
  Readln;
End.
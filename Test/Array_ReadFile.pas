Program _READFILE_FOR_ARRAY;
Uses crt;

Const
  INPUTFILE = 'array.txt';
  OUTPUTFILE = 'array_out.txt';
  MAXLENGTH = 1000;
Var
  N: Longint;
  // num of edges
  A: Array['A'..'Z', 'A'..'Z'] Of Longint;

Procedure ReadFile;
Var
  f: Text;
  i, tmp: Longint;
  c1, c2: Char;
Begin
  Assign(f, INPUTFILE);
  Reset(f);
  Readln(f, N);
	
  For i := 1 To n Do
    Begin
      Repeat
        Read(f, c1)
      Until (c1 <> ' ');
      Repeat
        Read(f, c2)
      Until (c2 <> ' ');
      Readln(f, tmp);
      // Writeln(c1, ' ', c2, ' ', tmp);
      // Test
      A[c1, c2] := tmp;
			A[c2, c1] := tmp;
    End;
  Close(f);
End;
Procedure PrintArray;
Var
  i, j: Char;
Begin
  For i := 'A' To Chr(65+N-1) Do
    Begin
      For j := 'A' To Chr(65+N-1) Do
        Write(A[i, j]:6);
      Writeln;
    End;
End;
Begin
  Clrscr;
  ReadFile;
	PrintArray;
  Readln;
End.
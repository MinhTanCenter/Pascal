Uses crt;

Const
  input = 'chuoikt.inp';
Var
  n: Integer;
  a: Array[1..10000] Of String;
  free, count: Array[1..10000] Of Boolean;
Procedure ReadFile;
Var
  f: Text;
  i: Integer;
Begin
  Assign(f, input);
  Reset(f);
  Readln(f, n);
  For i := 1 To n Do
    Begin
      Readln(f, a[i]);
    End;
End;
Procedure Process;
Var
  i, j: Integer;
Begin
  FillChar(free, Sizeof(free[1])*n, True);
  FillChar(count, Sizeof(count[1])*n, false); //False = chan
  For i := 1 To n Do
    If free[i] Then
      Begin
        //free[i] := False;
        For j := i + 1 To n Do
          If free[j] And (a[j] = a[i]) Then
            Begin
              free[j] := False;
              count[i] := Not count[i];
							writeln('Chang: ', a[i], ' = ', a[j]);
            End;
      End;
End;
Procedure Print;
Var
  i: Integer;
Begin
  For i := 1 To n Do
    If (not count[i]) and free[i] Then
      Begin
        Writeln(a[i]);
        //Exit;
      End;
End;
Begin
  Clrscr;
  readfile;
  Process;
  Print;
  Readln;
End.

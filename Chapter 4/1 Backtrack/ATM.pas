{  ATM.inp  cost = 390
10 390                                   >>	5
200 10 20 20 50 50 50 50 100 100            20 20 50 100 200
}
Program ATM_BackTracking;
Uses crt;
Const
  FI = 'ATM.inp';
  //FO = 'ATM.out';
  MAXN = 100;
Var
  n, cost, count: Longint;
  t: Array[1..MAXN] Of Longint;
  x: Array[1..MAXN] Of Byte;
  sum: Longint;

Procedure ReadFile;
Var
  f: Text;
  i: Integer;
Begin
  Assign(f, FI);
  Reset(f);
  Readln(f, n, cost);
  For i := 1 To n Do
    read(f, t[i]);
  Close(f);
  FillChar(x, n*Sizeof(x[1]),0);
End;

Procedure PrintResult;
Var
  i: Integer;
Begin
  If sum = cost Then
    Begin
      For i := 1 To n Do
        If x[i] = 1 Then
          Write(t[i]:6)
        Else
          Write(0:6);
      Writeln;
    End;
End;

Procedure Backtracking(i: Integer);
Var
  j: Integer;
Begin
  For j := 0 To 1 Do
    Begin
			inc(count);
      x[i] := j;
      sum := sum + x[i]*t[i];
      If i = n Then
        PrintResult
      Else
        If sum < cost Then
          Backtracking(i+1);
      sum := sum - x[i]*t[i];
      x[i] := 0;
    End;
End;
Begin
  Clrscr;
  ReadFile;
  sum := 0;
	count := 0;
  Backtracking(1);
	writeln('Count = ', count);
  Readln;
End.

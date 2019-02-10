

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
  x, bestSolution: Array[1..MAXN] Of Byte;
  max: Array[1..MAXN] Of Longint;
  sum, num, numbest: Longint;

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

Procedure InitMax;
Var
  i: Integer;
Begin
  max[n] := t[n];
  For i := n - 1 Downto 1 Do
    Begin
      max[i] := max[i + 1];
      If max[i] < t[i] Then
        max[i] := t[i];
    End;
End;

Procedure Update;
Begin
	if (sum = cost) and (num < numbest) Then
		bestSolution := x;
end;

Procedure PrintResult;
Var
  i: Integer;
Begin
  for i := 1 to n do
		if bestSolution[i] = 1 Then
			write(t[i]:6)
		Else
			write('-':6)
End;

Procedure BranchBound(i: Integer);
Var
  j: Integer;
Begin
	if num + (cost - sum)/max[i] >= numbest then begin writeln('exit'); exit;   end;
  For j := 0 To 1 Do
    Begin
      Inc(count);
      x[i] := j;
      sum := sum + x[i]*t[i];
			num := num + j;
      If i = n Then
        Update
      Else
        If sum <= cost Then
          BranchBound(i+1);
      sum := sum - x[i]*t[i];
			num := num -j;
    End;
End;
Begin
  Clrscr;
  ReadFile;
	InitMax;
	num := 0;
  sum := 0;
  count := 0;
	numbest := n + 1;
  BranchBound(1);
	PrintResult;
  Writeln('Count = ', count);
  Readln;
End.

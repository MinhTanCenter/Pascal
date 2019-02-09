// 1 2 3 4    n = 8, k =5 >12[345 [5678    i = 2: j = 2 > 5 = n - k + i
//
Program Tohop;
Uses crt;   
Const
	output = 'output.txt';
Var
  a: Array[0..100] Of Longint;
  n, k: Longint;
	f: Text;

Procedure Print;
Var
  i: Longint;
Begin
  For i := 1 To k Do
    Write(f, a[i]);
  Writeln(f);
End;

Procedure BackTracking(i: Longint);
Var
  j: Longint;
Begin
  For j := a[i - 1] + 1 To n - k + i Do
    Begin
      a[i] := j;
      If i = k Then Print
      Else Backtracking(i + 1);
    End;
End;
Begin
  Clrscr;
	Assign(f, output);
	ReWrite(f);
  a[0] := 0;
  Write('n = ');
  Readln(n);
  Write('k = ');
  Readln(k);
  Backtracking(1);
	Close(f);
  Readln;
End.
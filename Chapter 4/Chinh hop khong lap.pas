// 1 2 3 4    n = 8, k =5 >12[345 [5678    i = 2: j = 2 > 5 = n - k + i
//
Program
Tohop;
Uses crt;

Const
  output = 'output.txt';
Var
  a: Array[1..100] Of Longint;
	avail: array[1..100] of Boolean;
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
Procedure PrintS;
Var
  i: Longint;
Begin
  For i := 1 To k Do
    Write(a[i]);
  Writeln;
End;
Procedure BackTracking(i: Longint);
Var
  j: Longint;
Begin
  For j := 1 To n Do
    If avail[j] Then
      Begin
        a[i] := j;
        avail[j] := False;
        If i = k Then PrintS
        Else Backtracking(i + 1);
        avail[j] := True;
      End;
End;
Begin
  Clrscr;
  Write('n = ');
  Readln(n);
  Write('k = ');
  Readln(k);
	FillChar(avail, n*SizeOf(avail[1]), true);
  Backtracking(1);
  Readln;
End.

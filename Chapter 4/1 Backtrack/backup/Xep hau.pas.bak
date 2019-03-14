// Xep hau
//	j = 1 2 3 4 5 6 7 8
//      . . . . x . . .  hang k = 1
//      . . x . . . . .  hang k = 2
//      . . . . .
Program
XepHau;
Uses crt;

Const
  n = 8;
Var
  count: Integer;
  cheo1: Array[1-n..n-1] Of Boolean;
  cheo2: Array[1+1..n+n] Of Boolean;
  cot: Array[1..n] Of Boolean;
  result: Array[1..n] Of Integer;
Procedure Init;
Begin
  FillChar(cheo1, Sizeof(cheo1), True);
  FillChar(cheo2, Sizeof(cheo2), True);
  FillChar(cot, Sizeof(cot), True);
  count := 0;
End;

Procedure Print;
Var
  i: Integer;
Begin
  Inc(count);
  If count <= 10 Then
    Begin
      For i := 1 To n Do
        Write(result[i]);
      Writeln;
    End;
End;

Procedure Backtracking(k: Integer);
Var
  j: Integer;
Begin
  For j := 1 To n Do
    If cot[j] And cheo1[k - j] And cheo2[k + j] Then
      Begin
        result[k] := j;
        // danh dau da su dung cot j
        cot[j] := False;
        cheo1[k - j] := False;
        cheo2[k + j] := False;
        //Kiem tra nghiem
        If k = n Then Print
        Else Backtracking(k + 1);
        // Quay lui
        cot[j] := True;
        cheo1[k - j] := True;
        cheo2[k + j] := True;
      End;
End;
Begin
  Clrscr;
  Init;
  Backtracking(1);
  Readln;
End.

Program B141;
Uses crt;
Var
  a, b, i: Longint;
  free: Array[1..10000] Of Byte;
  best_result, result: Array[1..10000] Of Longint;
  count: Longint;
  best: Longint;
  f: Text;
Procedure Reset;
Begin
  FillChar(result, Sizeof(result), 0);
  FillChar(free, Sizeof(free), 0);
  count := 0;
End;
Function Square_Sum(x: Longint): Longint;
Var
  s: String;
  i: Byte;
  result: Longint;
Begin
  result := 0;
  Str(x, s);
  For i := 1 To Length(s) Do
    result := result + Sqr(Ord(s[i]) - 48);
  Exit(result);
End;
Procedure PrintResult;
Var
  i: Longint;
Begin
  For i := 1 To best Do
    Write(best_result[i], ' ');
  Writeln;
  For i := 1 To best Do
    Write(f, best_result[i], ' ');
  Writeln(f);
End;
Procedure Update;
Begin
  If count < best Then
    Begin
      Reset;
      Exit;
    End;
  If best = count Then
    Begin
      best := count;
      best_result := result;
      PrintResult;
    End;
  If count > best Then
    Begin
      best := count;
      best_result := result;
      Clrscr;
      Rewrite(f);
      Writeln('Truong hop a = ', a, ' b = ', b);
      Writeln('Do dai cac day dai nhat la: ', best);
      PrintResult;
    End;
  Reset;
End;
Procedure Calculate(x: Longint);
Var
  stop: Boolean;
  tmp : Longint;
Begin
  count := 1;
  stop := False;
  result[count] := x;
  Inc(free[x]);
  Repeat
    tmp := Square_Sum(result[count]);
    Inc(count);
    result[count] := tmp;
    Inc(free[tmp]);
    If free[tmp] > 1 Then
      Begin
        update;
        stop := True;
      End;
  Until stop;
End;
Begin
  Clrscr;
  best := 0;
  Assign(f,'xauxn.out');
  Rewrite(f);
  Write('a=');
  Readln(a);
  Write('b=');
  Readln(b);
  For i := a To b Do
    Calculate(i);
  Close(f);
  Readln;
End.

Program HoanVi_ChinhHopKhongLap;
Uses crt;
Const n = 3;
Var
  avail: Array[1..n] Of Boolean;
  result: Array[1..n] Of Integer;
	k: Integer;

Procedure PrintResult;
var i: Integer;
Begin
	for i := 1 to k Do
		write(Result[i]);
	writeln;
end;
	
Procedure Backtracking(i: Longint);
Var
  j: Longint;
Begin
  For j := 1 To n Do
    If avail[j] Then
      Begin
        result[i] := j;
        avail[j] := False;
				
        If i = k Then
          PrintResult
        Else
          Backtracking(i + 1);
					
        avail[j] := True;
      End;
End;
Begin
  Clrscr;
	FillChar(avail, n*SizeOf(avail[1]), True);
	k := n;
  Backtracking(1);
  Readln;
End.
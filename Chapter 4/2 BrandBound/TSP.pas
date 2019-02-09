Program TravellingSellsmanProblem;
Uses Crt;
Const
  MAXN = 20;
  MAXVALUE = 1000000;
  FI = 'TSP1.inp';
  FO = 'TSP.out';
Var
  graph: Array[1..MAXN, 1..MAXN] Of Longint;
  n: Integer;
  x, bestSolution: Array[1..MAXN] Of Integer;
  avail: Array[1..MAXN] Of Boolean;
  sum, best: Longint;

Procedure Init;
Begin
  FillChar(graph, n*Sizeof(graph[1]), 0);
  FillChar(avail, n*Sizeof(avail[1]), True);
  x[1] := 1;
  avail[1] := False;
  best := MAXVALUE;
End;
Procedure ReadFile;
Var
  f: Text;
  i, j: Integer;
Begin
  Assign(f, FI);
  Reset(f);
  Readln(f, n);
  Init;
  For i := 1 To n Do
    For j := 1 To n Do
      read(f, graph[i, j]);
  Close(f);
End;

Procedure PrintResult;
Var
  i: Integer;
Begin
  For i := 1 To n Do
    Write(bestSolution[i], ' > ');
  Writeln(bestSolution[1]);
End;
Procedure Update;
Begin
  If sum + graph[x[n], x[1]] < best Then
    Begin
      best := sum;
      bestSolution := x;
    End;
End;

Procedure BrandBound(i: Integer);
Var
  j: Integer;
Begin
  If sum >= best Then Exit;
  For j := 1 To n Do
    If avail[j] Then
      Begin
        x[i] := j;
        avail[j] := False;
        sum := sum + graph[x[i-1], j];
        If i = n Then
          Update
        Else
          BrandBound(i+1);
        avail[j] := True;
        sum := sum - graph[x[i-1], j];
      End;
End;
Begin
  Clrscr;
  ReadFile;
  BrandBound(2);
  PrintResult;
  Readln;
End.

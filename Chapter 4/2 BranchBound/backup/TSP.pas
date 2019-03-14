{TSP.inp
4
0 20 35 10
20 0 90 50      >> 1 > 2 > 4 > 3 > 1
35 90 0 12
10 50 12 0 }
Program TravellingSellsmanProblem;
Uses Crt;
Const
  MAXN = 20;
  MAXVALUE = 1000000;
  FI = 'TSP.inp';
  FO = 'TSP.out';
Var
  graph: Array[1..MAXN, 1..MAXN] Of Longint;
  n: Integer;  																	// number of citys
  x, bestSolution: Array[1..MAXN] Of Integer;   // results
  avail: Array[1..MAXN] Of Boolean;             // check free city (true)
  sum, best: Longint;                           // total costs

Procedure Init;
Begin
  FillChar(graph, n*Sizeof(graph[1]), 0);
  FillChar(avail, n*Sizeof(avail[1]), True);
	// begin at city 1
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
	f: Text;
Begin
	// To screen
  For i := 1 To n Do
    Write(bestSolution[i], ' > ');
  Writeln(bestSolution[1]);
	// To file
	Assign(f, FO);
	ReWrite(f);
	For i := 1 To n Do
    Write(f, bestSolution[i], ' > ');
  Writeln(f, bestSolution[1]);
	Close(f);
End;
Procedure Update;
Begin
  If sum + graph[x[n], x[1]] < best Then
    Begin
      best := sum;
      bestSolution := x;
    End;
End;

Procedure BranchBound(i: Integer);
Var
  j: Integer;
Begin
  If sum >= best Then Exit;
  For j := 1 To n Do
    If avail[j] Then
      Begin
				// Try j
        x[i] := j;
        avail[j] := False;
        sum := sum + graph[x[i-1], j];
				// Check result
        If i = n Then
          Update
        Else
          BranchBound(i+1);
				// Go back
        avail[j] := True;
        sum := sum - graph[x[i-1], j];
      End;
End;
Begin
  Clrscr;
  ReadFile;
  BranchBound(2);
  PrintResult;
  Readln;
End.
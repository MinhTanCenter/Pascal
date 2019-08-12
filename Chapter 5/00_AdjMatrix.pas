Program AdjMatrix;
Uses crt;

Const
  maxV = 200;
  INPUT = 'graph.txt';
Var
  a: Array[1..maxV, 1..maxV] Of Longint;
  avail: Array[1..maxV] Of Boolean;
  trace: Array[1..maxV] Of Longint;
  n, s, t: Longint;
Procedure Init;
Var
  i, j: Longint;
Begin
  For i := 1 To n Do
    For j := 1 To n Do
      a[i, j] := 0;
  FillChar(avail, Sizeof(avail[1])*n, True);
End;

Procedure ReadFile;
Var
  f: Text;
  i, tmp: Longint;
Begin
  Assign(f, INPUT);
  Reset(f);
  Readln(f, n, s, t);
  Init;
  For i := 1 To n Do
    Begin
      Repeat
        read(f, tmp);
        If tmp <> 0 Then
          a[i, tmp] := 1;
      Until tmp = 0;
      Readln(f);
    End;
  Close(f);
End;
Procedure PrintMatrix;
Var
  i, j: Longint;
Begin
  For i := 1 To n Do
    Begin
      For j := 1 To n Do
        Write(a[i, j]:5);
      Writeln;
    End;
End;
Procedure DFSVisit(u: Longint);
Var
  v: Longint;
Begin
  Write(u, ' ');
  avail[u] := False;
  For v := 1 To n Do
    If a[u, v] <> 0 Then
      If avail[v] Then
        Begin
          trace[v] := u;
          DFSVisit(v);
        End;
End;
Procedure Tracing;
Var
  u: Longint;
Begin
  Writeln;
  Write('Path: ');
  u := t;
  While u <> s Do
    Begin
      Write(u, ' < ');
      u := trace[u];
    End;
  Write(s);
End;
Procedure PrintMat3;
Var
  i, j: Longint;
  f: Text;
Begin
  Assign(f, 'graph3.txt');
  Rewrite(f);
  For i := 1 To n Do
    For j := i + 1 To n Do
      If a[i, j] <> 0 Then
        Writeln(f, i, ' ', j, ' ', a[i, j]);
  Close(f);
End;
Begin
  Clrscr;
  ReadFile;
  PrintMatrix;
  Write('Reachable vertices from ', s, ': ');
  DFSVisit(s);
  //trace
  Tracing;
  PrintMat3;
  Readln;
End.

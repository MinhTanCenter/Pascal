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
  queue: Array[1..maxv] Of Longint;
  front, rear: Longint;
Procedure Push(v: Longint);
Begin
  Inc(rear);
  queue[rear] := v;
End;
Function Pop: Longint;
Begin
  Pop := queue[front];
  Inc(front);
End;
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

Procedure BFSVisit(s: Longint);
Var
  u, v: Longint;
Begin
  front := 1;
  rear := 1;
  queue[front] := s;
  avail[s] := False;
  Repeat
    u := Pop;
    Write(u, ' ');
    For v := 1 To n Do
      If (a[u, v] <> 0) And avail[v] Then
        Begin
          Push(v);
          trace[v] := u;
          avail[v] := False;
        End;
  Until front > rear;
End;

Procedure Tracing;
Var
  u: Longint;
Begin
  Writeln;
  u := t;
  If avail[t] Then Writeln('No path')
  Else
    Begin
      Write('Path: ');
      While u <> s Do
        Begin
          Write(u, ' < ');
          u := trace[u];
        End;
      Write(s);
    End;
End;
Begin
  Clrscr;
  ReadFile;
  Writeln('Reachable vertices from ', s, ': ');
  BFSVisit(s);
  Tracing;
  Readln;
End.

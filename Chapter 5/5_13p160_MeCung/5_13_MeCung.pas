Program Mecung;
Uses crt;
Const
  INPUT = 'E:\Github\Pascal\Chapter 5\5_13p160_MeCung\mecung.txt';
  MAX = 100;
  dx: Array[1..4] Of Integer = (1, -1, 0, 0);
  // R, L, U, D
  dy: Array[1..4] Of Integer = (0, 0, 1, -1);
Var
  a: Array[1..MAX, 1..MAX] Of Char;
  m, n: Integer;
  //matrix m*n
  queue_x, queue_y: Array[1..MAX*MAX] Of Integer;
  rear, front: Integer;
  trace: Array[1..MAX, 1..MAX] Of Integer;
  sx, sy: Integer;
  //Position of NTH

Procedure ReadFile;
Var
  f: Text;
  i, j: Integer;
Begin
  Assign(f, INPUT);
  Reset(f);
  Readln(f, m, n);
  Writeln(m, ' x ', n);
  FillChar(a, Sizeof(a), 'X');
  For i := 1 To m Do
    Begin
      For j := 1 To n Do
        Begin
          read(f, a[i, j]);
          If a[i, j] = 'E' Then
            Begin
              sx := i;
              sy := j;
            End;
        End;
      Readln(f);
    End;
End;
Procedure PrintMatrix;
Var
  i, j: Integer;
Begin
  For i := 1 To m Do
    Begin
      For j := 1 To n Do
        Write(a[i, j]);
      Writeln;
    End;
End;

Procedure PrintTrace;
Var
  i, j: Integer;
Begin
  For i := 1 To m Do
    Begin
      For j := 1 To n Do
        Write(Trace[i, j]:2);
      Writeln;
    End;
End;
Procedure Push(x, y: Integer);
Begin
  Inc(rear);
  queue_x[rear] := x;
  queue_y[rear] := y;
End;

Procedure Pop(Var x, y: Integer);
Begin
  x := queue_x[front];
  y := queue_y[front];
  Inc(front);
End;

Procedure Init;
Var
  i: Integer;
Begin
  FillChar(trace, Sizeof(trace), $FF);
  front := 1;
  rear := 0;
  //Xet cot 1 va n
  For i := 1 To m Do
    Begin
      If a[i, 1] = 'O' Then
        Begin
          trace[i, 1] := 0;
          Push(i, 1);
        End;
      If n > 1 Then
        If a[i, n] = 'O' Then
          Begin
            trace[i, n] := 0;
            Push(i, n);
          End;
    End;
  //Xet hang 1 va m
  For i := 2 To n - 1 Do
    Begin
      If a[1, i] = 'O' Then
        Begin
          trace[1, i] := 0;
          Push(1, i);
        End;
      If m > 1 Then
        If a[m, i] = 'O' Then
          Begin
            trace[m, i] := 0;
            Push(m, i);
          End;
    End;
End;

Procedure Solve;
Var
  ux, uy, vx, vy, d: Integer;
  // d: direction
Begin
  // ?
  If trace[sx, sy] <> -1 Then Exit;
  // BFS
  Repeat
    //Writeln('BFS');
    Pop(ux, uy);
    For d := 1 To 4 Do
      Begin
        If (ux + dx[d] >= 1) And (ux + dx[d] <= n) And (uy + dy[d] >= 1) And (uy + dy[d] <= m) Then
          Begin
            vx := ux + dx[d];
            vy := uy + dy[d];
            //Writeln('vx, vy = ', vx, ' ', vy);
            //Writeln('a[',vx, ', ', vy, '] = ', a[vx, vy]);
            If (a[vx, vy] <> 'X') And (trace[vx, vy] = -1) Then
              Begin
                trace[vx, vy] := d;
                // Save direction only
                If (vx = sx) And (vy = sy) Then
                  Begin
                    //Writeln('E found');
                    Exit;
                  End;
                //Writeln('Here1');
                Push(vx, vy);
              End;
          End;
      End;
  Until front > rear;
End;

Procedure PrintResult;
Var
  ux, uy, d: Integer;
  len: Integer;
Begin
  ux := sx;
  uy := sy;
  len := 1;
  Repeat
    d := trace[ux, uy];
    If d = 0 Then Break;
    Inc(len);
    ux := ux - dx[d];
    uy := uy - dy[d];
  Until False;
  Writeln('Length = ', len);
  ux := sx;
  uy := sy;
  Repeat
    Writeln(ux, ' ', uy);
    d := trace[ux, uy];
    If d = 0 Then break;
    Inc(len);
    Dec(ux, dx[d]);
    Dec(uy, dy[d]);
  Until False;
End;
Begin
  Clrscr;
  ReadFile;
  Init;
  //Writeln('Front, Rear = ', front, ' ', rear);
  //PrintMatrix;
  Solve;
  PrintResult;
  //Writeln(trace[sx, sy]);
  //Writeln;
  //PrintTrace;
  Readln;
End.

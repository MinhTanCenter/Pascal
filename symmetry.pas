Uses crt;

Function symmetry(x, y, l: Longint): Boolean;
Var
  m, n: Longint;
  result: Boolean;
Begin
  For m := 1 To l Do
    Begin
      For n := 1 To m Do
        Begin
          If a[td_x(m,x), td_y(n, y)] <> a[td_x(n, x), td_y(m, y)] Then
            Begin
              symmetry := False;
              Exit;
            End;
        End;
    End;
  symmetry := True;
End;
Begin
  Clrscr;
  Write( symmetry(1, 2, 3));
  Readln;
End;

Program B10_60;
Uses crt;
Const
  InputFile = 'matsym.in';
  OutputFile = 'matsys.out';
  MaxNumber = 100;
Var
  N: Longint;
  a: Array[1..MaxNumber, 1..MaxNumber] Of Byte;
  ok: Array[1..MaxNumber, 1..MaxNumber] Of Boolean;
  ///////////////////
  // nhap File
  ///////////////////

Procedure readFile;
Var
  f: Text;
  i, j: Longint;
Begin
  Assign(f, InputFile);
  Reset(f);
  Readln(f, n);
  For i := 1 To n Do
    For j := 1 To n Do
      Begin
        // Lam cai gi day ta
        ok [i, j] := True;
        read(f, a[i, j]);
      End;
  Close(f);
End;
///////////////////////////////////////////////
// Quy chieu sang toa do moi x_root, y_root
///////////////////////////////////////////////
Function td_x (x, x_root: Integer): Integer;
Begin
  td_x := x + x_root - 1;
End;
Function td_y (y, y_root: Integer): Integer;
Begin
  td_y := y + y_root - 1;
End;

// Kiem tra tinh doi xung tu (x, y), do rong la width
Function symmetry(x, y, width: Longint): Boolean;
Var
  m, n: Longint;
  result: Boolean;
Begin
  For m := 1 To width Do
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
Procedure Process;
Var
  i, j, k: Longint;
  ok: Boolean;
  file_out: Text;
Begin
  ok := False;
  For i := n Downto 1 Do
    Begin
      For j := 1 To n - i + 1 Do
        Begin
          For k := 1 To n - i + 1 Do
            Begin
              If symmetry(j, k, i) Then
                Begin
                  ok := True;
                  break;
                End;
              If ok Then break;
            End;
          If ok Then break;
        End;
      If ok Then break;
    End;
  If ok Then
    Begin
      Assign(file_out, OutputFile);
      Rewrite(file_out);
      Write(file_out, j, ' ', k, ' ', i);
      Close( file_out);
    End;
End;
//main
Begin
  ReadFile;
  Process;
  writeln('Done.');
	readln;
End.
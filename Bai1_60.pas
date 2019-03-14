Program B10_60;
Uses crt;

Const
  InputFile = 'matsym3.in';
  OutputFile = 'matsys3.out';
  MaxNumber = 100;
Var
  N: Longint;
  a: Array[1..MaxNumber, 1..MaxNumber] Of Byte;

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
      read(f, a[i, j]);
  Close(f);
End;
Function x_new (x, xroot: Integer): Integer;
Begin
  x_new := x + xroot - 1;
End;

Function y_new (y, yroot: Integer): Integer;
Begin
  y_new := y + yroot - 1;
End;
Function symmetry(x, y, width: Longint): Boolean;
Var
  i, j: Longint;
Begin
  For i := 1 To width Do
    Begin
      For j := 1 To i Do
        Begin
          If a[x_new(i,x), y_new(j, y)] <> a[x_new(j, x), y_new(i, y)] Then
            Begin
              symmetry := False;
              Exit;
            End;
        End;
    End;
  symmetry := True;
End;


Procedure PrintResult(x, y, width: Longint);
Var
  f: text;
Begin
  Assign(f, OutputFile);
  Rewrite(f);
  Write(f, x, ' ', y, ' ', width);
  Close(f);
End;


Procedure Process;
Var
  width, x, y: Longint;
  ok: Boolean;
Begin
  ok := False;
	// Xet tat
  For width := n Downto 1 Do
    Begin
		  // xet tat ca (n-width+1)^2 matrix co do rong la width
      For x := 1 To n - width + 1 Do
        Begin
          For y := 1 To n - width + 1 Do
            Begin
              If symmetry(x, y, width) Then
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
    PrintResult(x, y, width);
End;
//main
Begin
  ReadFile;
  Process;
End.

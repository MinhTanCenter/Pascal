Program laygo;

Const
  fi = 'wood.inp';
  fo = 'wood.out';
Var
  lo,k,hi,mid,s,m: int64;
  i,n,H: Longint;
  f: Text;
  a: Array[0..1000005] Of Longint;

Procedure QSort(l,r:Longint);
Var
  x,i,j,tam: Longint;
Begin
  x := a[l+Random(r-l+1)];
  i := l;
  j := r;
  Repeat
    While a[i]>x Do
      Inc(i);
    While a[j]<x Do
      Dec(j);
    If i<=j Then
      Begin
        tam := a[i];
        a[i] := a[j];
        a[j] := tam;
        Inc(i);
        Dec(j);
      End;
  Until i>j;
  If i<r Then QSort(i,r);
  If l<j Then QSort(l,j);
End;

Function max(a,b:Longint): Longint;
Begin
  If a>b Then max := a
  Else max := b;
End;
Begin
  Assign(f,fi);
  Reset(f);
  Readln(f,N,M);
  lo := 0;
  hi := 0;
  For i:=1 To n Do
    Begin
      read(f,a[i]);
      hi := max(hi,a[i]);
    End;

  Qsort(1,n);
	for i := 1 to n Do
	  write(a[i] :5);
  S := 0;
  a[n+1] := 0;
  i := 1;
	writeln('i = ', i);
  While s+int64(i)*(a[i]-a[i+1])<M Do
    Begin
      s := s+i*(a[i]-a[i+1]);
			writeln('s = ', s);
      Inc(i);
			writeln('Inc i to ', i);
    End;

	writeln('m - s = ', m - s);
  If (m-s) Mod i =0 Then
		Begin
			k := (m-s) Div i;    writeln('k = m-s div i: ',  k);
		end
  Else
	  Begin
		  k := (m-s) Div i +1;
			writeln('k = m-s div i + 1: ',  k);
		end;
  H := a[i]-k;
	writeln('H = ', H);
  Assign(f,fo);
  Rewrite(f);
  Write(f,H);
  Close(f);
	readln;
End.

Program ChuyenKiTu_Bai4;
uses crt;
var
  s: string;
	p, pa, pb, i: integer;
Procedure Swap(var a, b: char);
var tmp: char;
Begin
	tmp := a;
	a := b;
	b := tmp;
end;

Begin
	ClrScr;
	write('S = ');
	readln(s);

	writeln(round(123.76));
	for i := length(s) downto 1 Do
	  Begin
			if s[i] in ['a'..'b'] Then
				if i < pos(' ', s) Then
					Begin
						write('Doi ', s[i], ' vi tri ', i, ' ve vi tri tri ', pos(' ', s), ' cua khoang trang ');
						Swap(s[i], s[pos(' ', s)]);
						writeln('S = ''', s, '''');
					end;
		end;

	for i := 1 to length(s) Do
	  Begin
			p := pos(' ', s);
			if s[i] in ['0'..'9'] Then
				if i > p Then
					Begin
						write('Doi ', s[i], ' vi tri ', i, ' ve vi tri tri ', p, ' cua khoang trang ');
						Swap(s[i], s[p]);
						writeln('S = ''', s, '''');
					end;
		end;
	Readln;
end.
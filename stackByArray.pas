Program StackByArray;
uses crt;
Const
	max = 3;
Var
  stack: array[1..max] of longint;
	last: longint;

Procedure Push(v: longint);
Begin
	if last = max Then
	  writeln('Stack is full')
	Else
	  Begin
				inc(last);
				stack[last] := v;
		end;
end;

Function Pop: longint;
Begin
  if last = 0 Then
	  writeln('Stack is empty')
	else
	  Begin
				Pop := stack[last];
				dec(last);
		end;
end;

Procedure InitStack;
Begin
  last := 0;
end;

Begin
	ClrScr;
	InitStack;
	Push(3); Push(2); Push(1);
	writeln(Pop);
	writeln(Pop);
	Push(5);
	writeln(Pop);
	readln;
end.
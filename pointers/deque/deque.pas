program DequeOfLongint;

type
	LongItem2Ptr = ^LongItem2;
	LongItem2 = record
		data: longint;
		prev, next: LongItem2Ptr;
	end;

	LongDeque = record
		first, last: LongItem2Ptr;
	end;

procedure LongDequeInit(var deque: LongDeque);
begin
	deque.first := nil;
	deque.last  := nil;
end;

procedure LongDequePushFront(var deque: LongDeque; n: longint);
var tmp: LongItem2Ptr;

begin
	new(tmp);
	tmp^.next := deque.first;
	tmp^.prev := nil;
	tmp^.data := n;

	if deque.first = nil then
		deque.last := tmp
	else
		deque.first^.prev := tmp;
	deque.first := tmp;
end;

procedure LongDequePushBack(var deque: LongDeque; n: longint);
var tmp: LongItem2Ptr;

begin
	new(tmp);
	tmp^.prev := deque.last;
	tmp^.next := nil;
	tmp^.data := n;
	
	if deque.last = nil then
		deque.first := tmp
	else
		deque.last^.next := tmp;
	deque.last := tmp;
end;

function LongDequePopFront(var deque: LongDeque; var n: longint): boolean;
var tmp: LongItem2Ptr;

begin
	if deque.first <> nil then
	begin
		tmp := deque.first;
		deque.first := deque.first^.next;	
		n := tmp^.data;
		dispose(tmp);
		LongDequePopFront := true;
	end
	else
		LongDequePopFront := false;

end;

function LongDequePopBack(var deque: LongDeque; var n: longint): boolean;
var tmp: LongItem2Ptr;

begin
	if deque.last <> nil then
	begin
		tmp := deque.last;
		deque.last := deque.last^.prev;	
		n := tmp^.data;
		dispose(tmp);
		LongDequePopBack := true;
	end
	else
		LongDequePopBack := false;
end;

var 
	test: LongDeque;
	num : longint;

begin
	LongDequeInit(test);

	while not EOF do
	begin
		read(num);
		if not EOF then
			LongDequePushBack(test, num);
	end;

	while LongDequePopFront(test, num) do 
		writeln(num);
end.

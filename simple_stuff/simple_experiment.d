import std.stdio;

struct MyStruct
{
	int data;
}

class MyClass
{
	int data;
}

void main()
{
	// Play with MyStruct object
	MyStruct struct1;
	MyStruct struct2 = struct1;
	++struct2.data;
	writeln(struct1.data); // Prints 0
	
	// Play with MyClass object
	MyClass class1 = new MyClass;
	MyClass class2 = class1;
	++class2.data;
	writeln(class1.data); // Prints 1
}
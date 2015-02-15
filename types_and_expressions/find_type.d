import std.stdio;

void main()
{
    // typeof fetches the type of an expression
    // typeid makes that type into a printable string
    writeln(typeid(typeof("Hello, world!")));
}

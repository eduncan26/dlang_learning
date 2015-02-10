import std.stdio;
import std.string;

void main()
{
    write("Enter your name: ");
    string name = readln();
    writeln("Hello ", name.strip(), "!");
}
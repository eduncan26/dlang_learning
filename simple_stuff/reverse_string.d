import std.stdio;
import std.string;
import std.conv;

void main()
{
    write("Enter a string to reverse: ");
    string input_string = readln();
    writeln(cheating_reverse_string(input_string.dup));
    writeln(reverse_string(input_string.dup));
}

string cheating_reverse_string(string s)
{
    string reversed = "";
    foreach_reverse (int i; s)
        reversed ~= i;
        return reversed.strip;
}

string reverse_string(string s)
{
    string reversed = "";
    int s_len = to!int(s.length - 1);
    for (int i = s_len; i >= 0; i--)
        reversed ~= s[i];
    return reversed.strip;
}
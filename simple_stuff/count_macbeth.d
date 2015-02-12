import std.stdio, std.string, std.conv, std.datetime;

void main()
{
    auto r = benchmark!(countMacbeth)(100);
    auto result = to!Duration(r[0] / 100);
    writeln(result);
}

void countMacbeth() 
{
    auto file = File("macbeth.txt", "r");
    int count;

    foreach(line; file.byLine()) {
        if(line.indexOf("macbeth", CaseSensitive.no) != -1) ++count;
    }
    writeln(count);
}

import std.stdio, std.regex, std.string, std.conv, std.datetime, std.traits;

void main()
{
    auto r = benchmark!(countWords)(100);
    auto result = to!Duration(r[0] / 100);
    write(result);
}

void countWords()
{
    auto file = File("macbeth.txt", "r");
    int count;

    foreach(line; file.byLine()) {
        foreach(word; split(strip(replaceAll(line, regex(r"[^a-zA-Z]"), " ")))){
            if(to!string(word.toLower) == "macbeth") {
                ++count;
                break;
            }
        }
    }
    writeln(count);
}

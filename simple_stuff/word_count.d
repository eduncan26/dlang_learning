 import std.stdio, std.string, std.algorithm, std.datetime, std.conv;

 void main() {
    auto r = benchmark!(fun)(10_000);
    auto result = to!Duration(r[0]);
    writeln(result / 10000);
 }

auto fun(){
    uint[string] frequency;
    auto file = File("hamlet.txt", "r");
    foreach (line; file.byLine()) {
        foreach (word; split(strip(line))) {
            ++frequency[word.idup];
        }
    }
    file.close;

    string[] words = frequency.keys;
    sort!((a, b) { return frequency[a] > frequency[b]; })(words);
    foreach (word; words) {
        writefln("%6u\t%s", frequency[word], word);
    }
}
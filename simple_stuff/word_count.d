 import std.stdio, std.string, std.algorithm;

 void main() {
    uint[string] frequency;
    foreach (line; stdin.byLine()) {
        foreach (word; split(strip(line))) {
            ++frequency[word.idup];
        }
    }

    string[] words = frequency.keys;
    sort!((a, b) { return frequency[a] > frequency[b]; })(words);
    foreach (word; words) {
        if (frequency[word] > 100) writefln("%6u\t%s", frequency[word], word);
    }
 }

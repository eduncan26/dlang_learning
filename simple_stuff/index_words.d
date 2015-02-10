/*
  Read a text consisting of words separated by whitespace, and associate a
  unique number with each disticnt word. Output lines of the form ID word.
*/
import std.stdio, std.string, std.conv;
/*
  The example as written in the book would not compile. There was a bug with associative arrays
  that were allowing mutable keys. A better explination can be found here.
  http://stackoverflow.com/questions/4611477/why-cant-i-store-string-keys-in-an-associative-array
*/

void main() {
    uint[string] dictionary;
    foreach (line; stdin.byLine()) {
        foreach (word; split(strip(line))) {
            if (word in dictionary) continue;
            auto newID = to!int(dictionary.length);
            dictionary[to!string(word)] = newID;
            writeln(newID, '\t', word);
        }
    }
}
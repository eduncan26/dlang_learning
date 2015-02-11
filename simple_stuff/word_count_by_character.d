import std.algorithm, std.conv, std.ascii, std.regex, std.range, std.stdio, std.string;

struct PersonaData {
    uint totalWordsSpoken;
    uint[string] wordCount;
}

void main() {
    PersonaData[string] info;

    string currentParagraph;
    foreach (line; stdin.byLine()) {
        if (line.startsWith("    ")
            && line.length > 4
            && isAlpha(line[4])) {
            currentParagraph ~= line[3 .. $];
        } else if (line.startsWith("  ")
            && line.length > 2
            && isAlpha(line[2])) {
            addParagraph(currentParagraph, info);
            currentParagraph = to!string(line[2 .. $]);
        }
    }

    printResults(info);
}

void addParagraph(string line, ref PersonaData[string] info) {
    line = strip(line);
    auto sentence = std.algorithm.find(line, ". ");

    if (sentence.empty) {
        return;
    }
    // String manipulation is needed on persona to clean up resulting string.
    // Splitting the string return the 0 index, and removing
    // the brackets, quotations, and whitespace
    auto persona = strip(split(line[0 .. $ - sentence.length], regex("\\[(.*?)"))[0]);
    sentence = toLower(strip(sentence[2 .. $]));
    auto words = split(sentence, regex("[ \t,.;:?]+"));

    if (!(persona in info)) {
        info[persona] = PersonaData();
    }

    info[persona].totalWordsSpoken += words.length;
    foreach (word; words) ++info[persona].wordCount[word];
}

void printResults(PersonaData[string] info) {
    foreach(persona, data; info) {
        writefln("%20s %6u %6u", persona, data.totalWordsSpoken, data.wordCount.length);
    }
}

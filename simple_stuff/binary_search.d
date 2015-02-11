import std.array;
import std.stdio;

unittest {
    assert(binarySearch([1, 3, 6, 7, 9, 15], 6));
    assert(!binarySearch([1, 3, 6, 7, 9, 15], 5));
}

bool binarySearch(T)(T[] input, T value) {
    while (!input.empty) {
        auto i = input.length / 2;
        auto mid = input[i];
        if (mid > value) input = input[0 .. i];
        else if (mid < value) input = input[i + 1 .. $];
        else return true;
    }
    return false;
}

import std.array;

unittest {
    assert(binarySearch([1, 3, 6, 7, 9, 15], 6));
    assert(!binarySearch([1, 3, 6, 7, 9, 15], 5));
}

bool binarySearch(T)(T[] input, T value) {
	if (input.empty) return false;
	auto i = input.length / 2;
	auto mid = input[i];
	if (mid > value) return binarySearch(input[0 .. i]);
	if (mid < value) return binarySearch(input[i + 1 .. $]);
	return true;
}

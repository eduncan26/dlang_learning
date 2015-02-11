import std.stdio, std.conv;

void main() {
    int[] arr = new int[100];
    foreach (index, elem; arr) {
        /* 
           In a foreach loop there has to be an elem argument to be able to access
           the index of the array. If you were to do foreach (index; arr) { ... } you 
           would not get the index of the array, only the current element.
        */
        arr[index] = to!int(index);
    }
    writeln(arr);
}
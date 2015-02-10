import std.stdio;

void main()
{
    int[] test_array = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    int[] empty_array = [];
    writeln(sum_array(test_array));
    writeln(sum_array(empty_array));

    writeln(sum_array_foreach(test_array));
    writeln(sum_array_foreach(empty_array));
}

int sum_array(int[] input_array)
{
    int sum;
    for (size_t i = 0; i < input_array.length; i++)
        sum += input_array[i];
    return sum;
}

int sum_array_foreach(int[] input_array)
{
    int sum;
    foreach (size_t index, int value; input_array)
        sum += input_array[index];
    return sum;
}
import std.stdio,
       std.conv,
       std.string,
       std.c.stdlib;

void main(string args[])
{
    if(args.length > 1)
    {
        foreach(arg; args[1 .. $])
        {
            writeln(fromBytesToString(getBytes(arg)));
        }
    }
    else
    {
        write("Input a binary string: ");
        writeln(fromBytesToString(getBytes(stdin.readln().strip)));
    }
}

ubyte[] getBytes(string binaryString)
{
    ubyte[] byteStringArray;
    for(int i = 0; i < binaryString.length; i += 8)
    {
        try
        {
            byteStringArray ~= to!ubyte(binaryString[i .. i + 8], 2);
        }
        catch(Error e)
        {
            stderr.writeln("A catastrophic failure occurred. Exiting\n");
            writeln(e);
            exit(0);
        }
        catch(Exception e)
        {
            stderr.writeln("An exception was thrown.");
        }
    }
    return byteStringArray;
}

string fromBytesToString(ubyte[] bytes)
{
    auto _string = "";
    foreach(_byte; bytes)
    {
        _string ~= cast(char)_byte;
    }
    return _string;
}

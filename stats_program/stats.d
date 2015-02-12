import std.stdio, std.exception;
/*
	use: $ echo 1, 5, 7, 9, 10 | ./stats Min Max Average
	output: 1 10 6.4
*/

void main(string[] args)
{
	Stat[] stats;
	foreach (arg; args[1 .. $])
	{
		auto newStat = cast(Stat) Object.factory("stats." ~ arg);
		enforce(newStat, "Invalid statistics function: " ~ arg);
		stats ~= newStat;
	}
	for (double x; readf(" %s ", &x) == 1;)
	{
		foreach (s; stats)
		{
			s.accumulate(x);
		}
	}
	foreach (s; stats)
	{
		s.postprocess();
		writeln(s.result());
	}
}

interface Stat
{
	void accumulate(double x);
	void postprocess();
	double result();
}

class IncrementalStat : Stat
{
	protected double _result;
	abstract void accumulate(double x);
	void postprocess() {}
	double result()
	{
		return _result;
	}
}

class Min : IncrementalStat
{
	this()
	{
		_result = double.max;
	}
	void accumulate(double x)
	{
		if (x < _result)
		{
			_result = x;
		}
	}
}

class Max : IncrementalStat
{
	this()
	{
		_result = double.min_normal;
	}
	void accumulate(double x)
	{
		if (x > _result)
		{
			_result = x;
		}
	}
}

class Average : IncrementalStat
{
	private uint items;
	this()
	{
		_result = 0;
	}
	void accumulate(double x)
	{
		_result += x;
		++items;
	}
	override void postprocess()
	{
		if (items)
		{
			_result /= items;
		}
	}
}

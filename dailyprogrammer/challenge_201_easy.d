/*
    Description: Sometimes you wonder. How many days I have left until.....Whatever date you are curious about.
                 Maybe a holiday. Maybe a vacation. Maybe a special event like a birthday.
                 So today let us do some calendar math. Given a date that is in the future how many 
                 days until that date from the current date?

    Input: The date you want to know about in 3 integers. I leave it to you to decide if you want to do
           yyyy mm dd or mm dd yyyy or whatever. For my examples I will be using yyyy mm dd. 
           Your solution should have 1 comment saying what format you are using for people reading your code. 
           (Note you will need to convert your inputs to your format from mine if not using yyyy mm dd)

    Output: Example Input - 2015 2 14; Example Output - 5 days from {Today} to 2015 2 14

    Challenge Inputs:  2015 7 4
                       2015 10 31
                       2015 12 24
                       2016 1 1
                       2016 2 9
                       2020 1 1
                       2020 2 9
                       2020 3 1
                       3015 2 9
*/
import std.stdio, std.string, std.conv, std.datetime;

void main()
{
    auto sysTime = split(Clock.currTime().toISOExtString, "-");
    int[] currentDate = parseDate(format("%s %s %s ", sysTime[0], sysTime[1], sysTime[2][0 .. 2]));

    writeln("Enter a date (YYYY MM DD): ");
    int[] inputDate = parseDate(readln());

    printResults(countDays(currentDate, inputDate), currentDate, inputDate);
}

unittest
{
    assert(countDays([2015, 1 ,1], [2015, 12, 31]) == 364);
    assert(countDays([2015, 1, 1], [2016, 3, 1]) == 425);
}

int countDays(int[] currentDate, int[] inputDate)
{
    int count;
    while(currentDate[0] < inputDate[0]) {
        count += isLeapYear(currentDate[0]) ? 366 : 365;
        ++currentDate[0];
    }

    for(int i = 1; i < inputDate[1]; i++){
        count += daysInMonth(i, inputDate[0]);
    }

    for(int i = 1; i < currentDate[1]; i++){
        count -= daysInMonth(i, currentDate[1]);
    }
    count += (inputDate[2] - currentDate[2]);

    return count;
}

unittest
{
    assert(isLeapYear(2012));
    assert(!isLeapYear(2100));
    assert(isLeapYear(2000));
}

bool isLeapYear(int year)
{
    bool leapYear;
    if(year % 4 == 0) leapYear = true;
    if(year % 100 == 0) leapYear = false;
    if(year % 400 == 0) leapYear = true;
    return leapYear;
}

unittest
{
    assert(parseDate("2015 10 30") == [2015, 10, 30]);
}

int[] parseDate(string date)
{
    auto split_date = split(date);
    int[] arr;
    foreach(num; split_date) {
        arr ~= to!int(num);
    }
    return arr;
}

unittest
{
    assert(daysInMonth(1, 2015) == 31);
    assert(daysInMonth(2, 2000) == 29);
    assert(daysInMonth(2, 2015) == 28);
    assert(daysInMonth(11, 2015) == 30);
}

int daysInMonth(int month, int year)
{
    int[int] daysInMonth = [1: 31, 2: isLeapYear(year) ? 29 : 28, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31];
    int days = daysInMonth[month];
    return days;
}

void printResults(int count, int[] currentDate,  int[] inputDate)
{
    writefln("%u days from %u %u %u to %u %u %u", count, currentDate[0], currentDate[1], currentDate[2],
        inputDate[0], inputDate[1], inputDate[2]);
}

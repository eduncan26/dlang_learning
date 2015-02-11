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
    string[] challengeInputs = ["2015 7 4", "2015 10 31", "2015 12 24", "2016 1 1 ", "2016 2 9", "2020 1 1", "2020 2 9", "2020 3 1", "3015 2 9"];

    auto sysTime = split(Clock.currTime().toISOExtString, "-");
    string currDate = format("%s %s %s ", sysTime[0], sysTime[1], sysTime[2][0 .. 2]);
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

int daysUntil(string currentDate, string inputDate)
{
    return 1;
}  

int daysInMonth(int month, int year)
{
    int[] days = [1: 31, 2: isLeapYear(year) ? 29 : 28, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31];
    return days[month];
}
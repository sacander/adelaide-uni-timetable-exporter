% Driver script for createTimetable().

% Was tested on an individual subject from my timetable each semster this
% year and both of my full semester timetables.

for i = 1:4
    rawInput = readInput();
    parsedInput = parseInput(rawInput);
    timetable = createTimetable(parsedInput);
    disp(timetable);
end
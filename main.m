% Reads input as string from Access Adelaide class list, displays
% timetable, and produces .csv file that can be imported into Google
% Calendar.

% Reads input given by user from Access Adelaide class list.
rawInput = readInput();

% Parses raw input character array and returns a cell array with each piece
% of data labelled.
parsedInput = parseInput(rawInput);

% Builds timetable from parsed input.
timetable = createTimetable(parsedInput);

% Displays colour coded image corresponding to one week in a timetable.
save = displayTimetable(timetable);

% Saves timetable to .csv file for importing to calendar.
if save
    writetable(timetable, "timetable.csv");
end
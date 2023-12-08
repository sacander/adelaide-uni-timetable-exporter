% Driver script for displayTimetable().

% Was tested on the dates 2/5, 25/04, 4/9 with my timetables from the
% respective sememster in addition to testing the error catching for
% example entering entering abc as the date. Exit/save functionality was
% also tested.

rawInput = readInput();
parsedInput = parseInput(rawInput);
timetable = createTimetable(parsedInput);
save = displayTimetable(timetable);
disp(save);
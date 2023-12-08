function [rawInput] = readInput(override) %#ok<INUSD> 
%READINPUT reads input given by user from Access Adelaide class list.
% Pass in any argument to use a test timetable.

% If default is passed in, loads my timetable input character array for
% ease of testing.
if exist('override', 'var')
    load('myTimetable.mat', 'rawInput');
    return
end

% Obtains input from user, which is stored in a cell array.
inputCellArray = inputdlg('Please paste your class list table.');

% Removes input from cell array, so character array can be returned.
rawInput = inputCellArray{1};

end
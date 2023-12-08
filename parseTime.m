function [startTime, endTime] = parseTime(time)
%PARSETIME parses character array containing time information and returns
%it in a form suitable for Google Calendar events.

% Splits time character array into start and end times.
time = split(time, ' - ');
startTime = time{1};
endTime = time{2};

% Adds space before am/pm and capitalises it.
startTime = [startTime(1:end-2), ' ', upper(startTime(end-1: end))];
endTime = [endTime(1:end-2), ' ', upper(endTime(end-1: end))];

end
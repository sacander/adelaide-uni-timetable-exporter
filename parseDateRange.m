function [startDate, endDate] = parseDateRange(dateRange)
%PARSEDATERANGE parses character array containing date range information
%and returns startDate and endDate datetime objects.

% Splits dateRange into start and end dates
dateRange = split(dateRange, ' - ');

% Gets current year.
currentYear = year(datetime());

% Converts to datetime object.
startDate = dateRange{1};
startDate = split(startDate, ' '); % Splits day number and month.
startDate = flip(startDate); % Puts month first as required by datetime().
startDate = strjoin(startDate); % Recombines date string.
startDate = sprintf('%s, %d', startDate, currentYear); % Appends ', year' as required by datetime().
startDate = datetime(startDate); % Converts to datetime.

if length(dateRange) == 2 % If 2 dates in range, repeat for endDate.
    endDate = dateRange{2};
    endDate = split(endDate, ' ');
    endDate = flip(endDate);
    endDate = strjoin(endDate);
    endDate = sprintf('%s, %d', endDate, currentYear);
    endDate = datetime(endDate);
else % If only 1 date given, endDate is the same as startDate.
    endDate = startDate;
end

end
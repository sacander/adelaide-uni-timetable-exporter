function [eventSubjects, eventStartDates, eventStartTimes, eventEndTimes, eventDescriptions, eventLocations] = createEvents(subject, classNumber, classType, dateRange, day, time, location)
%CREATEEVENTS returns the data needed for a Google Calendar event from the
%data provided by the Access Adelaide class list.

% Initialises vectors of event details to return.
eventSubjects = [];
eventStartDates = [];
eventStartTimes = [];
eventEndTimes = [];
eventDescriptions = [];
eventLocations = [];

% Converts time into format accepted by Google Calendar.
[startTime, endTime] = parseTime(time);

% Converts dateRange into start and end datetime objects.
[startDate, endDate] = parseDateRange(dateRange);

% Loops through date range one week at a time, appending event information
% to return vectors.
while startDate <= endDate
    eventSubjects = [eventSubjects; string(subject)];
    eventStartDates = [eventStartDates; string(startDate, 'dd/MM/uuuu')];
    eventStartTimes = [eventStartTimes; string(startTime)];
    eventEndTimes = [eventEndTimes; string(endTime)];
    eventDescriptions = [eventDescriptions; string(sprintf('%s %s %s', day, classType, classNumber))];
    eventLocations = [eventLocations; string(location)];

    startDate = startDate + calweeks(1);
end

end
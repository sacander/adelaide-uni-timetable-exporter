function [timetable] = createTimetable(parsedInput)
%CREATETIMETABLE loops through cell array input, incrementally building up
%lists containing event details which are then compiled into a table
%object.

% Initialises arrays containing all data needed for each event
subjects = [];
startDates = [];
startTimes = [];
endTimes = [];
descriptions = [];
locations = [];

% Loops through parsedInput and reads current event data.
for i = 1:size(parsedInput, 1)
    switch parsedInput{i, 2}
        case "Subject"
            currentSubject = parsedInput{i, 1};
        case "Class Number"
            currentClassNumber = parsedInput{i, 1};
        case "Class Type"
            currentClassType = parsedInput{i, 1};
        case "Date Range"
            currentDateRange = parsedInput{i, 1};
        case "Day"
            currentDay = parsedInput{i, 1};
        case "Time"
            currentTime = parsedInput{i, 1};
        case "Location"
            currentLocation = parsedInput{i, 1};
            % Creates list of events based on current information and
            % appends them to total arrays.
            [eventSubjects, eventStartDates, eventStartTimes, eventEndTimes, eventDescriptions, eventLocations] = createEvents(currentSubject, currentClassNumber, currentClassType, currentDateRange, currentDay, currentTime, currentLocation);
            subjects = [subjects; eventSubjects];
            startDates = [startDates; eventStartDates];
            startTimes = [startTimes; eventStartTimes];
            endTimes = [endTimes; eventEndTimes];
            descriptions = [descriptions; eventDescriptions];
            locations = [locations; eventLocations];
    end
end

% Creates table object containing all event information.
varNames = ["Subject", "Start Date", "Start Time", "End Time", "Description", "Location"];
timetable = table(subjects, startDates, startTimes, endTimes, descriptions, locations, 'VariableNames', varNames);

end
function [parsedInput] = parseInput(rawInput)
%PARSEINPUT parses raw input character array and returns a cell array with each piece of data labelled.

% Splits rawInput at tab character.
% This is equivalent to edge of most cells in the table of class times.
rawInput = split(rawInput, sprintf('\t'));

% List of all types of data in the input.
DATA_TYPES = ["Subject", "Class Number", "Class Type", "Date Range", "Day", "Time", "Location"];
dataTypeCounter = 1;

% Assigns type to each string piece of data and labels it in parsed input
% cell array.
parsedInput = {};
for i = 1:length(rawInput)

    % If string is a location, conducts additional parsing.
    if dataTypeCounter == 7
        % Parses location information, see parseLocation() for more details.
        [locationData, postLocationData, postLocationType] = parseLocation(rawInput{i});
        parsedInput(end+1, 1:2) = {locationData, "Location"}; % Appends location data to cell array.
        if postLocationData ~= "" % Checks if there if data following the location.
            dataTypeCounter = find(DATA_TYPES == postLocationType); % Updates dataTypeCounter to match the data type following the location.
            dataType = postLocationType;
            parsedInput(end+1, 1:2) = {postLocationData, postLocationType}; % Appends data following location to cell array.
        end

    % Assigns data type and appends it to cell array.
    else
        dataType = DATA_TYPES(dataTypeCounter);
        parsedInput(end+1, 1:2) = {rawInput{i}, dataType};
    end

    % Updates stringTypeCounter.
    dataTypeCounter = dataTypeCounter + 1;

end
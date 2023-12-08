function [locationData, postLocationData, postLocationType] = parseLocation(locationCharacterArray)
%PARSELOCATION parses a character array including the location, and returns
%the respesctive substrings containing the location data, the next piece of
%data, and what data type comes next. This is required because after a
%location in the class times table, there is no tab character so it must be
%split manually.

% Iterates through each word.
wordList = split(locationCharacterArray, ' ');
for i = 1:length(wordList)

    % Checks for numbers in the word (which don't appear in locations).
    num = str2double(wordList{i});
    if ~isnan(num)
        num = num2str(num);

        % 4 digits is a subject.
        if length(num) == 4
            j = i - 1; % Backs up to previous word (last word of subject name).
            while (all(isstrprop(wordList{j}, 'upper'))) % Finds previous word not in all caps (word before start of subject name).
                j = j - 1;
            end
            locationData = strjoin(wordList(1:j));
            postLocationData = strjoin(wordList(j+1:end));
            postLocationType = "Subject";

        % 5 digits is a class number.
        elseif length(num) == 5
            locationData = strjoin(wordList(1:i-1));
            postLocationData = strjoin(wordList(i:end));
            postLocationType = "Class Number";

        % 1 or 2 digits is a date range.
        else
            locationData = strjoin(wordList(1:i-1));
            postLocationData = strjoin(wordList(i:end));
            postLocationType = "Date Range";

        end
        return

    end

end

% Performs if no numbers are found.
locationData = strjoin(wordList);
postLocationData = '';
postLocationType = "Location";

end
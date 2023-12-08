% Driver script for parseInput().

% Tests each data type that can follow location, including the edge case of
% nothing.
inputs = [string(sprintf('a\tb\tc\td\te\tf\tg 11\th\ti'))...
          string(sprintf('a\tb\tc\td\te\tf\tg 1111\th\ti'))...
          string(sprintf('a\tb\tc\td\te\tf\tg 11111\th\ti'))...
          string(sprintf('a\tb\tc\td\te\tf\tg'))]; % Edge case

expectedOutputs = {{'a', "Subject";
                    'b', "Class Number";
                    'c', "Class Type";
                    'd', "Date Range";
                    'e', "Day";
                    'f', "Time";
                    'g', "Location";
                    '11', "Date Range";
                    'h', "Day";
                    'i', "Time"}...

                   {'a', "Subject";
                    'b', "Class Number";
                    'c', "Class Type";
                    'd', "Date Range";
                    'e', "Day";
                    'f', "Time";
                    'g', "Location";
                    '1111', "Subject";
                    'h', "Class Number";
                    'i', "Class Type"}...
                    
                    {'a', "Subject";
                    'b', "Class Number";
                    'c', "Class Type";
                    'd', "Date Range";
                    'e', "Day";
                    'f', "Time";
                    'g', "Location";
                    '11111', "Class Number";
                    'h', "Class Type";
                    'i', "Date Range"}...
                    
                    {'a', "Subject"; % Edge case
                    'b', "Class Number";
                    'c', "Class Type";
                    'd', "Date Range";
                    'e', "Day";
                    'f', "Time";
                    'g', "Location";}};

for i = 1:length(inputs)
    fprintf('Input: %s\n', inputs(i));
    fprintf('Expected Output:\n');
    disp(expectedOutputs{i});
    fprintf('Actual Output:\n');
    disp(parseInput(inputs(i)));
end

% Tests with my timetable, should correctly label all data.
disp(parseInput(readInput(true)));
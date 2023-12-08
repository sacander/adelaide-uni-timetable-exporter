% Driver script for parseLocation().

% Tests each main data type that can follow the location, in addition the
% the edge case of it being the end of the data.
inputs = ["The Braggs, Bragg Lecture Theatre 3 Mar - 7 Apr"...
          "The Braggs, Bragg Lecture Theatre 10003"...
          "Engineering & Mathematics, Teaching Room ELEC ENG 1101 Electronic Systems"...
          "Ingkarni Wardli, CAT Suite "]; % Edge case

expectedOutputs = ["The Braggs, Bragg Lecture Theatre", "3 Mar - 7 Apr", "Date Range";
                   "The Braggs, Bragg Lecture Theatre", "10003", "Class Number";
                   "Engineering & Mathematics, Teaching Room", "ELEC ENG 1101 Electronic Systems", "Subject";
                   "Ingkarni Wardli, CAT Suite", "", "Location"]; % Edge case

for i = 1:length(inputs)
    fprintf('Input: %s\n', inputs(i));
    [locationData, postLocationData, postLocationType] = parseLocation(inputs(i));

    fprintf('Expected locationData: %s\n', expectedOutputs(i, 1));
    fprintf('Actual locationData  : %s\n', locationData);

    fprintf('Expected postLocationData: %s\n', expectedOutputs(i, 2));
    fprintf('Actual postLocationData  : %s\n', postLocationData);

    fprintf('Expected postLocationType: %s\n', expectedOutputs(i, 3));
    fprintf('Actual postLocationType  : %s\n', postLocationType);

    fprintf('\n');
end
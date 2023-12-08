% Driver script for parseTime().

% Tests various am/pm times including different numbers of digits.
inputs = ["11:00am - 3:00pm"; "5:00am - 9:00am"; "12:00pm - 10:00pm"];

expectedOutputs = ["11:00 AM", "3:00 PM";
                   "5:00 AM", "9:00 AM";
                   "12:00 PM", "10:00 PM";];

for i = 1:length(inputs)
    fprintf('Input: %s\n', inputs(i));
    [startTime, endTime] = parseTime(inputs(i));

    fprintf('Expected startTime: %s\n', expectedOutputs(i, 1));
    fprintf('Actual startTime  : %s\n', startTime);

    fprintf('Expected endTime: %s\n', expectedOutputs(i, 2));
    fprintf('Actual endTime  : %s\n', endTime);

    fprintf('\n');
end
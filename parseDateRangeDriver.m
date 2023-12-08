% Driver script for parseDateRange().

% Tests multiple ranges including different numbers of digits and spanning
% more than one month. Additionally, edge case of only one date is tested.
inputs = ["1 Mar - 7 Mar"; "29 Apr - 5 May"; "7 Jun"];

expectedOutputs = ["01-Mar-2023", "07-Mar-2023";
                   "29-Apr-2023", "05-May-2023";
                   "07-Jun-2023", "07-Jun-2023";];

for i = 1:length(inputs)
    fprintf('Input: %s\n', inputs(i));
    [startDate, endDate] = parseDateRange(inputs(i));

    fprintf('Expected startTime: %s\n', expectedOutputs(i, 1));
    fprintf('Actual startTime  : %s\n', startDate);

    fprintf('Expected endTime: %s\n', expectedOutputs(i, 2));
    fprintf('Actual endTime  : %s\n', endDate);

    fprintf('\n');
end
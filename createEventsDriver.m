% Driver script for createEvents().

% Tested on general case, edge case of only one date, and a real example.
inputs = ["Subject1", "ClassNumber1", "ClassType1", "1 Mar - 5 Apr", "Day1", "11:00am - 3:00pm", "Location1";
          "Subject2", "ClassNumber2", "ClassType2", "8 Jul", "Day2", "12:00pm - 4:00pm", "Location2";
          "ENG 1002 Programming (Matlab and C)", "10263", "Workshop", "28 Feb - 4 Apr", "Tuesday", "9:00am - 11:00am", "Engineering & Mathematics, CAT Suite"];

for i = 1:size(inputs, 1)
    fprintf('Input index: %d\n', i);
    [eventSubjects, eventStartDates, eventStartTimes, eventEndTimes, eventDescriptions, eventLocations] = createEvents(inputs(i, 1), inputs(i, 2), inputs(i, 3), inputs(i, 4), inputs(i, 5), inputs(i, 6), inputs(i, 7));
    disp('eventSubjects');
    disp(eventSubjects);
    disp('eventStartDates');
    disp(eventStartDates);
    disp('eventStartTimes');
    disp(eventStartTimes);
    disp('eventEndTimes');
    disp(eventEndTimes);
    disp('eventDescriptions');
    disp(eventDescriptions);
    disp('eventLocations');
    disp(eventLocations);
    fprintf('\n');
end
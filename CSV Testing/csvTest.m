% Testing how to save data to .csv files to import into calendar.
% https://support.google.com/calendar/answer/37118?hl=en&co=GENIE.Platform%3DDesktop#zippy=%2Ccreate-or-edit-a-csv-file

% Initial test.
A = [1, 2; 3, 4];
writematrix(A, "csvTest1.csv");

% Test with calendar output.
B = ["Subject", "Start Date", "Start Time", "End Time", "Description", "Location"; "MATLAB", "18-Apr-2023", "10:00 AM", "12:00 PM", "Test for this workshop", "Eng & Maths"];
writematrix(B, "csvTest2.csv");

% Test with table object.
subjects = ["MATLAB 1"; "MATLAB 2"; "MATLAB 3"];
startDates = ["28/3/2023"; "28/3/2023"; "28/3/2023"];
startTimes = ["9:00 AM"; "10:00 AM"; "11:00 AM"];
endTimes = ["10:00 AM"; "11:00 AM"; "12:00 PM"];
descriptions = ["test1"; "test2"; "test3"];
locations = ["location1"; "location2"; "location3"];
varNames = ["Subject", "Start Date", "Start Time", "End Time", "Description", "Location"];
myTable = table(subjects, startDates, startTimes, endTimes, descriptions, locations, 'VariableNames', varNames);
disp(myTable);
writetable(myTable, "csvTest3.csv")
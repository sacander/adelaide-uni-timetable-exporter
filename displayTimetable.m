function [save] = displayTimetable(timetable)
%DISPLAYTIMETABLE displays colour coded image corresponding to one week in a timetable.

% Assigns colour values to each subject.
subjects = unique(timetable.Subject);
fprintf('Your subjects will be displayed with the following colour values:\n');
for i = 1:length(subjects)
    fprintf('%s: %d\n', subjects(i), round(255*i/length(subjects)));
end

% Loops until user exits.
while true

    % Select which week to display.
    userInput = input('Enter a date in the week you would like to see in the format dd/MM. Otherwise enter "save" to exit and save or "exit" to just exit: ', 's');
    
    % Exit condition.
    switch userInput
        case 'exit'
            save = false;
            break;
        case 'save'
            save = true;
            break;
    end
    
    % Ensures input is valid.
    try
        startDate = datetime(userInput, 'InputFormat', 'dd/MM');
    catch error
        disp('Invalid input.');
        disp(error);
        continue
    end

    % Gets date of Monday of selected week.
    startDate = dateshift(startDate, 'start', 'week');
    currentDate = startDate + caldays(1);

    % Creates blank image.
    timetableImage = zeros(9, 5);

    % Populates image.
    for i = 1:5 % Loop sthrough each day.

        for j = 1:height(timetable) % Loops through timetable.
            if timetable.("Start Date")(j) == string(currentDate, 'dd/MM/uuuu') % If date in timetable matches current date.
                startTime = timetable.("Start Time")(j); % Gets start time.
                startTime = datetime(startTime, 'InputFormat', 'hh:mm a'); % Converts to datetime object.
                startTime = string(startTime, 'HH'); % Extracts 24 hour time hour numbers.
                startTime = str2double(startTime) - 8; % Offsets by 8 to get correct placement in image.

                endTime = timetable.("End Time")(j); % Repeat wth end time.
                endTime = datetime(endTime, 'InputFormat', 'hh:mm a');
                endTime = string(endTime, 'HH');
                endTime = str2double(endTime) - 9;
                
                subjectIndex = find(subjects == timetable.Subject(j));
                colourValue = 255*subjectIndex/length(subjects);
                timetableImage(startTime:endTime, i) = colourValue; % Updates colour of timeslots in image.
            end
        end

        currentDate = currentDate + caldays(1); % Increments day.
    end

    % Displays image.
    image(timetableImage);
    xticks([1, 2, 3, 4, 5]);
    xticklabels(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]);
    yticks([0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 9.5]);
    yticklabels(["9am", "10am", "11am", "12pm", "1pm", "2pm", "3pm", "4pm", "5pm", "6pm"]);
    colorbar;

end

end
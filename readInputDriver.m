% Driver script for readInput().

% Tests override input.
disp(readInput(true));

% Calls function and displays output three times, input strings are saved
% in word doc for correctly formatting.
for i = 1:3
    disp(readInput());
end
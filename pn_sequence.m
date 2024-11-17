m = 3; % number of ffs 
x = [1 0 0]; % initial state
y = zeros(1, 7); % preallocate y for efficiency

for i = 1:7
    y(i) = x(3); % output is the last flip-flop
    s = xor(x(3), x(1)); % calculate the XOR of the first and third flip-flop
    x(3) = x(2); % shift the second flip-flop to the third
    x(2) = x(1); % shift the first flip-flop to the second
    x(1) = s;    % the new input goes into the first flip-flop
end

disp("Output sequence:");
disp(y);

% Count the number of 0s and 1s
zeroes = sum(y == 0);
ones = sum(y == 1);

disp("Number of zeroes: ");
disp(zeroes);

disp("Number of ones: ");
disp(ones);

% Check the balancing property
if (ones == zeroes + 1)
    disp("Balancing Property Satisfied");
else
    disp("Balancing Property Not Satisfied");
end

% Parameters
a = 8;
l = 8;
f = 2;
t = 0:0.01:1;
x = a * sin(2 * pi * f * t);

fs = 16 * f; % Sampling frequency
ts = 1 / fs; % Sampling period
n = 0:ts:1; % Sampled time points
xs = a * sin(2 * pi * f * n);

% Quantization steps
t1 = linspace(0, max(n));
ss = (a + a) / l; % Step size
dt = -a:ss:a; % Quantization levels
q = (-a + (-a + ss)) / 2:ss:(a + (-a + ss)) / 2;

% Input Signal
x = [3.2,3.3,3.4,3.6,3.8,3.4,3.2,3.1];

% Initialization
xcap = zeros(1, length(x)); % Predicted signal
e = zeros(1, length(x));    % Error
b = zeros(1, length(x));    % Binary representation

% Loop for prediction and quantization
for i = 1:length(x)
    if i == 1
        % First iteration
        xcap(1, i) = 0;
        e(1, i) = x(1, i);
        if e(1, i) >= 0
            b(1, i) = 1;
        else
            b(1, i) = 0;
        end
    else
        % Subsequent iterations
        if b(1, i-1) == 1
            xcap(1, i) = xcap(1, i-1) + ss; % Increase prediction
        else
            xcap(1, i) = xcap(1, i-1) - ss; % Decrease prediction
        end
        e(1, i) = x(1, i) - xcap(1, i); % Error calculation
        if e(1, i) >= 0
            b(1, i) = 1;
        else
            b(1, i) = 0;
        end
    end
end

% Display Results
disp('Quantized values:');
disp(xcap);
disp('Errors:');
disp(e);
disp('Binary values:');
disp(b);

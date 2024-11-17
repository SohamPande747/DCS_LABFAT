n = 3;                % Bit depth
L = 2^n;              % Number of quantization levels
f = 2;                % Frequency of sine wave
t = 0:0.01:1;         % Time vector

% Original Signal
y = 20 * sin(2 * pi * f * t);
subplot(4, 1, 1);
plot(t, y);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Sampling the Signal
fs = 6 * f;           % Sampling frequency
ts = 0:1/fs:1;        % Sampled time points
y1 = 20 * sin(2 * pi * f * ts);
subplot(4, 1, 2);
stem(ts, y1);
title('Sampled Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Quantization
vmax = 20;            % Maximum value
vmin = -vmax;         % Minimum value
del = (vmax - vmin) / L; % Step size
part = vmin:del:vmax;    % Partition levels
code = vmin - (del/2):del:vmax + (del/2); % Codebook levels

[ind, q] = quantiz(y1, part, code); % Quantize the signal

% Handle edge cases for indices
for i = 1:length(ind)
    if ind(i) == 0
        ind(i) = ind(max(1, i - 1)); % Replace 0 indices with the previous index
    end
end

% Correct the quantized values if at the minimum level
for i = 1:length(q)
    if q(i) == vmin - (del/2)
        q(i) = vmin + (del/2);
    end
end

% Plot the Quantized Signal
subplot(4, 1, 3);
stem(ts, q);
title('Quantized Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Binary Encoding
coded = [];
for i = 1:length(ind)
    binCode = dec2bin(ind(i) - 1, n); % Convert index to binary with `n` bits
    coded = [coded, binCode - '0'];  % Append binary digits to coded array
end

% Plot the Encoded Signal
subplot(4, 1, 4);
stairs(coded);
title('Encoded Signal');
xlabel('Index');
ylabel('Binary Value');
axis([1 length(coded) -0.5 1.5]);

% Display Results
disp('Quantization Indices:');
disp(ind);

disp('Quantized Values:');
disp(q);

disp('Binary Encoded Signal:');
disp(coded);

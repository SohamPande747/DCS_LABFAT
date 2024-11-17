fs = 1000;
bit_dur = 0.1;
num_bits = 10;
t_bit = 0:1/fs:bit_dur-1/fs;
t = 0:1/fs:(num_bits*bit_dur)-1/fs;

binMsg = randi([0, 1], 1, num_bits); % Generate random binary message
binSig = repelem(binMsg, length(t_bit)); % Repeat message for each bit duration

carFreq = 20;
f1 = carFreq;
f0 = carFreq / 2;
amp = 1;

% Modulation techniques
bask = binSig .* (amp * cos(2 * pi * carFreq * t));
bfsk = (binSig == 1) .* cos(2 * pi * f1 * t) + (binSig == 0) .* cos(2 * pi * f0 * t);
bpsk = amp * cos(2 * pi * carFreq * t + pi * (1 - binSig));

% Plotting
figure;

subplot(5, 1, 1);
plot(t, cos(2 * pi * carFreq * t));
title("Carrier Frequency");

subplot(5, 1, 2);
stairs(t, binSig, 'r');
title("Message Signal");
ylim([-0.5, 1.5]);

subplot(5, 1, 3);
plot(t, bask);
title("BASK");

subplot(5, 1, 4);
plot(t, bfsk);
title("BFSK");

subplot(5, 1, 5);
plot(t, bpsk);
title("BPSK");

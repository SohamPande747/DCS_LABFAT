data = [1 1 1 1 0 0 0 0];
input = [0 1 1 0 0 1 0 1];

y = zeros(1,length(data));

for i = 1:length(data)
    if (data(i) == 1)
        y(i) = input(i);
    else
        y(i) = ~input(i);
    end
end

time_data = 0:length(data);
data = [data, data(end)];
y = [y,y(end)];
figure;

subplot(3,1,1);
stairs(time_data, data);
title("Original Signal");
grid on;


subplot(3,1,2);
stairs(time_data, [input,input(end)]);
title("Spread Code");
grid on;

subplot(3,1,3);
stairs(time_data,y);
title("Spreading Signal");
grid on;


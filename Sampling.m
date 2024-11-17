A = 5; %amplitude
f = 2; % frequency of the original signal 

t = 0:0.001:1;

x_t = A*sin(2*pi*f*t); % original signal x(t)

subplot(3,1,1); % subplot 1 of 3 
plot(t, x_t); % graph of t and x(t)

f_s = 6*f; % sampling frequency is 6*f

Ts = 1/f_s; %sampling time 
n = f_s; %% samples

n_1 = 0:Ts:n*Ts; % discrete time for sampling 
x_s = A*sin(2*pi*f*n_1);

subplot(3,1,2);
stem(n_1, x_s);

t_bar = linspace(0, max(n_1));
x_rec = interp1(n_1, x_s, t_bar,'spline');

subplot(3,1,3);
plot(t_bar, x_rec);
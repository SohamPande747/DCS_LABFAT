am = 20;
f = 1;
t = 0:0.01:1;

x = am*sin(2*pi*f*t);

fs = 12*f;
ts = 0:1/fs:1;
xs = am*sin(2*pi*f*ts);

stepsize = 5;

xcap = zeros(1,length(xs));
q = zeros(1,length(xs));
eq = zeros(1,length(xs));
xq = zeros(1,length(xs));


e(1) = xs(1) - xcap(1);
eq(1) = (round(e(1)/stepsize)*stepsize);
xq(1) = xcap(1) + eq(1);

for n = 2:length(xs)
    xcap(n) = xq(n-1);
    e(n) = xs(n)-xcap(n);
    eq(n) = (round(e(n)/stepsize)*stepsize);
    xq(n) = xcap(n) + eq(n);

    fprintf("%f %f %f %f %f %f", xs(n), xcap(n), e(n), eq(n), xq(n));
    fprintf("\n");

end

encode = zeros(1, length(eq));
q1 = -17.5:5:17.5;
a = 1;

for i = 1:length(eq)
    [~,idx] = min(abs(eq(i)-q1));
    encode(i) = idx;
    i = i+1;
end

encodebin = dec2bin(encode,3);
ts3 = linspace(0,max(fs), 3*length(encodebin));
out = zeros(1,length(ts3));
index = 1;

for row = 1:size(encodebin,1)
    for column = 1:3
        out(index) = encodebin(row, column);
        index = index+1;
    end
end

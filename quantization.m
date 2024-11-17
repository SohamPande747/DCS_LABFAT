A = 20;
f = 2;
t = 0:0.01:1;

x1 = A*sin(2*pi*f*t);
plot(t, x1);
hold on;

dz = 2^3;
stepz = 2*A/dz;
d = -A:stepz:A;

I = (d(1:end-1)+d(2:end))/2;

for (i= 1:length(I))
    plot(t,I(i)*ones(length(t)));
end

hold off;
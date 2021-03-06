function [x] = forwardEuler()
T = 20;
epsilon = 0.03;

dy = @(y) y.^2*(1-epsilon*y);
y0 = 0.1;

N = 500;
h = T/N;
t = 0:h:T;

Y = zeros(size(t));
Y(1) = y0; 
i = 1;
while ( i < N+1)
    Y(i+1) = Y(i) + h*(dy(Y(i)));
    i = i +1;
end
figure
plot(t,Y)
title('Graph of forward euler and trapezoidal');
xlabel('0 <= t <= 20');
ylabel(' y values ');
legend('forwardEuler', 'Trapezoidal');
end

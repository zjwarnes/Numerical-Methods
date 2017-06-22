function [x] = trapezoidal()
T = 20;
N = 500;
h = T/N;
t = 0:h:T;
epsilon = 0.03;

dy = @(y) y.^2*(1-epsilon*y);
y0 = 0.1;

Y = zeros(size(t)); 
Y(1) = y0;
YT = Y;
i=1;
while ( i < N+1)
    Y(i+1) = Y(i) + h *(dy(Y(i)));
    YT(i+1) = YT(i) + (h/2)*(dy(YT(i)) + dy(Y(i+1)));
    i=i+1;
end
figure
plot(t,Y,t,YT);
xlabel('0<= t <= 20' );
ylabel('y values');
title('Forward Euler & Trapezoidal with N =500');
legend('Forward Euler', 'Trapezoidal');
end

function [T] = trapezoidalQuadrature(f, stepSize,tstart,tend)
%f = @(x) exp(-x);
h = stepSize;
t = tstart:h:tend;
j = 1;
%store trapezoidalValue
T = 0;
while j < length(t)
    %%trapezoidal method
    T = T + (h/2) * (f(t(j)) + f(t(j+1)));
    j= j+1;
end
end
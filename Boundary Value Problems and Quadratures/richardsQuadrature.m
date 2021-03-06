function [x] = richardsQuadrature()
% Ihr(f) = ( 4Ih/2(f) - Ih(f) ) / 3

%compare I(f) = integral from 0 to 1 of e^(-x) with trapezoidal
% with Integral from 0 to 1 of e^(-x) with improved quadrature

h = [1,1/2,1/4,1/8,1/16,1/32,1/64,1/128,1/256];
f = @(x) exp(-x);
j = 1;
%store trapezoidal value, and richards method value
IR = size(h);
IT = size(h);
ER = size(h);
while j <= length(h);
    %richards
    IR(j) = (4*trapezoidalQuadrature(f,h(j)/2,0,1) - trapezoidalQuadrature(f,h(j),0,1))/3;
    %composite trapezoidal
    IT(j) = trapezoidalQuadrature(f,h(j),0,1);
    ER(j) = abs(IT(j) - IR(j));
    j= j+1;
end
log2(h)
figure
plot(log2(h), log2(ER));
xlabel('log2(h) from 2^0 to 2^-8');
ylabel('log base 2 of Error, abs(CompositeTrapezoid - Richards)');
title('Composite Trapezoidal Rule and Improved Quadrature comparison');
legend('Estimated slope := 2');
end
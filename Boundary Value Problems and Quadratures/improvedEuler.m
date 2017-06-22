function [x] = improvedEuler()
%%%% yi+1 = yi + h/2((f(xi,yi) + f(xi+1, yi+1));
T = 30;
N = 1000;
h = T/N;
t = 0:h:T;

Theta1 = @(t) cos(t);
Theta2 = @(t) -sin(t);
a = pi/4;
b = 0;

%forwardEuler
Te1 = zeros(size(t));
Te1(1) = a;
Te2 = zeros(size(t));
Te2(1) = b;

%improved Euler
T1 = zeros(size(t));
T1(1) = a;

T2 = zeros(size(t));
T2(1) = b;

i = 1;
while(i < N +1)
    %perfrom forwaard euler to get yi+1
    Te1(i+1) = Te1(i) + h*(Theta1(t(i)));
    Te2(i+1) = Te2(i) + h*(Theta2(t(i)));
   
    %perform improvedEuler
    T1(i+1) = T1(i) + (h/2)*(Theta1(t(i)) + Theta1(t(i+1)));
    T2(i+1) = T2(i) + (h/2)*(Theta2(t(i)) + Theta2(t(i+1)));
    i = i+1;
end

E = @(t, tp) (tp).^2/2 - cos(t);

%En1 = zeros(size(t));
%En1 = E(Te1,Te2);

%En2 = zeros(size(t));
%En2 = E(T1,T2);

figure
%plot(t, En1, t, En2)
plot(t,Te1);
hold on
plot(Te1,Te2);
plot(t,T1);
plot(T1,T2);
hold off
xlabel('t values');
ylabel('theta values');
legend('Forward Euler theta vs t' , 'Forward Euler theta'' vs theta', 'Improved Euler theta vs t', 'Improved Euler theta'' vs t');


end
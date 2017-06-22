function [x,k] = richardson(A,b,x0,omega,tol, N)

%A is the matrix,
%b is a vertor
%N is the number of iterations 

w = omega;
x = zeros(length(b),N);
x(:,1) = x0;

k=1;
while k==1 || norm(x(:,k) - x(:,k-1)) > tol
    x(:,k+1) = w*(b-A*x(:,k)) + x(:,k);
    k=k+1;    
end
k=k-1;
end
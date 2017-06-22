function [x,k] = jacobi(A, b, x0, tol, N)

%A is the matrix,
%b is a vertor
%N is the number of iterations 

x = zeros(length(b),N);
x(:,1) = x0;

k=1;
while k==1 || norm(x(:,k) - x(:,k-1)) > tol
    for i = 1:length(A)
       x(i,k+1) = (1/A(i,i)) * (b(i) - (A(i,:)*x(:,k) - A(i,i).*x(i,k)));
    end
    k=k+1;    
end
k=k-1;
end
function [x,k] = gaussSeidel(A,b,x0,tol,N)
%A is the matrix,
%b is a vertor
%N is the number of iterations 

x = zeros(length(b),N);
x(:,1) = x0;

k=1;
while k==1 || norm(x(:,k) -x(:,k-1)) > tol
    for i = 1:length(A)
        upper = 0;
        lower = 0;
        if(i+1 <= length(A))
            upper = (A(i,i+1:end)*x(i+1:end,k));
        end
        if(i-1 > 0)
            lower = (A(i,1:i-1)*x(1:i-1,k+1));
        end
       
        x(i,k+1) = (1/A(i,i)) * (b(i) - upper - lower);   
    end
    k=k+1;    
end
k=k-1;
end
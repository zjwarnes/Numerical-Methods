function [x,k] = SOR(A,b,x0,theta,tol,N)

%A is the matrix,
%b is a vertor
%N is the number of iterations 

T = theta;
x = zeros(length(b),N);
x(:,1) = x0;

k=1;
while k==1 || norm(x(:,k) - x(:,k-1)) > tol
    for i = 1:length(A)
        upper = 0;
        lower = 0;
        if(i+1 <= length(A))
            upper = (A(i,i+1:end)*x(i+1:end,k));
        end
        if(i-1 > 0)
            lower = (A(i,1:i-1)*x(1:i-1,k+1));
        end
       
        x(i,k+1) = (1-T)*x(i,k) + (T/A(i,i)) * (b(i) - upper - lower);   
    end
    k=k+1;    
end
end
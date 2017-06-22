function [u] = finiteDifference(h)
%N is the number of subinterval, there are N+1 nodes
%if N = 1 then there are no internal nodes
N = 1/h;
nodes = N+1;
x = 0:h:1;

alpha = 1;
beta = 1+exp(1);
f = @(x) 3 - 2*x;

A = zeros(N-1);
b = zeros(N-1,1);

%case where h = 1/2
if(nodes == 3)
    A(1,1) = 2/(h^2)-2;
    %f(x(2)) since x index starts at 1 and we want internal nodes
    b(1) = f(x(2)) + (3/(2*h)+1/(h^2))*alpha -(3/(2*h)-1/(h^2))*beta;
end

%u1 and un-1 are assigned uniquely, the rest can be done iteratively
if(nodes >= 4)
    %initial values
    A(1,1) = 2/(h^2)-2;
    A(1,2) = 3/(2*h)-1/(h^2);

    A(N-1,N-2) = -3/(2*h)-1/(h^2);
    A(N-1,N-1) = 2/(h^2)-2;

    b(1) = f(x(2)) + (3/(2*h)+1/(h^2))*alpha;
    b(N-1) = f(x(length(x)-1)) -(3/(2*h)-1/(h^2))*beta;

    %internal nodes follow the same pattern with more than 4 nodes
    if(nodes >=5)
        j = 2;
        %only rows from 2:N-2 follow the same pattern
        for i=2:N-2
            %Assign matrix values
            A(i,j-1) = -3/(2*h)-1/(h^2);
            A(i,j) =  2/(h^2)-2;
            A(i,j+1) = 3/(2*h)-1/(h^2);
    
            %Assign vector values, i+1 since idx starts at 1 not 0
            b(i) = f(x(i+1));
            j=j+1;
        end
    end
end

u = A\b;
end
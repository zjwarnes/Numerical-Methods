function [c,k] = newtonsMethodMulti(x0,iterMax)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Need to figure out how to evaluate a function in a cell array
%or 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Function F(x,y) in R^2
%Fxy = {@(x,y) x.^2+y.^2-4; @(x,y) x+sin(x*y)-y};
Fxy1 = @(x,y) x.^2+y.^2-4;
Fxy2 = @(x,y) x+sin(x*y)-y;

%Jacobian of F(x,y)
%Jxy = {@(x,y) 2*x , @(x,y) y ; @(x,y) 1+y*cos(x*y), @(x,y) x*cos(x*y)-1};
Jxy1 = @(x,y) 2*x;
Jxy2 = @(x,y) 2*y ;
Jxy3 = @(x,y) 1+y*cos(x*y);
Jxy4 = @(x,y) x*cos(x*y)-1;
%Stopping criteria
tolerance = 10^-8;

%this is initialized to the vecotr (1,1)
xk = x0';

for n = 1:iterMax
    %exit condition is when the norm of Fxy < 10*-8
    %Fxy * Fxy' multiplies and sums the terms for the norm
    
    nrm = norm(Fxy1(xk(1,1),xk(1,2)) , Fxy2(xk(1,1),xk(1,2)) );
    
    %if ( (Fxy1(xk(1,1),xk(1,2)) == 0 && Fxy2(xk(1,1),xk(1,2)) == 0 ) || nrm <tolerance)    
    if(nrm == 0 || nrm < tolerance)
        c = xk;
        k = n;
        return
    end
    
    jacob = [Jxy1(xk(1,1),(xk(1,2))), Jxy2(xk(1,1),(xk(1,2))); Jxy3(xk(1,1),(xk(1,2))), Jxy4(xk(1,1),(xk(1,2)))];   
    yk =  jacob \ [ -Fxy1(xk(1,1),xk(1,2)) ; -Fxy1(xk(1,1),xk(1,2))];
    xk1 = xk + yk';
  
    
    xk = xk1;  %change index for next iteration
end
c = -1;
k = -1;

end
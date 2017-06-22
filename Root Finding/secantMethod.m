function [c,k] = secantMethod(x1 ,x0, tol, iterMax)

f = @(x) x.^3-2*x-5;

xk =x0;
xk1 =x1;
for n =1:iterMax
   %exit condition defined to be error a sequence term and x*
   if (f(xk) == 0) || abs(xk - 2.0945514815423)<tol
       c = xk;
       k = n;
       return
   end
   xk2 = xk - f(xk)/((f(xk1)-f(xk))/(xk1-xk)); 
   
   xk = xk1; %change the indices
   xk1 = xk2;
end
end

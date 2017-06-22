function [c,k] = fixedPoint(x0,tol,iterMax)

f = @(x) (-log(x)-2*(x+1))/-2;

xn=x0;
for n = 1:iterMax
   %exit condition defined to be error a sequence term and x*
   if (f(xn) == xn) || abs(f(xn)-xn)<tol
       c = f(xn);
       k = n;
       return;
   end
   xn1 = f(xn);
   xn = xn1;
end
end
function [c,k] = newtonsMethod(x0,tol,iterMax)

f = @(x) x.^3 - 2*x -5;
f1 = @(x) 3*x.^2 - 2;

xk = x0;
for n = 1:iterMax
    %exit condition defined to be error a sequence term and x*
    if (f(xk) == 0) || abs(xk - 2.0945514815423)<tol
        c = xk;
        k = n;
        return
    end
    xk1 = xk - f(xk)/f1(xk);
    
    xk = xk1;  %change index for next iteration
end

end
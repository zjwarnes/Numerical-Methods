function [c, k] = bisection(a,b,tol,iterMax)

f = @(x) x.^3 -2*x -5;

if(sign(f(a))==sign(f(b)))
    warning('f(a) and f(b) have the same sign');
end

for n = 1:iterMax
    c = (a+b)/2;
    %exit condition defined to be error between c and x*
    if (f(c) == 0) | (b-a)/2 < tol | abs(c-2.0945514815423)<tol
        k =n;
        return;
    end
    if (sign(f(c)) == sign(f(a)))
        a=c;
    else
        b=c;
    end
end

end
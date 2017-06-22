function y = errorConvergence()
g = @(x) 2.^(-x);
h = g(1:8);

error = zeros(size(h));

fExact = @(x) exp(x) + x;

for i=1:length(h)
   x = 0:h(i):1;
   %finite difference only calculates internal nodes,
   %so ingore x0 and xn for the exact solution, difference would just be 0
   
   %vectorized implementation
   %errorVec = fExact(x(2:end-1))' - finiteDifference(h(i));
   %error(i) =  (errorVec'*errorVec)^(1/2);
   
   error(i) = abs(norm(fExact(x(2:end-1))' - finiteDifference(h(i))));
end
figure
plot(log(h),log(error),log(h),log(h.^(1.6)));
xlabel('log(h)       h = 2^-1, ... 2^-8');
ylabel('log(error)      abs(norm(exact-finiteDifference))');
title('Log of Error vs h graph');

y = (log(error(length(h)))-log(error(1)))/(log(h(length(h))) - log(h(1)));
legend(sprintf('Slope = %1.4f', y));
end
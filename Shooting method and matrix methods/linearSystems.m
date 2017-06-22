function [k] = linearSystems()

A = [ 3 , -1 , 0 ; -1 , 3 , -1 ; 0 , -1 , 3 ];
b = [ 2 , 2 , -1 ]';
x0 = [ 1 , 0 , 0 ]';

omega = 0.2;
theta = 1.1;

tol = 10^-10;
N = 100;

[x,kJacobi] = jacobi(A,b,x0,tol,N);
[x,kGaussSeidel] = gaussSeidel(A,b,x0,tol,N);
[x,kRichardson] = richardson(A,b,x0,omega,tol,N);
[x,kSOR] = SOR(A,b,x0,theta,tol,N);

k = [kRichardson, kJacobi, kGaussSeidel, kSOR]';


end
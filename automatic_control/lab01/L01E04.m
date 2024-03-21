clear all
close all
clc

tol = 1e-3;

A = [0 1 0 0; -1 0 0 0; 3 0 0 0; 0 0 2 0];
B = [1; 0; 0; 0];
C = [1 0 0 0];
% D =

x0 = [0; 0; 0; 0];

s = tf('s');
U = sqrt(2)/(s^2+2); % Step a
% U = 1/(s^2+1); % Step b

% Calculate X
X = zpk(minreal(inv(s*eye(size(A,1))-A)*(B*U+x0),tol))

% Calculate PFE
[num_x1, den_x1] = tfdata(X(1),'v')
[r1,p1] = residue(num_x1, den_x1)
[num_x2, den_x2] = tfdata(X(2),'v')
[r2,p2] = residue(num_x2, den_x2)
[num_x3, den_x3] = tfdata(X(3),'v')
[r2,p2] = residue(num_x2, den_x2)
[num_x4, den_x4] = tfdata(X(4),'v')
[r2,p2] = residue(num_x2, den_x2)

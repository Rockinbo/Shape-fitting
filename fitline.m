function [ a,b,c,d] = fitline(M)
% Fitting a line in space
% Input: M is an n-by-3 matrix, each row represents the three-dimensional coordinates of a point
% Output: line coefficients a, b, c, d
% The equation of the fitted line: (x-b)/a=(y-d)/c=z
% By：Rockinbo
% Time:2021-9-1 13:54:14
sum_x=sum(M(:,1));
sum_y=sum(M(:,2));
sum_z=sum(M(:,3));

sum_xz=0;
sum_yz=0;
sum_zz=0;

n=size(M,1);

for i=1:n
    sum_xz=sum_xz+M(i,1)*M(i,3);
    sum_yz=sum_yz+M(i,2)*M(i,3);
    sum_zz=sum_zz+M(i,3)*M(i,3);
end

Ka=[sum_xz,sum_x;sum_yz,sum_y;];
Kb=[sum_zz,sum_z;sum_z,n;]^-1;

K=Ka*Kb;

a=K(1,1);b=K(1,2);c=K(2,1);d=K(2,2);


end


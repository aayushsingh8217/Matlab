clear all
clc

%declaring the vector 
%mu=0;
x=[-3,-2,-1,0,1,2,3];
%var=1;

%making porbability distribution object
pd = makedist('Normal','mu',0,'sigma',2);
d = makedist('Normal');
cdf_pd=cdf(pd,x);
plot(x,cdf_pd);




clear all
clc

%declaring the vector
x=-5:1:5;

%mean and variance
mu=0;
sigma=1;

cdf_x=cdf("Normal",x,mu,sigma);
plot(x,cdf_x)

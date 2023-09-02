clear all
clc

%creating the matrix size for which i will generate the random varibles
N=8;
M=1;

%creating a 1*8 uniformly distributed random varibles
R=rand(M,N);
subplot(2,2,1)
stem(R)


%Creating a uniformly distributed random variables
RN=randn(M,N);
subplot(2,2,2)
stem(RN)


%Creating a Gamma Function
RG=gamma(R);
subplot(2,2,3)
stem(RG)

%Creating a exponential function
RE=exp(R);
subplot(2,2,4)
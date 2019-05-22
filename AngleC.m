function [ c ] = AngleC( X, Z, x, z )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

c = 2*atan((-(X^2 - 2*X*x + x^2 + Z^2 - 2*Z*z + z^2)/(X^2 - 2*X*x + x^2 + Z^2 - 2*Z*z + z^2 - 900))^(1/2));
    
end


function [ A ] = intermediate( qi, qf, i, wo, ao )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  
    A(1)=0;
    A(2)=wo;
    A(3)=qi + i*(qf-qi)/10;
end


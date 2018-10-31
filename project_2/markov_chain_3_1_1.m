clear all;

% This file calculates and plots the probability you are on each of the
% four pages at a given iteration. Ths file was used to solve problem 3.1.1
% in Project 2 for APPM 2360 Fall 2018

% Create right transition matrix A
A = [0.5, 0.25, 0.25, 0; 
     0.5, 0.5, 0, 0;
     0.5/3, 0.5/3, 0.5, 0.5/3;
     0, 0, 0.5, 0.5];
 


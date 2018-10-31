clear all;

% This file calculates and plots the markov chain of the model internet.
% Ths file was used to solve problem 2.1.1 in Project 2 for APPM 2360 Fall 2018

% Create right transition matrix A and markov chain object
A = [0.5, 0.25, 0.25, 0, 0;
     0.5, 0.5, 0, 0, 0; 
     0.5/3, 0.5/3, 0.5, 0.5/3, 0; 
     0, 0, 0.25, 0.5, 0.25; 
     0, 0, 0, 0, 1];
mc = dtmc(A,'StateNames',["colorado.edu" "colorado.edu/map" "colorado.edu/amath" "colorado.edu/amath/2360" "colorado.edu/project2.pdf"]);


% Set the figure properties
fig = figure(1);
fig.Resize = 'off';
fig.PaperUnits = 'inches';
fig.Units = 'inches';
fig.PaperPositionMode = 'manual';
fig.PaperPosition = [0, 0, 11, 6.8];
fig.PaperSize = [11, 6.8];
fig.Position = [0.1, 0.1, 10.9, 6.7];

% Background color
fig.Color = [253, 253, 253]/255;

% Prevent the background color from chaning on save
fig.InvertHardcopy = 'off';

% Set axes properties
ax = gca;
ax.FontName = 'LaTeX';
ax.TickLabelInterpreter = 'LaTeX';
ax.FontSize = 16;



hold on
axis off
graphplot(mc,'ColorNodes',true,'ColorEdges',true, 'LabelEdges',true)
t = title("Modelling five webpages as a Markov Chain");
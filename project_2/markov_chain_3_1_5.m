clear all;

% This file calculates and plots the probability you are on each of the
% four pages at a given iteration. Ths file was used to solve problem 3.1.1
% in Project 2 for APPM 2360 Fall 2018

% Create right transition matrix A 
A = [0.5, 0.25, 0.25, 0, 0;
     0.5, 0.5, 0, 0, 0; 
     0.5/3, 0.5/3, 0.5, 0.5/3, 0; 
     0, 0, 0.25, 0.5, 0.25; 
     0, 0, 0, 0, 1];
% We want the left eigenvectors of the transition matrix, we get them by
% finding the eigen vectors of the transpose of the transition matrix.
[V, D] = eig(A'); % D = eigenvalues, V = right eigenvectors

% We only care about the eigenvalues that == 1, we also need to normalize
% the eigenvectors (so that they sum to 1)
P = V(:,find(isAlways(diag(D) == 1)))';P = P./sum(P)

% Get array of state distributions
x = linspace(1,250,250);
y = zeros(1, 5, 250);
for ii = x
    temp_mat = abs(P - [1, 0, 0, 0, 0] * A^ii);
     y(:,:,ii) = temp_mat;
end

% Colors for the lines that will be plotted
colors = [235, 206, 43;
          112, 44, 140;
          219, 105, 23;
          150, 205, 230;
          186, 28, 48]/255;
      
% Set the figure properties
fig = figure(1);
fig.Resize = 'off';
fig.PaperUnits = 'inches';
fig.Units = 'inches';
fig.PaperPositionMode = 'manual';
fig.PaperPosition = [0, 0, 10, 5];
fig.PaperSize = [10, 6.18];
fig.Position = [0.1, 0.1, 9.9, 6.08];

% Background color
fig.Color = [253, 253, 253]/255;

% Prevent the background color from chaning on save
fig.InvertHardcopy = 'off';

% Set axes properties
ax = gca;
ax.FontName = 'LaTeX';
ax.TickLabelInterpreter = 'LaTeX';
ax.FontSize = 16;
ax.YLim = [0, 1];
ax.XLabel.Interpreter = 'LaTeX';
ax.YLabel.Interpreter = 'LaTeX';
ax.YLabel.String = 'Absolute Error of Probability';
ax.XLabel.String = 'Steps';
ax.ColorOrder = colors;
ax.Box = 'off';
ax.LineWidth = 1.5;
ax.YGrid = 'on';
ax.XColor = [29, 29, 29]/255;
ax.YColor = [29, 29, 29]/255;
ax.Color = [253, 253, 253]/255;
ax.YMinorGrid = 'off';
ax.YScale = 'log';

      

hold on
p = plot(x, reshape(y(1,:,:),[5,250]));

% Set line widths
set(p, 'LineWidth', 2);

% Add a legend
lgd = legend('colorado.edu', 'colorado.edu/map','colorado.edu/amath', 'colorado.edu/amath/2360', 'colorado.edu/project2.pdf');
lgd.Box = 'off';
lgd.TextColor = [29, 29, 29]/255;
lgd.Location = 'northeast';

t = title("Absolute Error of Probability After n Steps");
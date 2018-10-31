clear all;

% This file calculates and plots the euler approximations for elements A,
% B, and C when A is added at a constant rate P in both linear and semilogy
% scales. This file was used to solve problem 3.1.7 in Project 1 for APPM
% 2360 Fall 2018

% Define constants and N_A'(t)
k_A = 1/5;
k_B = 1/15;
A_0 = 15000;
P = 5000;
N_A_prime = @(t, N_A) -k_A * N_A + P;

% Generate values from out function
t = linspace(0, 100, 100*100+1);
y1 = ode_euler(N_A_prime, t, A_0); % N_A(t) w/ P
N_B_prime = @(t_x, N_B) k_A * y1(find(t == t_x)) - k_B * N_B;
y2 = ode_euler(N_B_prime, t, 0); % N_B(t) w/ P
N_C_prime = @(t_x, N_C) k_B * y2(find(t == t_x));
y3 = ode_euler(N_C_prime, t, 0); % N_C(t) w/ P

% Colors for the lines that will be plotted
colors = [235, 206, 43;
          112, 44, 140;
          219, 105, 23]/255;

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
ax.YLim = [15000, 450000];
ax.XLabel.Interpreter = 'LaTeX';
ax.YLabel.Interpreter = 'LaTeX';
ax.YLabel.String = 'Number of Atoms';
ax.XLabel.String = 't (seconds)';
ax.ColorOrder = colors;
ax.Box = 'off';
ax.LineWidth = 1.5;
ax.YGrid = 'on';
ax.XColor = [29, 29, 29]/255;
ax.YColor = [29, 29, 29]/255;
ax.Color = [253, 253, 253]/255;
ax.YMinorGrid = 'off';

% Adjust these settings to switch from linear to log
ax.YScale = 'log';
%ax.YTick = [1, 15000, 25000, 50000, 75000];
%ax.YTickLabel = [1, 15000, 25000, 50000, 75000];
ax.YTick = [15000, 25000, 75000, 200000, 450000];

% Plot the functions
hold on;
p = [plot(t, y1); % N_A(t) w/ P
     plot(t, y2); % N_B(t) w/ P
     plot(t, y3)]; % N_C(t) w/ P

% Set line widths
set(p, 'LineWidth', 2);

% Add a legend
lgd = legend('N_{A}(t) (with P)', 'N_{B}(t) (with P)','N_{C}(t) (with P)');
lgd.Box = 'off';
lgd.TextColor = [29, 29, 29]/255;
lgd.Location = 'northwest';

t = title("Euler Method Approximation of N_{A}(t), N_{B}(t), and N_{C}(t) (with P)");
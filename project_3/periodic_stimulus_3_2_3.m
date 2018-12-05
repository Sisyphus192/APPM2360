clear all;
sympref('HeavisideAtOrigin',1); % matlab system variable 

% This file calculates and plots v(t) and h(t) with stimulus
% For problem 3.2.3a/b in project 3

% Define constants and our DEs
a = 0.15;
k = 8;
mu_1 = 0.2;
mu_2 = 0.3;
epsilon_0 = 0.002;
T = 100; % new stimulation period variable
S = @(t, T) 0; % Set S(t) = 0 when plotting initial stimus
%S = @(t, T) 0.25*(heaviside(mod(t,T)-10) - heaviside(mod(t,T)-14));

% 1st voltage nullcline is v=0 and is not a function
voltage_nullcline_2 = @(v,h) k.*(a-v).*(v-1);
gating_nullcline_1 = @(v,h) -epsilon_0.*(v+mu_2)./mu_1;
gating_nullcline_2 = @(v,h) k.*v.*(a-v+1);

% Plot our sample solutions
tspan = linspace(0,500,2501);
x=zeros(1,2);
f=@(t,x) [k.*x(1).*(a - x(1)).*(x(1) - 1) - x(2).*x(1) + S(t, T); ...
          -(epsilon_0 + (x(2)*mu_1)/(mu_2 + x(1)))*(x(2) - k*x(1)*(a - x(1) + 1))];
[~,y1] = ode45(f,tspan, [0.25 0.0]); % set v_0 to 0.25 for inital stimulus

% Colors for the lines that will be plotted
colors = [161, 202, 241;
          190, 0, 50]/255;

% Set the figure properties
fig = figure(1);
fig.Resize = 'off';
fig.PaperUnits = 'inches';
fig.Units = 'inches';
fig.PaperPositionMode = 'manual';
fig.PaperPosition = [0, 0, 10, 6.18];
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
ax.YLim = [-0.05, 2.75];
ax.XLim = [0, 500];
ax.XLabel.Interpreter = 'LaTeX';
ax.YLabel.Interpreter = 'LaTeX';
ax.YLabel.String = 'Voltage and Gating Variable';
ax.XLabel.String = 'Time (t)';
ax.ColorOrder = colors;
ax.Box = 'off';
ax.LineWidth = 1.5;
ax.YGrid = 'on';
ax.XColor = [29, 29, 29]/255;
ax.YColor = [29, 29, 29]/255;
ax.Color = [253, 253, 253]/255;
ax.YMinorGrid = 'off';

% Plot the functions
hold on;

p = [plot(tspan, y1(:,1)); % 2nd voltage nullcline
     plot(tspan, y1(:,2))]; % 1st gating nullcline
     
% Set line widths
set(p, 'LineWidth', 2);

% Add a legend
lgd = legend('$v(t)$', ... 
             '$h(t)$');
lgd.Box = 'off';
lgd.Interpreter = 'LaTeX';
lgd.TextColor = [29, 29, 29]/255;
lgd.Location = 'best';

% Set title parameters
t = title("$v(t)$ and $h(t)$ with Initial Stimulus");
t.Color = [29, 29, 29]/255;
t.Interpreter = 'LaTeX';
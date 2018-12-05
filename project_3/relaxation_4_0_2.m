clear all;
sympref('HeavisideAtOrigin',1); % matlab system variable 

% This file calculates and plots the relaxation
% across various stimulation periods. For problem 4.0.2 in project 3

% Define constants
a = 0.15;
k = 8;
mu_1 = 0.2;
mu_2 = 0.3;
epsilon_0 = 0.002;
v_c = 0.1; % new critical voltage constant
h_min = []; % empty array to store h_min values
tspan = linspace(0,1000,5001);

% Define our stimulation function
S = @(t, T) 0.25*(heaviside(mod(t,T)-10) - heaviside(mod(t,T)-14));

% Calculate h_min values across several stimulation periods
for T = [50 60 70 80 90 100]
    x=zeros(1,2);
    f=@(t,x) [k.*x(1).*(a - x(1)).*(x(1) - 1) - x(2).*x(1) + S(t, T); ...
              -(epsilon_0 + (x(2)*mu_1)/(mu_2 + x(1)))*(x(2) - k*x(1)*(a - x(1) + 1))];
    [~,y1] = ode45(f, tspan, [0.0 0.0]);
    
    % find h_min
    if min(y1(end-floor(5*T/2):end,2)) ~= y1(end,2) % if the smallest h value is at the end, then tspan ends mid beat
        h_min = [h_min; [T, min(y1(end-floor(5*T/2):end,2))]];
    else
        h_min = [h_min; [T, min(y1(end-5*T:end-floor(5*T/2),2))]];
    end
end

% Colors for the lines that will be plotted
colors = [112, 44, 140]/255;

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
ax.YLim = [0.015, 0.045];
ax.XLim = [50, 100];
ax.XLabel.Interpreter = 'LaTeX';
ax.YLabel.Interpreter = 'LaTeX';
ax.YLabel.String = 'Relaxation ($\overline{h}$)';
ax.XLabel.String = 'Stimulation Period (T)';
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
p = plot(h_min(:,1), h_min(:,2));
     
% Set line widths
set(p, 'LineWidth', 2);

% Add a legend
lgd = legend('$\overline{h}$');
lgd.Box = 'off';
lgd.Interpreter = 'LaTeX';
lgd.TextColor = [29, 29, 29]/255;
lgd.Location = 'northeast';

% Set title properties
t = title("$\overline{h}$ vs Stimulation Period");
t.Color = [29, 29, 29]/255;
t.Interpreter = 'LaTeX';
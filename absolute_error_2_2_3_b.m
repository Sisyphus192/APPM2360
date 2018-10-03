clear all;

% Define constants and N_A'(t)
k_A = 1/5;
A_0 = 15000;
N_A_prime = @(t, N_A) -k_A*N_A;

% Generate values from out function
t = linspace(0, 50, 5001);
y1 = A_0 * exp(-k_A * t);
y2 = abs(y1 - ode_euler(N_A_prime, t, A_0)); % h = 0.01
y3 = abs(y1(1:10:end) - ode_euler(N_A_prime, t(1:10:end), A_0)); % h = 0.1
y4 = abs(y1(1:100:end) - ode_euler(N_A_prime, t(1:100:end), A_0)); % h = 1


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
ax.YLim = [1, inf];
ax.XLabel.Interpreter = 'LaTeX';
ax.YLabel.Interpreter = 'LaTeX';
ax.YLabel.String = 'Absolute Error (Number of Atoms of Element A)';
ax.XLabel.String = 't (seconds)';
ax.ColorOrder = colors;
ax.Box = 'off';
ax.LineWidth = 1.5;
ax.YGrid = 'on';
ax.XColor = [29, 29, 29]/255;
ax.YColor = [29, 29, 29]/255;
ax.Color = [253, 253, 253]/255;
ax.YMinorGrid = 'off';

% Adjust this settings to switch from linear to log
ax.YScale = 'log';




% Plot the functions
hold on;
p = [plot(t, y2); % h = 0.01
     plot(t(1:10:end), y3); % h = 0.1
     plot(t(1:100:end), y4)]; % h = 1

% Set line widths
set(p, 'LineWidth', 2);

% Add a legend
lgd = legend('Absolute Error @h=0.01','Absolute Error @h=0.1','Absolute Error @h=1');
lgd.Box = 'off';
lgd.Interpreter = 'LaTeX';
lgd.TextColor = [29, 29, 29]/255;

t = title("Absolute Error of Euler Method Approximation of N_{A}(t)");
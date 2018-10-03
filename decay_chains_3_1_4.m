clear all;

% Define constants and N_A'(t)
k_A = 1/5;
k_B = 1/15;
A_0 = 15000;

% Generate values from out function
t = linspace(0, 150, 150*100+1);
y1 = A_0 * exp(-k_A * t); % N_A(t)
y2 = ((A_0 * k_A) / (k_B - k_A)) * (exp(-k_A * t) - exp(-k_B * t)); % N_B(t)
y3 = (A_0 / (k_B - k_A)) * (k_A * exp(-k_B * t) - k_B * exp(-k_A * t)) + A_0; % N_C(t)



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
ax.YLim = [1, 15000];
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
%ax.YScale = 'log';
ax.YTick = [1, 3000, 6000, 9000, 12000, 15000];
%ax.YTick = round(logspace(log10(1), log10(15000), 6));




% Plot the functions
hold on;
p = [plot(t, y1); % N_A(t)
     plot(t, y2); % N_B(t)
     plot(t, y3)]; % N_C(t)

% Set line widths
set(p, 'LineWidth', 2);

% Add a legend
lgd = legend('Absolute Error @h=0.01','Absolute Error @h=0.1','Absolute Error @h=1');
lgd.Box = 'off';
lgd.Interpreter = 'LaTeX';
lgd.TextColor = [29, 29, 29]/255;

t = title("Absolute Error of Euler Method Approximation of N_{A}(t)");
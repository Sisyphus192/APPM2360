clear all;

% This file calculates and plots the nullcline for problem 3.1.1 c

% Define constants and our DEs
a = 0.15;
k = 8;
mu_1 = 0.2;
mu_2 = 0.3;
epsilon_0 = 0.002;
S = 0;

% 1st voltage nullcline is v=0 and is not a function
voltage_nullcline_2 = @(v,h) k.*(a-v).*(v-1);
gating_nullcline_1 = @(v,h) -epsilon_0.*(v+mu_2)./mu_1;
gating_nullcline_2 = @(v,h) k.*v.*(a-v+1);


% Generate our vector field
v = linspace(-0.05, 1.2, 126);
h = linspace(-0.05, 2.75, 281); 
y1 = voltage_nullcline_2(v,h); % 2nd voltage nullcline
y2 = gating_nullcline_1(v,h); % 1st gating nullcline
y3 = gating_nullcline_2(v,h); % 2nd gating nullcline

% Plot our sample solutions
tspan = [0 500];
x=zeros(1,2);
f=@(t,x) [k.*x(1).*(a - x(1)).*(x(1) - 1) - x(2).*x(1) + S; ...
          -(epsilon_0 + (x(2)*mu_1)/(mu_2 + x(1)))*(x(2) - k*x(1)*(a - x(1) + 1))];
[t,y4] = ode45(f,tspan, [0.25 0.0]);


% Colors for the lines that will be plotted
colors = [161, 202, 241;
          161, 202, 241;
          190, 0, 50;
          190, 0, 50;
          219, 105, 23;
          219, 105, 23]/255;

% Set the figure properties
fig = figure(1);
fig.Resize = 'off';
fig.PaperUnits = 'inches';
fig.Units = 'inches';
fig.PaperPositionMode = 'manual';
% Not setting fig size here because legend needs to be accounted for
%fig.PaperPosition = [0, 0, 10, 6.18];
%fig.PaperSize = [10, 6.18];
%fig.Position = [0.1, 0.1, 9.9, 6.08];


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
ax.XLim = [-0.05, 1.2];
ax.XLabel.Interpreter = 'LaTeX';
ax.YLabel.Interpreter = 'LaTeX';
ax.YLabel.String = 'Gating Variable (h)';
ax.XLabel.String = 'Voltage (v)';
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


p = [plot(zeros(size(h)), h); % 1st voltage nullcline
     plot(v, y1); % 2nd voltage nullcline
     plot(v, y2); % 1st gating nullcline
     plot(v, y3); % 2nd gating nullcline
     plot(y4(:,1),y4(:,2)); % sample solution starting at (0.25, 0)
     plot(y4(1,1),y4(1,2),'o')]; % starting point
     

% Set line widths
set(p, 'LineWidth', 2);

% Add a legend
lgd = legend([p(1:5)],...
             'Voltage Nullcline 1: $v=0$', ... 
             'Voltage Nullcline 2: $h=-(8v-\frac{6}{5})(v-1)$',...
             'Gating Nullcline 1: $h=-\frac{v}{100} - \frac{3}{1000}$',...
             'Gating Nullcline 2: $h=-8v(v-\frac{23}{20})$',...
             'Sample solutions starting at rest w/stimulus');
lgd.Box = 'on';
lgd.Interpreter = 'LaTeX';
lgd.TextColor = [29, 29, 29]/255;
lgd.Location = 'best';
lgd.Location = 'EastOutside';
lgd.Units = 'inches';
legend_size = get(lgd, 'position')
% now we fix figure size
fig.PaperPosition = [0, 0, 10+legend_size(3), 0.618*(10+legend_size(3))];
fig.PaperSize = [10+legend_size(3), 0.618*(10+legend_size(3))];
fig.Position = [0.1, 0.1, 10+legend_size(3)-0.1, 0.618*(10+legend_size(3))-0.1];

t = title("Stimulus and Nullclines");
t.Color = [29, 29, 29]/255;
t.Interpreter = 'LaTeX';
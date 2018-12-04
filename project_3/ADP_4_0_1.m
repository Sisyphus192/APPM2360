clear all;

% This file calculates and plots the nullcline for problem 3.1.1 c

% Define constants and our DEs
a = 0.15;
k = 8;
mu_1 = 0.2;
mu_2 = 0.3;
epsilon_0 = 0.002;
v_c = 0.1
ADP_0 = zeros(100,1);
sympref('HeavisideAtOrigin',1);


% 1st voltage nullcline is v=0 and is not a function
voltage_nullcline_2 = @(v,h) k.*(a-v).*(v-1);
gating_nullcline_1 = @(v,h) -epsilon_0.*(v+mu_2)./mu_1;
gating_nullcline_2 = @(v,h) k.*v.*(a-v+1);

% Plot our sample solutions
tspan = linspace(0,1000,5001);
for T = [50 60 70 80 90 100]
    S = @(x) 0.25*(heaviside(mod(x,T)-10) - heaviside(mod(x,T)-14));
    x=zeros(1,2);
    f=@(t,x) [k.*x(1).*(a - x(1)).*(x(1) - 1) - x(2).*x(1) + S(t); ...
              -(epsilon_0 + (x(2)*mu_1)/(mu_2 + x(1)))*(x(2) - k*x(1)*(a - x(1) + 1))];
    [t,y1] = ode45(f,tspan, [0.0 0.0]);
    above_critical = flip(find(y1(:,1) >= v_c));
    below_critical = flip(find(y1(:,1) < v_c));
    if (above_critical(1) > below_critical(1))
        % tspan end mid "beat"
        temp = flip(find(y1(1:below_critical(1),1) >= v_c));
    else
        temp = flip(find(y1(:,1) >= v_c));
    end
    t_down = temp(1);
    temp = flip(find(y1(1:t_down,1) < v_c));
    t_up = temp(1)+1;
    ADP_0(T) = (t_down-t_up);
end


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
ax.YLim = [80, 110];
ax.XLim = [50, 100];
ax.XLabel.Interpreter = 'LaTeX';
ax.YLabel.Interpreter = 'LaTeX';
ax.YLabel.String = 'Voltage and Gating Variable';
ax.XLabel.String = 'time (t)';
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
p = [plot([50 60 70 80 90 100], [ADP_0(50), ADP_0(60), ADP_0(70), ADP_0(80), ADP_0(90), ADP_0(100)])];
     
% Set line widths
set(p, 'LineWidth', 2);

% Add a legend
lgd = legend('$v(t)$', ... 
             '$h(t)$');
lgd.Box = 'on';
lgd.Interpreter = 'LaTeX';
lgd.TextColor = [29, 29, 29]/255;
lgd.Location = 'best';
lgd.Units = 'inches';
legend_size = get(lgd, 'position')

t = title("$v(t)$ and $h(t)$ with Periodic Stimulus");
t.Color = [29, 29, 29]/255;
t.Interpreter = 'LaTeX';
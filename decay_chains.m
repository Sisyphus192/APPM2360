clear vars

x = [0:0.01:35]
y1 = 15000*exp(-0.2*x)
y2 = ((15000*0.2)/(1/15 - 1/5)) * (exp(-0.2*x) - exp(-(1/15)*x))
y3 = -7500*exp(-0.2*x) .* (3 * exp((2/15) * x) - 1) + 15000
plot(x,y1)
hold on
plot(x,y2)
plot(x,y3)
hold off


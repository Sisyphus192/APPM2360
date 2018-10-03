clear vars

x = 0:0.01:99
y1 = 15000*exp(-0.2*x)
y2 = ((15000*0.2)/(1/15 - 1/5)) * (exp(-0.2*x) - exp(-(1/15)*x))
y3 = -7500*exp(-0.2*x) .* (3 * exp((2/15) * x) - 1) + 15000
semilogy(x,y1, 'LineWidth', 2, 'Color', [135/255,86/255,146/255])
ylim([1 15000])
hold on
semilogy(x,y2, 'LineWidth', 2, 'Color', [243/255,132/255,0])
semilogy(x,y3, 'LineWidth', 2, 'Color', [161/255,202/255,241/255])
hold off
legend('N_{A}(t)','N_{B}(t)','N_{C}(t)')
title("Amount of Elements A, B, and C Over Time")
ylabel('# of Atoms')
xlabel('t (seconds)')

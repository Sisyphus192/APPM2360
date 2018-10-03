clear vars

A_0 = 15000
P = 5000
k_A = 1/5
k_B = 1/15


x = 0:0.01:1
y1 = (A_0 - P / k_A) * exp(-k_A*x) + (P / k_A)

y2 = ((A_0 * k_A - P) / (k_B - k_A)) .* exp(-k_A * x) - ((A_0 * k_A * k_B - P * k_A) / (k_B * (k_B - k_A))) .* exp(-k_B * x) + P / k_B

y3 = ((A_0 * k_A * k_B - P * k_A) / (k_B * (k_B - k_A))) .* (exp(-k_B * x) - 1) - ((k_B * (A_0 * k_A - P)) / (k_A * (k_B - k_A))) * (exp(-k_A * x) - 1) + P * x
semilogy(x,y1, 'LineWidth', 2, 'Color', [135/255,86/255,146/255])
ylim([1 inf])
hold on
semilogy(x,y2, 'LineWidth', 2, 'Color', [243/255,132/255,0])
semilogy(x,y3, 'LineWidth', 2, 'Color', [161/255,202/255,241/255])
hold off
legend('N_{A}(t)','N_{B}(t)','N_{C}(t)')
title("Amount of Elements A, B, and C Over Time")
ylabel('# of Atoms')
xlabel('t (seconds)')
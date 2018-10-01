clear vars;
k_A = 1/5
A_0 = 15000;
N_A_prime = @(t, N_A) -k_A*N_A;
h = [1, 0.1, 0.01];

x = 0:0.01:48
y1 = 15000*exp(-0.2*x)

figure
plot(x,y1, 'Color', [135/255,86/255,146/255], 'LineWidth', 2)
hold on

h = 0.01
plot(0:h:48, ode_euler(N_A_prime, 0:h:48, A_0), 'Color', [243/255,132/255,0], 'LineWidth', 2)
x = 0:h:48
y1 = 15000*exp(-0.2*x)
%semilogy(0:h:48, abs(y1 - ode_euler(N_A_prime, 0:h:48, A_0)), 'Color', [0,136/255,86/255], 'LineWidth', 2)

h = 0.1
plot(0:h:48, ode_euler(N_A_prime, 0:h:48, A_0), 'Color', [161/255,202/255,241/255], 'LineWidth', 2)
x = 0:h:48
y1 = 15000*exp(-0.2*x)
%semilogy(0:h:48, abs(y1 - ode_euler(N_A_prime, 0:h:48, A_0)), 'Color', [132/255,132/255,130/255], 'LineWidth', 2)

h = 1
plot(0:h:48, ode_euler(N_A_prime, 0:h:48, A_0), 'Color', [190/255,0,50/255], 'LineWidth', 2)
x = 0:h:48
y1 = 15000*exp(-0.2*x)
%semilogy(0:h:48, abs(y1 - ode_euler(N_A_prime, 0:h:48, A_0)), 'Color', [194/255,178/255,128/255], 'LineWidth', 2)


hold off
legend('h=analytical','h=0.01','h=0.1', 'h=1')
title("Euler Approximations And Their Error")
ylabel('# of Atoms')
xlabel('t (seconds)')
axis tight

x = 45:0.01:48
y1 = 15000*exp(-0.2*x)
figure
semilogy(x,y1, 'Color', [135/255,86/255,146/255], 'LineWidth', 2)
hold on

h = 0.01
semilogy(45:h:48, ode_euler(N_A_prime, 45:h:48, y1(1)), 'Color', [243/255,132/255,0], 'LineWidth', 2)
x = 45:h:48
y1 = 15000*exp(-0.2*x)


h = 0.1
semilogy(45:h:48, ode_euler(N_A_prime, 45:h:48, y1(1)), 'Color', [161/255,202/255,241/255], 'LineWidth', 2)
x = 45:h:48
y1 = 15000*exp(-0.2*x)


h = 1
semilogy(45:h:48, ode_euler(N_A_prime, 45:h:48, y1(1)), 'Color', [190/255,0,50/255], 'LineWidth', 2)
x = 45:h:48
y1 = 15000*exp(-0.2*x)


hold off
legend('h=analytical','h=0.01','h=0.1', 'h=1')
title("Euler Approximations And Their Error")
ylabel('# of Atoms')
xlabel('t')
axis tight

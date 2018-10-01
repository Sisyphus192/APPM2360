clear vars;
k_A = 1/5
A_0 = 15000;
N_A_prime = @(t, N_A) -k_A*N_A;
h = [1, 0.1, 0.01];

x = 0:0.01:48
y1 = 15000*exp(-0.2*x)

figure
semilogy(x,y1, 'Color', [135/255,86/255,146/255])
hold on

h = 0.01
semilogy(0:h:48, ode_euler(N_A_prime, 0:h:48, A_0), 'Color', [243/255,132/255,0])
x = 0:h:48
y1 = 15000*exp(-0.2*x)
semilogy(0:h:48, abs(y1 - ode_euler(N_A_prime, 0:h:48, A_0)), 'Color', [243/255,132/255,0])

h = 0.1
semilogy(0:h:48, ode_euler(N_A_prime, 0:h:48, A_0), 'Color', [161/255,202/255,241/255])
x = 0:h:48
y1 = 15000*exp(-0.2*x)
semilogy(0:h:48, abs(y1 - ode_euler(N_A_prime, 0:h:48, A_0)), 'Color', [161/255,202/255,241/255])

h = 1
semilogy(0:h:48, ode_euler(N_A_prime, 0:h:48, A_0), 'Color', [190/255,0,50/255])
x = 0:h:48
y1 = 15000*exp(-0.2*x)
semilogy(0:h:48, abs(y1 - ode_euler(N_A_prime, 0:h:48, A_0)), 'Color', [190/255,0,50/255])


hold off
legend('h=analytical','h=1','h=1 abs error','h=0.1', 'h=0.1 abs error', 'h=0.01', 'h=0.01 abs error')
title("N_{A}' = -k_{A} * N_{A}(t)")
ylabel('N_{A}')
xlabel('t')
axis tight


% This file is to verify the math and analytical solutions found for
% project 3

clear all;
syms a k mu_1 mu_2 epsilon_0 v h 
assume(a,'positive')
assume(k,'positive')
assume(mu_1,'positive')
assume(mu_2,'positive')
assume(epsilon_0,'positive')

% We are given S(t) = 0
S = 0;

% Our set of differential equations
dvdt = @(v,h) k.*v.*(a - v).*(v - 1) - h.*v + S;
dhdt = @(v,h) -(epsilon_0 + (h.*mu_1)./(mu_2 + v)).*(h - k.*v.*(a - v + 1)); 

% find v_nullclines
v_temp = solve(dvdt(v,h)==0, v);
h_temp = solve(dvdt(v,h)==0, h);
v_nullclines = [v_temp(1), h_temp(1)] % the 2nd v-nullcline in terms of h is much cleaner then in terms of v

% find h_nullclines
h_nullclines = solve(dhdt(v,h)==0, h)

% find equilibrium points
equilibrium_points = solve([dvdt(v,h)==0, dhdt(v,h)==0], [v, h])

% test equilibrium points
simplify(dvdt(equilibrium_points.v(1),equilibrium_points.h(1)))
simplify(dhdt(equilibrium_points.v(1),equilibrium_points.h(1)))

simplify(dvdt(equilibrium_points.v(2),equilibrium_points.h(2)))
simplify(dhdt(equilibrium_points.v(2),equilibrium_points.h(2)))

simplify(dvdt(equilibrium_points.v(3),equilibrium_points.h(3)))
simplify(dhdt(equilibrium_points.v(3),equilibrium_points.h(3)))

simplify(dvdt(equilibrium_points.v(4),equilibrium_points.h(4)))
simplify(dhdt(equilibrium_points.v(4),equilibrium_points.h(4)))

% get partial derivatives for Jacobian
dfdv = simplify(diff(dvdt, v))
dfdh = simplify(diff(dvdt, h))
dgdv = simplify(diff(dhdt, v))
dgdh = simplify(diff(dhdt, h))

% annoyingly cant seem to plug diff() straight into another function, must
% do it manually
Jacobian = @(v,h) [2*k*v - a*k - h - 3*k*v^2 + 2*a*k*v, -v;
                   (h*mu_1*(h - k*v*(a - v + 1)))/(mu_2 + v)^2 - (k*v - k*(a - v + 1))*(epsilon_0 + (h*mu_1)/(mu_2 + v)),...
                   - epsilon_0 - (mu_1*(h - k*v*(a - v + 1)))/(mu_2 + v) - (h*mu_1)/(mu_2 + v)]

% determine stability of non-negative equilibrium point
eigen_values = eig(Jacobian(0,0))

    
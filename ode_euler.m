
% This function is an implementation of the euler method to find numerical
% solutions to differential equations. This is the function used to find
% approximations for problems 2.2.3 and 3.1.7 in Project 1 for APPM 2360
% Fall 2018

function y = ode_euler(yprime, ts, y_0)
    y = zeros(size(ts));
    y(1) = y_0;
    for n = 2:numel(ts)
        y(n) = y(n-1) + (ts(n)-ts(n-1))*yprime(ts(n-1), y(n-1));
    end
end

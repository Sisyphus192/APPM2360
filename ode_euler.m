function y = ode_euler(yprime, ts, y_0)
    y = zeros(size(ts));
    y(1) = y_0;
    for n = 2:numel(ts)
        y(n) = y(n-1) + (ts(n)-ts(n-1))*yprime(ts(n-1), y(n-1));
    end
end

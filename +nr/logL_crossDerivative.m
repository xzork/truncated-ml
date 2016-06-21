function [result] = logL_crossDerivative(data, a, t)
    [~, ~, temp] = nr.lastTerm(data, a, t, 'dat');

    result = -1 - temp;
end
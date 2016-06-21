function [result] = logL_primeTheta(data, a, t)
    [a1, a2, temp1, temp2] = nr.lastTerm(data, a, t, 'dt');

    result = sum([data(1).y2 - t - a1 - temp1;
                  data(2).y2 - t - a2 - temp2]);
end
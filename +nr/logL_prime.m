function [result] = logL_prime(data, a, t)
    [a1, a2, temp1, temp2] = nr.lastTerm(data, a, t, 'da');
    
    result = [data(1).y1 + data(1).y2 - t - 2*a1 - temp1;
              data(2).y2 - a2 - t - temp2];
end
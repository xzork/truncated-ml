function [result] = logL_doublePrime(data, a, t)
    [~, ~, temp1, temp2] = nr.lastTerm(data, a, t, 'da2');

    result = [-2 - temp1; 
              -1 - temp2];
end
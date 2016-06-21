function [a, t, success] =  newtonRaphson(data, maxIter)
    m = data(1).m + data(2).m;
    
    a0 = zeros(m, 1);
    t0 = 0;

    tolerance = 10^-4;
    success = false;
    
    for iter = 1:maxIter
        [dA, dT] = nr.deltaAT(data, a0, t0);

        a = a0 - dA;
        t = t0 - dT;

        normd = norm([dA;dT]) / sqrt(m+1);
      fprintf('Iter %d, %.4f\n', [iter normd])
        
        if normd <= tolerance
            success = true;
            break
        elseif isnan(normd)
            break
        end
        
        a0 = a;
        t0 = t;
    end

    if success == false
        disp('No convergence.')
    else
        disp('Success!')
    end
end
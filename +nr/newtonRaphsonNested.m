function [a] = newtonRaphsonNested(data, theta, maxIter)
    import nr.*
    m = data(1).m + data(2).m;
    
    a0 = zeros(m, 1);
    
    tolerance = 10^-4;
    
    for iter = 1:maxIter
        g = logL_prime(data, a0, theta);
        Hinv = 1./logL_doublePrime(data, a0, theta); 
        a = a0 - Hinv.*g;
        normd = norm(Hinv.*g)/sqrt(m);
        
        if normd <= tolerance
            break
        end
        
        a0 = a;
    end
end

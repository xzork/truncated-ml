function [dA, dT] = deltaAT(data, a, t)
    % Returns H^-1 * g. First partitions the Hessian matrix as: [[a u];[v d]] and then performs block inversion
    % and multiplies it with the vector g without storing H^-1 to save memory.
    import nr.*

    g1 = logL_prime(data, a, t);
    g2 = logL_primeTheta(data, a, t);
    
    ainv = 1./logL_doublePrime(data, a, t); % A^-1 takes a lot of memory, so we store its inverse as a vector.
    u = logL_crossDerivative(data, a, t);
    
    br = 1/sum(u.*(1 - u.*ainv));
    temp = u'*(g1.*ainv);
    
    dA = (g1 + u*br*(temp - g2)).*ainv; % (tl + tr)*g
    dT = br*(-temp+g2); % (bl + br)*g
end
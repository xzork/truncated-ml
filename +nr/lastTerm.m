function [a1, a2, temp1, temp2] = lastTerm(data, a, t, derivand)
    pd = makedist('Normal');
    phi = @(x) cdf(pd,x);
    dPhi = @(x) pdf(pd, x);
    ddPhi = @(x) -x .* dPhi(x);
    aprox1 = @(x) -x ./ (1 - 1./x.^2 +3./x.^4 - 15./x.^6 + 105./x.^8 - 945./x.^10); % dPhi/phi
    aprox2 = @(x) -x.*aprox1(x) - aprox1(x).^2; % ddPhi/phi - (dPhi/phi)^2

    a1 = a(1:data(1).m); % estimates for untruncated.
    a2 = a(data(1).m+1:end); % estimates for truncated-untruncated.

    sum_a1t = a1 + t;
    sum_a2t = a2 + t;
    
    switch derivand
        case 'da'
            temp11 = dPhi(a1)./phi(a1);
            temp11(a1 < -37) = aprox1(a1(a1 < -37));
            temp12 = dPhi(sum_a1t)./phi(sum_a1t);
            temp12(sum_a1t < -37) = aprox1(sum_a1t(sum_a1t < -37));
            
            temp1 = temp11 + temp12;

            temp2 = dPhi(sum_a2t)./phi(sum_a2t);
            temp2(sum_a2t < -37) = aprox1(sum_a2t(sum_a2t < -37));
        
        case 'da2'
            temp11 = ddPhi(a1)./phi(a1) - (dPhi(a1)./phi(a1)).^2;
            temp11(a1 < -37) = aprox2(a1(a1 < -37));
 
            temp12 = ddPhi(sum_a1t)./phi(sum_a1t) - (dPhi(sum_a1t)./phi(sum_a1t)).^2;
            temp12(sum_a1t < -37) = aprox2(sum_a1t(sum_a1t < -37));

            temp1 = temp11 + temp12;
            
            temp2 = ddPhi(sum_a2t)./phi(sum_a2t) - (dPhi(sum_a2t)./phi(sum_a2t)).^2;
            temp2(sum_a2t < -37) = aprox2(sum_a2t(sum_a2t < -37));
        
        case 'dt'
            temp1 = dPhi(sum_a1t)./phi(sum_a1t);
            temp1(sum_a1t < -37) = aprox1(sum_a1t(sum_a1t < -37));

            temp2 = dPhi(sum_a2t)./phi(sum_a2t);
            temp2(sum_a2t < -37) = aprox1(sum_a2t(sum_a2t < -37));
        
        case {'dt2', 'dat'}
            sum_at = a + t;
            temp1 = ddPhi(sum_at)./phi(sum_at) - (dPhi(sum_at)./phi(sum_at)).^2;
            temp1(sum_at < -37) = aprox2(sum_at(sum_at < -37));
    end    
end
function [l] = getProfileL(data, aHat, tHat)
    pd = makedist('Normal');
    phi = @(x) cdf(pd,x);    

    l = zeros(data(1).m+data(2).m, 1);
    aHat1 = aHat(1:data(1).m);
    aHat2 = aHat(data(1).m+1:end);
    
    l(1:data(1).m) = -log(2*pi) -0.5*(data(1).y1 - aHat1).^2 - log(phi(aHat1))...
                     -0.5*(data(1).y2 - tHat- aHat1).^2 - log(phi(aHat1+tHat));
    
    l(data(1).m+1:end) = -0.5*log(2*pi) -0.5*(data(2).y2 - tHat- aHat2).^2 - log(phi(aHat2+tHat));
end
function [data] = generateY(alphaMu, alphaSigma, theta, n)
    m = 0;    
    y = nan(n, 2);
    
    while(m < n)
        alpha = alphaMu + alphaSigma*randn(n, 1);
        yTemp = [alpha+randn(n, 1) theta+alpha+randn(n, 1)];
        yTemp = yTemp(yTemp(:,2)>0, 1:2);
        if (m + length(yTemp) > n)
            yTemp = yTemp(1:n-m, 1:2);
        end
        y(m+1:m+length(yTemp(:,1)), 1:2) = yTemp;
        m = sum(~isnan(y(:,1)));
    end
        
    % y observed in both periods.
    data(1).y1 = y(y(:,1)>0 & y(:,2)>0, 1);
    data(1).y2 = y(y(:,1)>0 & y(:,2)>0, 2);

    % y observed only in the second period.
    data(2).y1 = y(y(:,1)<0 & y(:,2)>0, 1);
    data(2).y2 = y(y(:,1)<0 & y(:,2)>0, 2);
    
    data(1).m = length(data(1).y1);
    data(2).m = length(data(2).y1);
end
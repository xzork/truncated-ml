format compact
format long g
%% Set the parameters. 
alphaMu = -3; 
alphaSigma = 5;
theta = 11;
n = 1000000;
maxIter = 30;
%% Generate Y.
% data = nr.generateY(alphaMu, alphaSigma, theta, n);
ntr = data(2).m / (data(1).m + data(2).m) % Percentage of truncated cases.
%% Run the estimation.
[aHat, tHat] = nr.newtonRaphson(data, maxIter);
%% Nested estimation
% thetaList = 5.5:0.5:25;
% tHatList = zeros(length(thetaList), 1);
% s = zeros(length(thetaList), 1);
% for e = 1:length(thetaList)
%     data = generateY(alphaMu, alphaSigma, thetaList(e), n);
%     [~, tHat, su] = newtonRaphson(data, maxIter);
%     s(e) = su;
%     tHatList(e) = tHat;
% end
% bias = tHatList - thetaList;st] = newtonRaphsonNested(data, theta, maxIter);
% l = getProfileL(data, aHat, tHat);
%% Bias for different parameters
% thetaList = 4:0.5:50;
% tHatList = zeros(length(thetaList), 1);
% ntrList = zeros(length(thetaList), 1);
% for e = 1:length(thetaList)
%     data = nr.generateY(alphaMu, alphaSigma, thetaList(e), n);
%     ntrList(e) = data(2).m / (data(1).m + data(2).m);
%     disp(thetaList(e))
%     [~, tHat, success] = nr.newtonRaphson(data, maxIter);
%     
%     if success == true
%         tHatList(e) = tHat;
%     else
%         tHatList(e) = NaN;
%     end
% end
% bias = tHatList - thetaList';

% plot(thetaList, bias)
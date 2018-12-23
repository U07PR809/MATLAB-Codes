clear; clc;
% norm_y=((y-min(y)) / (max(y)-min(y)));
% re_PPG=interpol3(x,norm_y,x(end));
n=1:100:1000;

% plot(re_PPG,'color',[0.1 0.1 0.1],'LineWidth',1);
% title(['segment ',num2str(cnt)])
% xlabel('Number of samples')
% ylabel('Norm a.u.')
% axis tight

% p= segGaussFit(n, re_PPG, 2, 1);

dn=length(n);
mu1Vec = zeros(dn - 1, 1);
mu2Vec = zeros(dn - 1, 1);
for step = 1:(dn-1)
    for initmu = 1:dn+1
        mu1 = initmu;
        mu1Vec(initmu) = mu1; 
%         fprintf('mu1 = %d\n', mu1);
        mu2 = mu1 + step;
        mu2Vec(initmu) = mu1;
%         fprintf('mu1 = %d\n', mu2);
        
        if (mu1 + step >= dn) || (mu2 >= dn)
            break;
        end
        mu = [mu1 mu2];
    end
end
% gaumd1 = (p(1).* exp(-(((n-mu(1)).^2)/(2*p(2)^2))))+ ...
%     (p(3).* exp(-(((n-mu(2)).^2)/(2*p(4)^2))));
% 
% hold on;
% plot(gaumd1);
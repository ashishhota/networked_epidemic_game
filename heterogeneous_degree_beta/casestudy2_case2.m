function output = casestudy2_case2(c)     
    DD = 1:1:4;
    md = [0.9-c,0.05,0.05,c];       
    md = md/sum(md);
    davg = DD*md';
    betau = 0.8;
    betap = [0.6,0.6,0.1,0.1]; % Case 2
    gamma = 0.2;
    cp = 15;
    L = 15;
    alpha = 0.5;
    h = 0.01;
    n = 4;

    % Simulated Trajectory till Convergence
    T = 20000;
    Y = zeros(n+1,T);
    ZDS = zeros(n,T);
    ZDI = zeros(n,T);
    Theta = zeros(n+1,T);
    Y(:,1) = 0.1*ones(n+1,1);
    ZDS(:,1) = 0.5*ones(n,1);
    
    for t=1:T-1
        for i=1:n
            Theta(1,t) = Theta(1,t)+i*md(i)*(betap(i)*(1-ZDI(i,t))+betau*ZDI(i,t))*Y(i,t)/(davg);
            Theta(i+1,t) =  cp/(L*(1-alpha)*(i));
        end
        for i=1:n        
            Y(i,t+1) = Y(i,t) + h*(-gamma*Y(i,t)+(1-Y(i,t))*(ZDS(i,t)+(1-ZDS(i,t))*alpha)*i*Theta(1,t));
            ZDS(i,t+1) = ZDS(i,t) + h*(ZDS(i,t)*(1-ZDS(i,t))*(cp-L*(1-alpha)*i*Theta(1,t)));
            ZDI(i,t+1) = ZDI(i,t) + h*(ZDI(i,t)*(1-ZDI(i,t))*(-2));
        end
        Y(n+1,t+1) = md*Y(1:n,t+1);
    end
    %
    output = Y(:,end);
    output = [output;Theta(1,end-1)];
    output = [output;max([abs(Y(:,end)-Y(:,end-1));abs(ZDS(:,end)-ZDS(:,end-1))])];
    return
end
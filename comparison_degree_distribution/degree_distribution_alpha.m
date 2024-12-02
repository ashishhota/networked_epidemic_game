function output = degree_distribution_alpha(alpha_val,key)
     
    DD = 1:1:20;
    md = zeros(1,20);

    if key==1                       % Bimodal
        md(1) = 0.25;
        md(2) = 0.25;
        md(19) = 0.25;
        md(20) =0.25;
    elseif key==2
        md = binopdf(DD,20,0.525);   % Binomial
    else
        md = 0.05*ones(1,20);       % uniform distribution
    end

    md = md/sum(md);
    davg = DD*md'
    betau = 0.9;
    betap = 0.1*ones(20,1);
    gamma = 0.4;
    cp = 4;
    L = 10;
    
    alpha = alpha_val;
    
    h = 0.01;
    n = 20;

    ciu = 10;
    cip = 8;
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
            ZDI(i,t+1) = ZDI(i,t) + h*(ZDI(i,t)*(1-ZDI(i,t))*(-2));  %cip-ciu = -2
        end
        Y(n+1,t+1) = md*Y(1:n,t+1);
    end
    %
    output = Y(:,end);
    output = [output;Theta(1,end-1)];
    output = [output;max([abs(Y(:,end)-Y(:,end-1));abs(ZDS(:,end)-ZDS(:,end-1))])];
    return
end
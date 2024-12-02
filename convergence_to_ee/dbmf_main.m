% This function generates the simulations reported in Section 4.1 for
% cp=10; In order to obtain the results for cp=8, change the parameter to
% cp=8. To generate the plots, run "create_plots_cs0.m" script. 

%% Specify Problem Parameters

DD = [1,2,3,4];
md = 0.25*[1,1,1,1];
davg = DD*md';

alpha = 0.5;
betap = 0.6;
betau = 0.7;
gamma = 0.3;
L = 20;

cp = 10;

ciu = 10;
cip = 8;

h = 0.01;   % Euler discretization parameter
n = 4;         % number of degrees
%% Simulated Trajectory till Convergence
T = 10000;
Y = zeros(n+1,T);
ZDS = zeros(n,T);
ZDI = zeros(n,T);
Theta = zeros(n+1,T);
Y(:,1) = 10*[0.01;0.01;0.01;0.01;0.01];
ZDS(:,1) = 50*[0.01;0.01;0.01;0.01];

for t=1:T-1
    for i=1:n
        Theta(1,t) = Theta(1,t)+i*md(i)*(betap*(1-ZDI(i,t))+betau*ZDI(i,t))*Y(i,t)/(davg);
        Theta(i+1,t) =  cp/(L*(1-alpha)*(i));
    end
    for i=1:n        
        Y(i,t+1) = Y(i,t) + h*(-gamma*Y(i,t)+(1-Y(i,t))*(ZDS(i,t)+(1-ZDS(i,t))*alpha)*i*Theta(1,t));
        ZDS(i,t+1) = ZDS(i,t) + h*(ZDS(i,t)*(1-ZDS(i,t))*(cp-L*(1-alpha)*i*Theta(1,t)));
        ZDI(i,t+1) = ZDI(i,t) + h*(ZDI(i,t)*(1-ZDI(i,t))*(-2));  %cip-ciu = -2
    end
    Y(n+1,t+1) = md*Y(1:n,t+1);
end

%% Theoretical Calculation of Endemic Equilibrium
Theta_dstar = zeros(n,1);
for i=1:n+1
    % find R(dstar)
    R_temp = 0;
    for d=1:n
        if d<=i-1
            R_temp = R_temp + d^2*md(d)*betap/(davg*gamma);
        else
             R_temp = R_temp + alpha*d^2*md(d)*betap/(davg*gamma);
        end
    end
    %R_temp
    if R_temp>=1               %solve for Theta satisfying (17) using bisection method
        temp_up = 1;
        temp_down = 0;
        temp_mid = 0.5;
        sum1 = 0;
        for d=1:n
            if d<= (i-1)
                sum1 = sum1 + (d^2*md(d)*betap)/(davg*(gamma+d*temp_mid));
            else
                sum1 = sum1 + (d^2*md(d)*betap*alpha)/(davg*(gamma+alpha*d*temp_mid));
            end
        end
        while abs(1 - sum1) > 0.0001
            if sum1 < 1
                temp_up = temp_mid;
                temp_mid = (temp_up+temp_down)/2;
            else
                temp_down = temp_mid;
                temp_mid = (temp_up+temp_down)/2;
            end
            sum1 = 0;
            for d=1:n
                if d<= (i-1)
                    sum1 = sum1 + (d^2*md(d)*betap)/(davg*(gamma+d*temp_mid));
                else
                    sum1 = sum1 + (d^2*md(d)*betap*alpha)/(davg*(gamma+alpha*d*temp_mid));
                end
            end
        end
        Theta_dstar(i)=temp_mid;
    else
        Theta_dstar(i)=0;
    end
end
%% Compare the theoretical endemic eq. with the simulated endemic eq. 
% The difference in the Theta values is negligible.

%Theta_dstar'
%Theta(:,end-1)'
deq = DD(end);
while Theta_dstar(deq)>Theta(deq+1,end-1)
    deq = deq-1;
end
if Theta_dstar(deq+1) > Theta(deq+1,end-1)
    Theta_theory = Theta(deq+1,end-1);          % case 2(b) of Theorem 1
else
    Theta_theory = Theta_dstar(deq+1);           % case 2(a) of Theorem 1
end
error = abs(Theta_theory-Theta(1,end-1));

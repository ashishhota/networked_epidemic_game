% Degree Distribution Comparison, Sweep Alpha and Generate Plot

alpha = 0.1:0.05:0.9;
Data = zeros(23,length(alpha));
for j=1:length(alpha)
    Data_bimodal(:,j) = degree_distribution_alpha(alpha(j),1);
    Data_binomial(:,j) = degree_distribution_alpha(alpha(j),2);
    Data_uniform(:,j) = degree_distribution_alpha(alpha(j),3);
end
plot(alpha,[Data(21,:);Data(22,:)])

%% Plot of Theta(y)
plot(alpha,[Data_bimodal(22,:);Data_binomial(22,:);Data_uniform(22,:)]);
plt = Plot(); % create a Plot object and grab the current figure
plt.XLabel = '\alpha'; % xlabel
%plt.YLabel = 'Infected Proportion'; %ylabel
plt.YLabel = '\Theta(y)'; %ylabel
plt.Title = 'c_p = 4, \beta_p=0.1'; % plot title
plt.Colors = {                 % three colors for three data set
    [1,      0,       0]        % data set 1
    [0,      0,       1]        % data set 2
    [0,      0,       0]        % data set 3
    };
plt.LineWidth = 2;        % line width
plt.LineStyle = {':','-','--'};   % line style: '-', ':', '--' etc
plt.YGrid = 'on';       % 'on' or 'off'
plt.YLim = [0,0.1];
plt.XLim = [0.1,0.9];
plt.XGrid = 'on';       % 'on' or 'off'
plt.Legend = {'Bimodal','Binomial', 'Uniform'}; % legends
plt.BoxDim = [3, 2]; %[width, height] in inches
plt.LegendLoc =  'NorthWest'; %'SouthWest': legend location
plt.LegendBox = 'on';

%% Plot of y^avg
plot(alpha,[Data_bimodal(21,:);Data_binomial(21,:);Data_uniform(21,:)]);
plt = Plot(); % create a Plot object and grab the current figure
plt.XLabel = '\alpha'; % xlabel
%plt.YLabel = 'Infected Proportion'; %ylabel
plt.YLabel = 'Infected Proportion'; %ylabel
plt.Title = 'c_p = 4, \beta_p=0.1'; % plot title
plt.Colors = {                 % three colors for three data set
    [1,      0,       0]        % data set 1
    [0,      0,       1]        % data set 2
    [0,      0,       0]        % data set 3
    };
plt.LineWidth = 2;        % line width
plt.LineStyle = {':','-','--'};   % line style: '-', ':', '--' etc
plt.YGrid = 'on';       % 'on' or 'off'
plt.YLim = [0,1];
plt.XLim = [0.1,0.9];
plt.XGrid = 'on';       % 'on' or 'off'
plt.Legend = {'Bimodal','Binomial', 'Uniform'}; % legends
plt.BoxDim = [3, 2]; %[width, height] in inches
plt.LegendLoc =  'NorthWest'; %'SouthWest': legend location
plt.LegendBox = 'on';
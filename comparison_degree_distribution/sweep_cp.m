% Degree Distribution Comparison, Sweep cp and Generate Plot

cp = 1:0.5:10;
Data = zeros(23,length(cp));
for j=1:length(cp)
    Data_bimodal(:,j) = degree_distribution_cp(cp(j),1);
    Data_binomial(:,j) = degree_distribution_cp(cp(j),2);
    Data_uniform(:,j) = degree_distribution_cp(cp(j),3);
end
%plot(alpha,[Data(21,:);Data(22,:)])

%% Plot of Theta(y)
plot(cp,[Data_bimodal(22,:);Data_binomial(22,:);Data_uniform(22,:)]);
plt = Plot(); % create a Plot object and grab the current figure
plt.XLabel = 'c_p'; % xlabel
%plt.YLabel = 'Infected Proportion'; %ylabel
plt.YLabel = '\Theta(y)'; %ylabel
plt.Title = '\alpha = 0.25, \beta_p=0.1'; % plot title
plt.Colors = {                 % three colors for three data set
    [1,      0,       0]        % data set 1
    [0,      0,       1]        % data set 2
    [0,      0,       0]        % data set 3
    };
plt.LineWidth = 2;        % line width
plt.LineStyle = {':','-','--'};   % line style: '-', ':', '--' etc
plt.YGrid = 'on';       % 'on' or 'off'
plt.YLim = [0,0.1];
plt.XLim = [1,10];
plt.XGrid = 'on';       % 'on' or 'off'
plt.Legend = {'Bimodal','Binomial', 'Uniform'}; % legends
plt.BoxDim = [3, 2]; %[width, height] in inches
plt.LegendLoc =  'SouthEast'; %'SouthWest': legend location
plt.LegendBox = 'on';

%% Plot of y^avg
plot(cp,[Data_bimodal(21,:);Data_binomial(21,:);Data_uniform(21,:)]);
plt = Plot(); % create a Plot object and grab the current figure
plt.XLabel = 'c_p'; % xlabel
%plt.YLabel = 'Infected Proportion'; %ylabel
plt.YLabel = 'Infected Proportion'; %ylabel
plt.Title = '\alpha = 0.25, \beta_p=0.1'; % plot title
plt.Colors = {                 % three colors for three data set
    [1,      0,       0]        % data set 1
    [0,      0,       1]        % data set 2
    [0,      0,       0]        % data set 3
    };
plt.LineWidth = 2;        % line width
plt.LineStyle = {':','-','--'};   % line style: '-', ':', '--' etc
plt.YGrid = 'on';       % 'on' or 'off'
plt.YLim = [0,1];
plt.XLim = [1,10];
plt.XGrid = 'on';       % 'on' or 'off'
plt.Legend = {'Bimodal','Binomial', 'Uniform'}; % legends
plt.BoxDim = [3, 2]; %[width, height] in inches
plt.LegendLoc =  'NorthWest'; %'SouthWest': legend location
plt.LegendBox = 'on';
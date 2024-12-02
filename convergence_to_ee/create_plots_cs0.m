time = 1:1:10000;
plot(time,Y');
plt = Plot(); % create a Plot object and grab the current figure
plt.XLabel = 'Time'; % xlabel
plt.YLabel = 'Infected Proportion'; %ylabel
plt.Title = 'c_p = 10'; % plot title
plt.Colors = {                 % three colors for three data set
    [1,      0,       0]        % data set 1
    [0.5,   0,    0.5]     % data set 2
    [0,      1,       0]        % data set 3
    [0,      0,       1]        % data set 3
    [0.01,   0.01,    0.01]        % data set 3
    };
plt.LineWidth = 2;        % line width
plt.LineStyle = {'--',':','-','--','-'};   % line style: '-', ':', '--' etc
plt.YGrid = 'on';       % 'on' or 'off'
plt.YLim = [0,1];
plt.XGrid = 'on';       % 'on' or 'off'
plt.Legend = {'d = 1', 'd = 2', 'd=3', 'd=4', 'avg.'}; % legends
plt.BoxDim = [3, 2]; %[width, height] in inches
plt.LegendLoc =  'SouthEast'; %'SouthWest': legend location
plt.LegendBox = 'on';
%% Thresholds 
time=1:1:9999;
plot(time,Theta(:,1:end-1)')
plt = Plot(); % create a Plot object and grab the current figure
plt.XLabel = 'Time'; % xlabel
plt.YLabel = '\Theta(x) and Thresholds'; %ylabel
plt.Title = 'c_p = 10'; % plot title
plt.Colors = {                 % three colors for three data set
    [0.01,   0.01,    0.01]        % data set 1
    [1,      0,       0]        % data set 1
    [0.5,   0,    0.5]     % data set 2
    [0,      1,       0]        % data set 3
    [0,      0,       1]        % data set 3
    };
plt.LineWidth = 2;        % line width
plt.LineStyle = {'-',':','--','--','-'};   % line style: '-', ':', '--' etc
plt.YGrid = 'on';       % 'on' or 'off'
plt.YLim = [0,1];
plt.XGrid = 'on';       % 'on' or 'off'
plt.Legend = {'\Theta(x)', 'd=1', 'd=2', 'd=3', 'd=4'}; % legends
plt.BoxDim = [3, 2]; %[width, height] in inches
plt.LegendLoc =  'NorthEast'; %'SouthWest': legend location
plt.LegendBox = 'on';
%% Proportion without protection
time = 1:1:10000;
plot(time,ZDS');
plt = Plot(); % create a Plot object and grab the current figure
plt.XLabel = 'Time'; % xlabel
plt.YLabel = 'Unprotected Proportion'; %ylabel
plt.Title = 'c_p = 10'; % plot title
plt.Colors = {                 % three colors for three data set
    [1,      0,       0]        % data set 1
    [0.5,   0,    0.5]     % data set 2
    [0,      1,       0]        % data set 3
    [0,      0,       1]        % data set 3
    %[0.01,   0.01,    0.01]        % data set 3
    };
plt.LineWidth = 2;        % line width
plt.LineStyle = {'--',':','-','--'};   % line style: '-', ':', '--' etc
plt.YGrid = 'on';       % 'on' or 'off'
plt.YLim = [0,1];
plt.XGrid = 'on';       % 'on' or 'off'
plt.Legend = {'d=1', 'd=2', 'd=3', 'd=4'}; % legends
plt.BoxDim = [3, 2]; %[width, height] in inches
plt.LegendLoc =  'East'; %'SouthWest': legend location
plt.LegendBox = 'on';
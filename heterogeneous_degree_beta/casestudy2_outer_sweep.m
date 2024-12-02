% Script to sweep the parameter m_d for the case study in Section 4.2

m4 = 0:0.05:0.9;
Data1 = zeros(7,length(m4));
Data2 = zeros(7,length(m4));
for j=1:length(md)
    Data1(:,j) = casestudy2_case1(m4(j));
    Data2(:,j) = casestudy2_case2(m4(j));
end
%plot(md,[Data1(5,:);Data2(5,:)])

%% Generate Fig. 2 of the paper

plot(m4,[Data1(5,:);Data2(5,:)]);
plt = Plot(); % create a Plot object and grab the current figure
plt.XLabel = 'm_4'; % xlabel
plt.YLabel = 'Infected Proportion (y^{avg})'; %ylabel 
%plt.Title = ', '; % plot title
plt.Colors = {                 % three colors for three data set
    [1,      0,       0]        % data set 1
    [0,      0,       1]        % data set 3
    };
plt.LineWidth = 2;        % line width
plt.LineStyle = {':','-'};   % line style: '-', ':', '--' etc
plt.YGrid = 'on';       % 'on' or 'off'
plt.YLim = [0,1];
plt.XLim = [0.05,0.85];
plt.XGrid = 'on';       % 'on' or 'off'
plt.Legend = {'Case 1', 'Case 2'}; % legends
plt.BoxDim = [3, 2]; %[width, height] in inches
plt.LegendLoc =  'SouthEast'; %'SouthWest': legend location
plt.LegendBox = 'on';
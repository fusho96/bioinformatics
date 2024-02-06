% 3-axis plot

% to show the tick lablel on each axis, make sure the 'TickLabel'
% propertity is not empty
ha(1) = axes('YColor','#0072BD','YMinorTick','off','XMinorTick','off','XTickMode','auto','YTickMode','auto','FontSizeMode','auto','InnerPosition',[0.1300 0.1500 0.74 0.8150]);
% plot the solid line (remaining hydrogen) and dash line (ideal hydrogen)
h(1) = line(d21_Hc(:,1),d21_Hc(:,2),'marker','x','Color','#0072BD');
h(4) = line(d21_Hp(:,1),d21_Hp(:,2),'Color','#0072BD','LineStyle','--');
% x-axis lable, if it is not needed, block this line
xlabel('\itt\rm/h')
% the range of time and hydrogen
xlim([0,700])
ylim([0,25])
% y1-axis lable, if it is not needed, block this line
ylabel('H2/mmol')
hold on 
% form the right y2-axis
xlim1 = get(ha(1),'xlim');
pos1 = get(ha(1),'position');
% to show the tick lablel on each axis, make sure the 'TickLabel'
% propertity is not empty
ha(2) = axes('Position',pos1,'Color','none','YTickLabel','','YAxisLocation','right','XLim',xlim1,'XTick',[],'YColor','#D95319','YTickMode','auto','FontSizeMode','auto');
% plot the carbon dioxide
h(2) = line(d21_Cc(:,1),d21_Cc(:,2),'Parent',ha(2),'marker','x','Color','#D95319');
box off
% the range of carbon dioxide
ylim([0,0.7])
% y2-axis lable, if it is not needed, block this line
% ylabel('CO2/mmol')
% form the right y3-axis
pos1(1) = pos1(1) - 0.02;
pos1(3) = pos1(3) *0.86;
set([ha(1);ha(2)],'position',pos1);
pos3 = pos1;
pos3(3) = pos3(3) +0.15;
xlim3 = xlim1;
xlim3(2) = xlim3(1) + (xlim1(2)-xlim1(1))/ pos1(3)* pos3(3);
% to show the tick lablel on each axis, make sure the 'TickLabel'
% propertity is not empty
ha(3) = axes('Position',pos3,'Color','none','YTickLabel','','YAxisLocation','right','XLim',xlim3,'XTick',[],'YColor','#77AC30','YTickMode','auto','FontSizeMode','auto');
% plot the OD600
h(3) = line(d21_Od(:,1),d21_Od(:,2),'Parent',ha(3),'marker','x','Color','#77AC30');
box off
% y3-axis lable, if it is not needed, block this line
% ylabel('OD600')
% the range of OD600
ylim([0,0.5])
% Read in file  
T = readtable('output.txt','Delimiter', ',', 'Format', '%.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f');

figure; hold('on')

x = 1:1:2;

% Get the mean RTs and round, and multiply by 100 to turn into percentage.
Acc_0back = [T.Acc00 T.Acc01];
y0 = mean(Acc_0back)*100; 
err = RepMeasErr(Acc_0back)*100;
p1 = errorbar(x, y0, err, '-s', 'MarkerSize',12, 'MarkerEdgeColor',[0,.5,.8], 'MarkerFaceColor',[0,.5,.8]);
set(p1,'Color',[0,.5,.8],'LineWidth', 2);

Acc_1back = [T.Acc10 T.Acc11];
y1 = mean(Acc_1back)*100; 
err = RepMeasErr(Acc_1back)*100;
p2 = errorbar(x, y1, err, '-s', 'MarkerSize',12, 'MarkerEdgeColor',[.5,0,.5], 'MarkerFaceColor',[.5,0,.5]);
set(p2,'Color',[.5,0,.5],'LineWidth', 2);

Acc_2back = [T.Acc20 T.Acc21];
y2 = mean(Acc_2back)*100; 
err = RepMeasErr(Acc_2back)*100;
p3 = errorbar(x, y2, err, '-s', 'MarkerSize',12, 'MarkerEdgeColor',[.5,0,.5], 'MarkerFaceColor',[.5,0,.5]);
set(p3,'Color',[.5,0,.5],'LineWidth', 2);



legend('0-back','1-back','2-back')
set(gca, 'xtick', 1:2,...
    'xticklabels',{'Intact','50% degraded'})
xlabel('Degradation')
ylabel('Accuracy (% correct)')

return

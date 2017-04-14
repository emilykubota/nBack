% Read in file  
T = readtable('output.txt','Delimiter', ',', 'Format', '%.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f');

figure; hold('on')

x = 1:1:2;

% Get the mean RTs and round, and multiply by 100 to turn into percentage.
y0 = [round(mean(T.Acc00*100),3) round(mean(T.Acc01*100),3)]; 
err = [(std(T.Acc00*100)/sqrt(24)) (std(T.Acc01*100)/sqrt(24))];
p1 = errorbar(x, y0, err, 's', 'MarkerSize',12, 'MarkerEdgeColor',[0,.5,.8], 'MarkerFaceColor',[0,.5,.8]);
set(p1,'Color',[0,.5,.8],'LineWidth', 2);

y1 = [round(mean(T.Acc10*100),3) round(mean(T.Acc11*100),3)]; 
err = [(std(T.Acc10*100)/sqrt(24)) (std(T.Acc11*100)/sqrt(24))];
p2 = errorbar(x, y1, err, 's', 'MarkerSize',12, 'MarkerEdgeColor',[.5,0,.5], 'MarkerFaceColor',[.5,0,.5]);
set(p2,'Color',[.5,0,.5],'LineWidth', 2);

y2 = [round(mean(T.Acc20*100),3) round(mean(T.Acc21*100),3)]; 
err = [(std(T.Acc10*100)/sqrt(24)) (std(T.Acc11*100)/sqrt(24))];
p3 = errorbar(x, y2, err, 's', 'MarkerSize',12, 'MarkerEdgeColor',[.5,0,.5], 'MarkerFaceColor',[.5,0,.5]);
set(p3,'Color',[.5,0,.5],'LineWidth', 2);



legend('0-back','1-back','2-back')
set(gca, 'xtick', 1:2,...
    'xticklabels',{'Intact','50% degraded'})
xlabel('Task')
ylabel('Accuracy (% correct)')

return

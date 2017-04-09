% Read in file  
T = readtable('composite.txt','Delimiter', ',', 'Format', '%.3f %.3f %.3f %.3f %.3f %.3f');

figure; hold('on')

x = 1:1:3;

% Get the mean RTs and round, then multiply by 1000 to turn into ms.
y0 = [round(mean(T.com00*10),3) round(mean(T.com10*10),3) round(mean(T.com20*10),3)]; 
err = [(std(T.com00*10)/sqrt(24)) (std(T.com10*10)/sqrt(24)) (std(T.com20*10)/sqrt(24))];
p1 = errorbar(x, y0, err, 's', 'MarkerSize',12, 'MarkerEdgeColor',[0,.5,.8], 'MarkerFaceColor',[0,.5,.8]);
set(p1,'Color',[0,.5,.8],'LineWidth', 2);

y1 = [round(mean(T.com01*10),3) round(mean(T.com11*10),3) round(mean(T.com21*10),3)]; 
err = [(std(T.com01*10)/sqrt(24)) (std(T.com11*10)/sqrt(24)) (std(T.com21*10)/sqrt(24))];
p2 = errorbar(x, y1, err, 's', 'MarkerSize',12, 'MarkerEdgeColor',[.5,0,.5], 'MarkerFaceColor',[.5,0,.5]);
set(p2,'Color',[.5,0,.5],'LineWidth', 2);



legend('Intact','Degraded')
set(gca, 'xtick', 1:3,...
    'xticklabels',{'0-back','1-back','2-back'})
xlabel('Task')
ylabel('Composite Score (RT (ms)/Accuracy (% correct))')

return

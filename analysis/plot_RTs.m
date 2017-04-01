% Read in file  
T = readtable('output.txt','Delimiter', ',', 'Format', '%.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f');

figure; hold('on')

x = 1:1:3;

% Get the mean RTs and round, then multiply by 1000 to turn into ms.
y0 = [round(mean(T.RT00*1000),3) round(mean(T.RT10*1000),3) round(mean(T.RT20*1000),3)]; 
err = [(std(T.RT00*1000)/sqrt(24)) (std(T.RT10*1000)/sqrt(24)) (std(T.RT20*1000)/sqrt(24))];
p1 = errorbar(x, y0, err, 's', 'MarkerSize',12, 'MarkerEdgeColor',[0,.5,.8], 'MarkerFaceColor',[0,.5,.8]);
set(p1,'Color',[0,.5,.8],'LineWidth', 2);

y1 = [round(mean(T.RT01*1000),3) round(mean(T.RT11*1000),3) round(mean(T.RT21*1000),3)]; 
err = [(std(T.RT01*1000)/sqrt(24)) (std(T.RT11*1000)/sqrt(24)) (std(T.RT21*1000)/sqrt(24))];
p2 = errorbar(x, y1, err, 's', 'MarkerSize',12, 'MarkerEdgeColor',[.5,0,.5], 'MarkerFaceColor',[.5,0,.5]);
set(p2,'Color',[.5,0,.5],'LineWidth', 2);



legend('Intact','Degraded')
set(gca, 'xtick', 1:3,...
    'xticklabels',{'0-back','1-back','2-back'})
xlabel('Task')
ylabel('RT(ms)')

return

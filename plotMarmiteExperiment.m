% clear all
% close all


    
%%
% %%%%%%%%%%%%%%%%%%% load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
t=table2array(MarmiteExperiment2new);


%%
%%%%%%%%%%%%%%%%%%% separate experiments %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time= t(:,1);
emptyind= find(t'==1);
empty= t(:,emptyind');

Marmiteind= find(t'==2);
Marmite= t(:,Marmiteind');

NPBind= find(t'==3);
NPB= t(:,NPBind');

%%
%%%%%%%%%%%%%%%%%%%%%% percentage rotifers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

totalrotempty= empty(2,:);
totalrotMarmite =Marmite(2,:);
totalrotNPB =NPB(2,:);


percentageEmpty =  bsxfun(@rdivide, empty,totalrotempty );
percentageMarmite = bsxfun(@rdivide, Marmite,totalrotMarmite );
percentageNPB =  bsxfun(@rdivide, NPB,totalrotNPB );



%%
%%%%%%%%%%%%%%%%%%%%%%% plot percentage time %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
plot( time(2:32,:), percentageEmpty(2:32,:), 'col', 'b')
hold on
plot( time(2:32,:), percentageMarmite(2:32,:),'col', 'r')
plot( time(2:32,:), percentageNPB(2:32,:), 'col', 'c')
hold off

%%
%%%%%%%%%%%%%%%%%%%% median %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


EmptyMean = mean( percentageEmpty,2);
MarmiteMean = mean( percentageMarmite,2);
NPBMean = mean( percentageNPB,2);

%%
%%%%%%%%%%%%%%% plot percentage mean %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure
plot( time(2:32,:), EmptyMean(2:32,:), 'col', 'b','linewidth',3)
hold on
plot( time(2:32,:), MarmiteMean(2:32,:),'col', 'r','linewidth',3)
plot( time(2:32,:), NPBMean(2:32,:), 'col', 'c', 'linewidth',3)


%%
%%%%%%%%%%%%%% std deviation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stdEmpty= std(percentageEmpty,0,2);
stdMarmite= std(percentageMarmite,0,2);
stdNPB= std(percentageNPB,0,2);

stdEmptyplus= EmptyMean+stdEmpty/2;
stdEmptyminus= EmptyMean-stdEmpty/2;
plot( time(2:32,:), stdEmptyplus(2:32,:), 'col', 'b', 'linestyle', '--')
plot( time(2:32,:), stdEmptyminus(2:32,:), 'col', 'b', 'linestyle', '--')

stdMarmiteplus= MarmiteMean+stdMarmite/2;
stdMarmiteminus= MarmiteMean-stdMarmite/2;
plot( time(2:32,:), stdMarmiteplus(2:32,:), 'col', 'r', 'linestyle', '--')
plot( time(2:32,:), stdMarmiteminus(2:32,:), 'col', 'r', 'linestyle', '--')

stdNPBplus= NPBMean+stdNPB/2;
stdNPBminus= NPBMean-stdNPB/2;
plot( time(2:32,:), stdNPBplus(2:32,:), 'col', 'c', 'linestyle', '--')
plot( time(2:32,:), stdNPBminus(2:32,:), 'col', 'c', 'linestyle', '--')

ylabel('percentage of eaten rotifers')
xlabel('time (seconds)')

hold off

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% violin plot  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

endEmpty= percentageEmpty(30:32,:);
endMarmite=percentageMarmite(30:32,:);
endNPB=percentageNPB(30:32,:);

meanendEmpty= mean(endEmpty,1);
meanendMarmite= mean(endMarmite,1);
meanendNPB= mean(endNPB,1);


meanTogether = {meanendEmpty, meanendMarmite, meanendNPB};
cattogether= {empty(1,:), Marmite(1,:), NPB(1,:)};

figure
violinplot(meanTogether,cattogether );
hold on
set(gca, 'XTick', 1:3, 'XTickLabels', {'Empty', 'Marmite', 'NPB'});
ylabel('percentage of eaten rotifers');

% scatter((1:1,meanendEmpty)

% figure
% scatterplot(1,c)
% hold on
% violinplot(2, meanendMarmite(1,:), 'col', 'r', 'linestyle', ':')
% plot(3, meanendNPB(1,:), 'col', 'c', 'linestyle', ':')




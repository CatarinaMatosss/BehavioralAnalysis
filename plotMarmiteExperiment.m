% clear all
% close all


    
%%
% %%%%%%%%%%%%%%%%%%% load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

folder='D:\data\' ;
filename ='MarmiteExperiment2_new.xls';
filename_starved ='MarmiteExperiment1_new.xls';

T = readtable(strcat(folder,filename));
Y = readtable(strcat(folder,filename_starved));

t =table2array(T);
y =table2array(Y);

%%
%%%%%%%%%%%%%%%%%%% separate experiments %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time= t(:,1);
emptyind= find(t'==1);
empty= t(:,emptyind');

Marmiteind= find(t'==2);
Marmite= t(:,Marmiteind');

NPBind= find(t'==3);
NPB= t(:,NPBind');

%starved
time_starved= y(:,1);
emptyind_starved= find(y'==1);
empty_starved= y(:,emptyind_starved');

Marmiteind_starved= find(y'==2);
Marmite_starved= y(:,Marmiteind_starved');

NPBind_starved= find(y'==3);
NPB_starved= y(:,NPBind_starved');
%%
%%%%%%%%%%%%%%%%%%%%%% percentage rotifers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
totalrotempty= empty(2,:);
totalrotMarmite =Marmite(2,:);
totalrotNPB =NPB(2,:);


percentageEmpty =  bsxfun(@rdivide, empty,totalrotempty );
percentageMarmite = bsxfun(@rdivide, Marmite,totalrotMarmite );
percentageNPB =  bsxfun(@rdivide, NPB,totalrotNPB );


%starved
totalrotempty_starved= empty_starved(2,:);
totalrotMarmite_starved =Marmite_starved(2,:);
totalrotNPB_starved =NPB_starved(2,:);


percentageEmpty_starved =  bsxfun(@rdivide, empty_starved,totalrotempty_starved );
percentageMarmite_starved = bsxfun(@rdivide, Marmite_starved,totalrotMarmite_starved );
percentageNPB_starved =  bsxfun(@rdivide, NPB_starved,totalrotNPB_starved );


%%
%%%%%%%%%%%%%%%%%%%%%%% plot percentage time %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
plot( time(2:32,:), percentageEmpty(2:32,:), 'col', 'b')
hold on
plot( time(2:32,:), percentageMarmite(2:32,:),'col', 'r')
plot( time(2:32,:), percentageNPB(2:32,:), 'col', 'c')
hold off

%starved
figure
plot( time_starved(2:32,:), percentageEmpty_starved(2:32,:), 'col', 'b')
hold on
plot( time_starved(2:32,:), percentageMarmite_starved(2:32,:),'col', 'r')
plot( time_starved(2:32,:), percentageNPB_starved(2:32,:), 'col', 'c')
hold off

%%
%%%%%%%%%%%%%%%%%%%% median %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


EmptyMean = mean( percentageEmpty,2);
MarmiteMean = mean( percentageMarmite,2);
NPBMean = mean( percentageNPB,2);

%starved
EmptyMean_starved = mean( percentageEmpty_starved,2);
MarmiteMean_starved = mean( percentageMarmite_starved,2);
NPBMean_starved = mean( percentageNPB_starved,2);

%%
%%%%%%%%%%%%%%% plot percentage mean %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
plot( time(2:32,:), EmptyMean(2:32,:), 'col', 'b','linewidth',3)
hold on
plot( time(2:32,:), MarmiteMean(2:32,:),'col', 'r','linewidth',3)
plot( time(2:32,:), NPBMean(2:32,:), 'col', 'c', 'linewidth',3)

%%
%%%%%%%%%%% std deviation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%plot percentage mean starved%%%%%%%%%%%%%%%%%%%%%
%starved
figure
plot( time_starved(2:32,:), EmptyMean_starved(2:32,:), 'col', 'b','linewidth',3)
hold on
plot( time_starved(2:32,:), MarmiteMean_starved(2:32,:),'col', 'r','linewidth',3)
plot( time_starved(2:32,:), NPBMean_starved(2:32,:), 'col', 'c', 'linewidth',3)

%%
%%%%%%%%%%%%%%%%%% std deviation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
stdEmpty_starved= std(percentageEmpty_starved,0,2);
stdMarmite_starved= std(percentageMarmite_starved,0,2);
stdNPB_starved= std(percentageNPB_starved,0,2);

stdEmptyplus_starved= EmptyMean_starved+stdEmpty_starved/2;
stdEmptyminus_starved= EmptyMean_starved-stdEmpty_starved/2;
plot( time_starved(2:32,:), stdEmptyplus_starved(2:32,:), 'col', 'b', 'linestyle', '--')
plot( time_starved(2:32,:), stdEmptyminus_starved(2:32,:), 'col', 'b', 'linestyle', '--')

stdMarmiteplus_starved= MarmiteMean_starved+stdMarmite_starved/2;
stdMarmiteminus_starved= MarmiteMean_starved-stdMarmite_starved/2;
plot( time_starved(2:32,:), stdMarmiteplus_starved(2:32,:), 'col', 'r', 'linestyle', '--')
plot( time_starved(2:32,:), stdMarmiteminus_starved(2:32,:), 'col', 'r', 'linestyle', '--')

stdNPBplus_starved= NPBMean_starved+stdNPB_starved/2;
stdNPBminus_starved= NPBMean_starved-stdNPB_starved/2;
plot( time_starved(2:32,:), stdNPBplus_starved(2:32,:), 'col', 'c', 'linestyle', '--')
plot( time_starved(2:32,:), stdNPBminus_starved(2:32,:), 'col', 'c', 'linestyle', '--')

ylabel('percentage of eaten rotifers')
xlabel('time (seconds)')

hold off


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% violin plot  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

endEmpty= percentageEmpty(30:32,:);
endMarmite=percentageMarmite(30:32,:);
endNPB=percentageNPB(30:32,:);

meanendEmpty= mean(endEmpty,1)';
meanendMarmite= mean(endMarmite,1)';
meanendNPB= mean(endNPB,1)';


meanTogether = joinUnevenVectors(meanendEmpty, meanendMarmite, meanendNPB);
groupnames= char('Empty', 'Marmite', 'NPB');
groupNames= cellstr(groupnames);

meanTogetherNaN = meanTogether;

meanTogether(meanTogetherNaN == 0) = NaN;

figure
vc = violinplot(meanTogether,groupNames,'Bandwidth' ,0.05);
hold on

 vc(1).ViolinColor= [0,0,255]./255;
 vc(2).ViolinColor= [255,0,0]./255;
 vc(3).ViolinColor= [0,255,255]./255;

set(gca, 'XTick', 1:3, 'XTickLabels', {'Empty', 'Marmite', 'NPB'});
ylabel('Perc. of eaten rotifers');
axis square



%starved
endEmpty_starved= percentageEmpty_starved(30:32,:);
endMarmite_starved=percentageMarmite_starved(30:32,:);
endNPB_starved=percentageNPB_starved(30:32,:);

meanendEmpty_starved= mean(endEmpty_starved,1)';
meanendMarmite_starved= mean(endMarmite_starved,1)';
meanendNPB_starved= mean(endNPB_starved,1)';


meanTogether_starved = joinUnevenVectors(meanendEmpty_starved, meanendMarmite_starved, meanendNPB_starved);
groupnames_starved= char('Empty starved', 'Marmite starved', 'NPB starved');
groupNames_starved= cellstr(groupnames_starved);

meanTogetherNaN_starved = meanTogether_starved;

meanTogether_starved(meanTogetherNaN_starved == 0) = NaN;

figure
vc = violinplot(meanTogether_starved,groupNames_starved,'Bandwidth' ,0.05);
hold on

 vc(1).ViolinColor= [0,0,255]./255;
 vc(2).ViolinColor= [255,0,0]./255;
 vc(3).ViolinColor= [0,255,255]./255;

set(gca, 'XTick', 1:3, 'XTickLabels', {'Empty starved', 'Marmite starved', 'NPB starved'});
ylabel('Perc. of eaten rotifers');
axis square
%%
%%%%%%%%%%%%%% Do stats %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pEmptyMarmite = ranksum(meanTogether(:,1),meanTogether(:,2));
pEmptyNPB = ranksum(meanTogether(:,1),meanTogether(:,3));
pMarmiteNPB = ranksum(meanTogether(:,2),meanTogether(:,3));

%starved
pEmptyMarmite_starved = ranksum(meanTogether_starved(:,1),meanTogether_starved(:,2));
pEmptyNPB_starved = ranksum(meanTogether_starved(:,1),meanTogether_starved(:,3));
pMarmiteNPB_starved = ranksum(meanTogether_starved(:,2),meanTogether_starved(:,3));

%both
pEmptyEmpty_starved = ranksum(meanTogether(:,1),meanTogether_starved(:,1));
pNPBNPB_starved = ranksum(meanTogether(:,3),meanTogether_starved(:,3));

%%
%%%%%%%%%%%%%%%%%%%%% plot empty NPB, starved satiated %%%%%%%%%%%%%%%%%%%%

figure
plot( time(2:32,:), EmptyMean(2:32,:), 'col', 'b','linewidth',3)
hold on
plot( time(2:32,:), NPBMean(2:32,:), 'col', 'c', 'linewidth',3)
plot( time_starved(2:32,:), EmptyMean_starved(2:32,:), 'col', 'm','linewidth',3)
plot( time_starved(2:32,:), NPBMean_starved(2:32,:), 'col', 'r', 'linewidth',3)

%%
%%%%%%%%%%% std deviation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


plot( time(2:32,:), stdEmptyplus(2:32,:), 'col', 'b', 'linestyle', '--')
plot( time(2:32,:), stdEmptyminus(2:32,:), 'col', 'b', 'linestyle', '--')

plot( time(2:32,:), stdNPBplus(2:32,:), 'col', 'c', 'linestyle', '--')
plot( time(2:32,:), stdNPBminus(2:32,:), 'col', 'c', 'linestyle', '--')

plot( time_starved(2:32,:), stdEmptyplus_starved(2:32,:), 'col', 'm', 'linestyle', '--')
plot( time_starved(2:32,:), stdEmptyminus_starved(2:32,:), 'col', 'm', 'linestyle', '--')

plot( time_starved(2:32,:), stdNPBplus_starved(2:32,:), 'col', 'r', 'linestyle', '--')
plot( time_starved(2:32,:), stdNPBminus_starved(2:32,:), 'col', 'r', 'linestyle', '--')

ylabel('percentage of eaten rotifers')
xlabel('time (seconds)')

hold off


%%
%%%%%%%%%%%%%%%%%%%%% violin plot starved satiated %%%%%%%%%%%%%%%%%%%%%%%%

meanTogether_both = joinUnevenVectors(meanendEmpty, meanendNPB, meanendEmpty_starved, meanendNPB_starved);
groupnames_both= char('Empty satiated', 'NPB satiated', 'Empty starved', 'NPB starved');
groupNames_both= cellstr(groupnames_both);

meanTogetherNaN_both = meanTogether_both;

meanTogether_both(meanTogetherNaN_both == 0) = NaN;


figure
vc = violinplot(meanTogether_both,groupNames_both,'Bandwidth' ,0.05);
hold on

 vc(1).ViolinColor= [0,0,255]./255;
 vc(2).ViolinColor= [0,255,255]./255;
 vc(3).ViolinColor= [255,0,255]./255;
 vc(4).ViolinColor= [255,0,0]./255;

set(gca, 'XTick', 1:4, 'XTickLabels', {'Empty satiated', 'NPB satiated', 'Empty starved', 'NPB starved' });
ylabel('Perc. of eaten rotifers');
axis square


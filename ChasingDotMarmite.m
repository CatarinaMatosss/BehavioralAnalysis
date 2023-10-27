

%chasing dot stims 
%stimNumber == 17 | stimNumber == 18

%%
%location of: EnumeratorBoutInf, EnumeratorFishData, EnumeratorBoutKinPar
%D:\stuffForCat\FreelyMovingBehaviorAnalysis_21\kinParFunctions\Enumerators

%location of: EnumeratorDataSet 
%D:\stuffForCat\FreelyMovingBehaviorAnalysis_21\kinParFunctions\filesToChangeToAddDataset


% close all


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% load bout map stuff %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
folder1 = 'D:\marmiteExperimentsCashingDotOMR\matFilesTodo_bout\MarmiteChasingDotOMREmpty1Atlas\';
filename1 = 'bout_MarmiteChasingDotOMREmpty1Atlas_1000020_20230123_1707_7_700_56_nacreHeatShock37_1_41_000_Mar13.mat';


load(strcat(folder1,filename1));



folder = 'D:\stuffForCat\FreelyMovingBehaviorAnalysis_21\assignBoutTypesUsingMap\BoutMap\';
filename = 'BoutMapCenters_kNN4_74Kins4dims_1.75Smooth_slow_3000_auto_4roc_merged11.mat';%13 bout type


load(strcat(folder,filename),'finalClustering');


idx = finalClustering.idx;
col = finalClustering.col;


%%
%%%%%%%%%%%%%%%%%%%%%%%% important info %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
BoutInf = allBoutStructure.BoutInf;
chasingDotInf= BoutInf(:,[EnumeratorBoutInf.stimNumber EnumeratorBoutInf.stimUniqueNumber EnumeratorBoutInf.boutCat]);

%%
%%%%%%%%%%%%%%%%%%%%%%% find chasind dot stim %%%%%%%%%%%%%%%%%%%%%%%

CDind17= find(chasingDotInf(:,1)==17);
CDind18= find(chasingDotInf(:,1)==18);
CDind= [CDind17' CDind18'];
ChasingDotStim= chasingDotInf(CDind',:);

CDind6= find(ChasingDotStim(:,3)==6);
ChasingDotSLCs= ChasingDotStim(CDind6',:);


%%


h=diff(ChasingDotStim(:,2));

indmaisone=[1;h];
% indstart1=find(indmaisone==64);
% indstart2=find(indmaisone==-480);
% indstart3= [1 indstart1' indstart2'];
% indstart= indstart3';
indstart=find(indmaisone~=0);

indeces=find(ChasingDotStim(:,3)==6);

%what to find
col_num = 3;
num_to_find= 6;

%separation per stimulus
start_idx=indstart';

end_idx_withoutLastElement=indstart(2:end)-1;
size_stimArray=size(ChasingDotStim,1); 
end_idx= [end_idx_withoutLastElement' size_stimArray ];


num_subsections= length(start_idx);
counts_for_each= zeros(num_subsections,length(num_to_find));


for k=1:num_subsections
    
    for i=1:length(num_to_find)
        counts_for_each(k,i)=sum(ChasingDotStim(start_idx(k):end_idx(k),col_num)==num_to_find(i));
    end
end


Mean_SLCs= mean(counts_for_each);

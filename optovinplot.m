% clear all
% close all


%%
% %%%%%%%%%%%%%%%%%%% load data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 folder='C:\Users\orger\OneDrive\Desktop\optovin\rawData\octovinSquare3s3minInterval\' ;
 filename='octovinSquare3s3minInterval_111111119_091023_1_6_700_2000_tu_3_147_000.txt';
 
 b=strcat(folder,filename);
 f= txt2mat(b);
 



%%
%%%%%%%%%%% devide data by fish %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
frameNumber=f(:,1);
endData=f(:,(3*23+2):end);

  for r=1:3
%  r=3   
indstartcol=(23*r-21);
indendcol=(23*r+1);

% end


fishData=f(:,indstartcol:indendcol);

data_fish_one=[frameNumber, fishData, endData];

%%
%%%%%%%%%%%%%%%%%%%% fish position%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xposition=data_fish_one(:,5);
yposition=data_fish_one(:,4);
stim=data_fish_one(:,26);
tailAngle=data_fish_one(:,16:24);
tailVal=data_fish_one(:,6:15);

negdata=find(tailAngle==-100);
tailAngle(negdata)=0;
tailAngletotal=cumsum(tailAngle,2);

% figure
% subplot(2,2,1)
% plot(xposition,yposition,'-k')
% subplot(2,2,2)
% plot(stim)
% subplot(2,2,3)
% plot(tailAngle(1:2000,:))
% ylim([-3,3])
% subplot(2,2,4)
% plot(tailAngletotal(1:2000,:))

figure
plot(tailVal)

%%
%%%%%%%%%%%%%%%%%%%%% stimulus start and end %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%stim=[0; 0; 0 ;0;1; 1; 1;1;0; 0; 0; 0];

h=diff(stim);

indmaisone=[1;h];
indstart=find(indmaisone==1);
indmaisend=[h;1];
indend=find(indmaisend==-1);

% figure
% plot(stim)
% hold on
% plot(indstart,1,'og')
% plot(indend,1, 'or')
% hold off


%%
%%%%%%%%%%%%%%%%%%%%%%%%% bout plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

prevTime = 7000;
postTime =21000;
s= size(indstart,1);

figure
for n=2:s
start=indstart(n)-prevTime;
endd=indstart(n)+postTime;
   

plot(tailAngletotal(start:endd, 1:8)-(n*6),'color', 'k')
hold on
line([prevTime,prevTime], [1,-(n*6)], 'color', 'k','linewidth', 2)
line([prevTime+1400*3,prevTime+1400*3], [1,-(n*6)], 'color', 'k','linewidth', 2)

end


  end

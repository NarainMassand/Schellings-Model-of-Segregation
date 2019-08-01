function pfm=policy1(A)
k=3; %alike number of agents in neighbour for happiness
idx=1:1600;
siz=size(A);
pfm=[];
PFMpolicy1=[];
for epochs=1:30
  pfm(end+1)=performancemetric(A);
  randomidx=datasample(idx,1600,'Replace',false);
   
  for agent=1:1600
    %randomidx(agent)
    [rowidx,colidx]=ind2sub(siz,randomidx(agent));
    
      if A(rowidx,colidx)==0
            %do nothing
      else
          type=A(rowidx,colidx);
          agentidx=sub2ind(siz,rowidx,colidx);
          happy=happiness(A,agentidx,type);
      
            if happy(1)>=k+1 %agent is happy
                %do nothing
            else           %agent is unhappy, move it!
      
                emptyspace=find(A==0);
                %newlocation=randsample(emptyspace,1);
                [newlocation,indexnewlocation]=datasample(emptyspace,1);
                A(newlocation)=A(rowidx,colidx);
                A(rowidx,colidx)=0;
                emptyspace(indexnewlocation)=(colidx-1)*40+rowidx;
          
            end
      end    
  end
  
end
pfm(end+1)=performancemetric(A);
% PFMpolicy1(end+1)=pfm;
% pfm=[];
time=1:epochs+1;
figure(3);
plot(time,pfm);
end
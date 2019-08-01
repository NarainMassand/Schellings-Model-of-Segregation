function pfm=policy2(A,casn,casp)
k=3;
n=[5 10 20]; %number of friends per agent
p=[3 5];     %neighbourhood matrix size to be searched
casn=3;
casp=2;
%idx=1:1600;
siz=size(A);
pfm=[];
friend=[];
friends=[];
possibleplaces=[];
ngbhr_frnd=[];
checkspaces=[];                            
emptyngbhr=[];
spacecheck=[];               %checking for empty spaces near friends
emptyindices=[];
emptylocations_A=[];

% happinessnearfriend=zeros(n(casn),(p(casp)^2)-1);
agents=find(A>0); %removing empty spaces

for agent=1:1400        %assigning friends ensuring that 0 neither has friends nor is a friend
    friend=agents(randi(1400,1,n(casn)));
    friends=[friends; friend'];   
end
friends(:,6)=agents;
%friends(:,6)=1:1600;

for epochs=1:30
  pfm(end+1)=performancemetric(A);
  %randomidx=datasample(idx,1600,'Replace',false);
  randomidx=datasample(agents,1400,'Replace',false);
  
  for agent=1:1400
    %randomidx(agent)
    possibleplaces=[];
    
    [rowidx,colidx]=ind2sub(siz,randomidx(agent));
           
      if A(rowidx,colidx)==0
            %do nothing
      else
        
        agentidx=sub2ind(siz,rowidx,colidx);  
        type=A(rowidx,colidx);
        happy=happiness(A,agentidx,type);
        
        if happy>=k+1 %agent is happy
          %do nothing
        else           %agent is unhappy, move it!
            
          agentinfrndmtrx=find(friends(:,6)==agentidx); %getting friends of the unhappy agent
          currentfriend=friends(agentinfrndmtrx,1:n(casn));
          %[frndrowidx,frndcolidx]=ind2sub(siz,currentfriend);
          ngbhr_frnd=neighbours(A,currentfriend,p(casp));       %getting neighbours of the friends of the unhappy agent
          
          checkspaces=A(ngbhr_frnd);                            
          sz=size(checkspaces);
          emptyngbhr=zeros(sz);
          spacecheck=(checkspaces==emptyngbhr);                 %checking for empty spaces near friends
          emptyindices=find(spacecheck);
          emptylocations_A=ngbhr_frnd(emptyindices(:));
          
          for i=1:length(emptylocations_A)                      %checking for happiness at empty spaces
            state=happiness(A,emptylocations_A(i),type);
            if state>=k+1
            possibleplaces(end+1)=emptylocations_A(i);
            end
          end
          
          if length(possibleplaces)>=1
              
            newlocationidx=datasample(possibleplaces,1);          %choosing one of the happy locations randomly
            A(newlocationidx)=type;
            A(rowidx,colidx)=0;
            agents(agents==agentidx)=newlocationidx;
            friends(friends==agentidx)=newlocationidx;
          else
              
%           currentlocations=[];
           emptyspace=find(A==0);
%            newlocation=randsample(emptyspace,1);
           [newlocation,indexnewlocation]=datasample(emptyspace,1);
           A(newlocation)=A(rowidx,colidx);
           A(rowidx,colidx)=0;
           agents(agents==agentidx)=newlocation;
           friends(friends==agentidx)=newlocation;
           emptyspace(indexnewlocation)=(colidx-1)*40+rowidx;
          end
%           A(newlocation)=A(rowidx,colidx);
%           emptyspace(indexnewlocation)=(colidx-1)*40+rowidx;
          
        end
      end    
  end
  
end

pfm(end+1)=performancemetric(A);
% time=1:epochs+1;
% figure(3);
% plot(time,pfm);
end
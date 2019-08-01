%--Coded by Narain Massand--%
%--This function takes in initial plot A, p - the size of neighbourhood to
%look for and diff - the difference between same and opposite agents in a
%neighbourhood
function pfm=nmpolicy(A,p,diff)
% k=3; %alike number of agents in neighbour for happiness
idx=1:1600;
siz=size(A);
pfm=[];
p=5; %neighbourhood vision
diff=16;

% positions=[];
% positions(:,1)=1:1600;
% positions(:,2)=1:1600;

for epochs=1:20
  pfm(end+1)=performancemetric(A);
  randomidx=datasample(idx,1600,'Replace',false);
   
  for agent=1:1600
    howhappy=[];
    emptyplaces=[];
    %randomidx(agent)
    [rowidx,colidx]=ind2sub(siz,randomidx(agent));
    
      if A(rowidx,colidx)==0
            %do nothing
      else
          type=A(rowidx,colidx);
          agentidx=sub2ind(siz,rowidx,colidx);
          happy=happiness(A,agentidx,type);
          
          if type==1
              opptype=2;
          else 
              opptype=1;
          end
          
          agentneighboursindex=neighbours(A,agentidx,p);
          agentneighbourvalues=A(agentneighboursindex);
          sumtype=sum(agentneighbourvalues(:)==type);
          sumopptype=sum(agentneighbourvalues(:)==opptype);
          
          
            if sumtype-opptype>=diff %agent is happy
                %do nothing
            else           %agent is unhappy, move it!
                emptyplaces=agentneighboursindex(find(agentneighbourvalues==0));
                for i=1:length(emptyplaces)
                    howhappy(i)=happiness(A,emptyplaces(i),type);
                end
                [value,index]=max(howhappy);
                if max(howhappy)>=happy
                    A(emptyplaces(index))=type;
                    A(agentidx)=0;
%                     positions(find(positions(:,2)==emptyplaces(index)),2)=0;
%                     positions(find(positions(:,2)==agentidx),2)=emptyplaces(index);
                    
                end
                
            end
      end    
  end
  
end

pfm(end+1)=performancemetric(A);
end
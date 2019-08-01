%-Happiness function takes the posititon and matrix as the input argument and return the same number of neighbours-%
function state=happiness(A,linearidx,type)
        
        siz=size(A);
        [rowidx,colidx]=ind2sub(siz,linearidx);
        
        if rowidx==40
            nextrowidx=1;
        else
            nextrowidx=rowidx+1;
        end
    
        if rowidx==1
            prevrowidx=40;
        else
            prevrowidx=rowidx-1;
        end
    
        if colidx==40
            nextcolidx=1;
        else
            nextcolidx=colidx+1;
        end
    
        if colidx==1
            prevcolidx=40;
        else
            prevcolidx=colidx-1;
        end
        
      if type==1
          opptype=2;
      else
          opptype=1;
      end
      expngb(1:3,1:3)=type;
      emptyngb(1:3,1:3)=0;
      oppngb(1:3,1:3)=opptype;
      realngb(1,1)=A(prevrowidx,prevcolidx);
      realngb(1,2)=A(prevrowidx,colidx);
      realngb(1,3)=A(prevrowidx,nextcolidx);
      realngb(2,1)=A(rowidx,prevcolidx);
      realngb(2,2)=A(rowidx,colidx);
      realngb(2,3)=A(rowidx,nextcolidx);
      realngb(3,1)=A(nextrowidx,prevcolidx);
      realngb(3,2)=A(nextrowidx,colidx);
      realngb(3,3)=A(nextrowidx,nextcolidx);
      %realngb=A(prevrowidx:nextrowidx,prevcolidx:nextcolidx);
      samecheck=(expngb==realngb);
      same=sum(sum(samecheck));
      oppcheck=(oppngb==realngb);
      opp=sum(sum(oppcheck));
      emptycheck=(emptyngb==realngb);
      empty=sum(sum(emptycheck));
      happiness=same;
      sadness=opp;
      emptiness=empty;
      state=happiness;
%       state=[happiness; sadness; emptiness];
end
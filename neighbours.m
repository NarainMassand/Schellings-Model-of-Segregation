%takes the matrix, p and a linearindex or an array of linearindices and return
%all the elements in a pxp neighbourhood
function neighbours=neighbours(A,linearindex,p)

for i=1:length(linearindex)
    
siz=size(A);
[r,c]=ind2sub(siz,linearindex(i));

        if r==40
            nr=1;
        else
            nr=r+1;
        end
    
        if r==1
            pr=40;
        else
            pr=r-1;
        end
    
        if c==40
            nc=1;
        else
            nc=c+1;
        end
    
        if c==1
            pc=40;
        else
            pc=c-1;
        end

        if nr==40
            nnr=1;
        else
            nnr=nr+1;
        end
    
        if pr==1
            ppr=40;
        else
            ppr=pr-1;
        end
    
        if nc==40
            nnc=1;
        else
            nnc=nc+1;
        end
    
        if pc==1
            ppc=40;
        else
            ppc=pc-1;
        end

        
        if p==3
            neighbours(:,i)=[sub2ind(siz,pr,pc); sub2ind(siz,pr,c); sub2ind(siz,pr,nc); sub2ind(siz,r,pc); sub2ind(siz,r,c); sub2ind(siz,r,nc); sub2ind(siz,nr,pc); sub2ind(siz,nr,c); sub2ind(siz,nr,nc); ];
        elseif p==5
            neighbours(:,i)=[sub2ind(siz,ppr,ppc); sub2ind(siz,ppr,pc); sub2ind(siz,ppr,c); sub2ind(siz,ppr,nc); sub2ind(siz,ppr,nnc); sub2ind(siz,pr,ppc); sub2ind(siz,pr,pc); sub2ind(siz,pr,c); sub2ind(siz,pr,nc); sub2ind(siz,pr,nnc); sub2ind(siz,r,ppc); sub2ind(siz,r,pc); sub2ind(siz,r,c); sub2ind(siz,r,nc); sub2ind(siz,r,nnc); sub2ind(siz,nr,ppc); sub2ind(siz,nr,pc); sub2ind(siz,nr,c); sub2ind(siz,nr,nc); sub2ind(siz,nr,nnc); sub2ind(siz,nnr,ppc); sub2ind(siz,nnr,pc); sub2ind(siz,nnr,c); sub2ind(siz,nnr,nc); sub2ind(siz,nnr,nnc);];
        else
            neighbours(:,i)=[sub2ind(siz,pr,pc); sub2ind(siz,pr,c); sub2ind(siz,pr,nc); sub2ind(siz,r,pc); sub2ind(siz,r,c); sub2ind(siz,r,nc); sub2ind(siz,nr,pc); sub2ind(siz,nr,c); sub2ind(siz,nr,nc); ];
        end
%neighbours=[r c];

end

end
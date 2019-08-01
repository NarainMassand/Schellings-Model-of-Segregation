%basucally same as plotting, just plots different figures
[row1,col1]=find(A==1);
[row2,col2]=find(A==2);
figure(2)
scatter(row1,col1,'r','o');
hold on;
scatter(row2,col2,'b','filled','o');
hold off;
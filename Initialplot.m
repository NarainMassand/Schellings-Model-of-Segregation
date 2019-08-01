function A=Initialplot
% --created in MATLAB2015a by Narain Massand--%
%--started on 3/26/2019 at 17:30--%
%Makes the initial matrix to work with
dim=40; %dimension of array
A = randi([1 2], dim,dim);
% f=0.1; %fraction of 0's to be placed -- can be used to change the amount of empty space 
% num0 = round(f*dim*dim); %number of 0's in 
num0=200;
A(randperm(dim*dim,num0)) = 0; % randomly put 0's in result using linear indexing
end
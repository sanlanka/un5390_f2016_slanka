%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/12, 9:45PM

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'guassianelim.m'" in the Command Window and provide the inputs. 
%To open the file type "open 'guassianelem.m'" making sure...
%Matlab's present directory is changed to the 'Search' directory

% Example Run
% A=rand(5,4);
% b=rand(4,1);
% [x,u] = gausselim(A,b)


function [x,u]=gausselim(A,b)
% function to perform gauss eliminination
%FORWARD ELIMINATION
n=length(b);
m=zeros(n,1);
x=zeros(n,1);
for k =1:n-1
      %compute the kth column of M
      m(k+1:n) = A(k+1:n,k)/A(k,k);
      %compute
      %An=Mn*An-1;
      %bn=Mn*bn-1;
      for i=k+1:n
          A(i, k+1:n) = A(i,k+1:n)-m(i)*A(k,k+1:n);
      end;
      b(k+1:n)=b(k+1:n)-b(k)*m(k+1:n);
end
u= triu(A);
%BACKWARD ELIMINATION
x(n)=b(n)/A(n,n);
for k =n-1:-1:1
      b(1:k)=b(1:k)-x(k+1)* u(1:k,k+1);
      x(k)=b(k)/u(k,k);
end
end
%end
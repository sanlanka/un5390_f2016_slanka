
%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/12, 9:45PM

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'lufact.m'" in the Command Window and provide the inputs. 
%To open the file type "open 'lufact.m'" making sure...
%Matlab's present directory is changed to the 'lucfact' directory

% Example Run
% A=rand(5,4);

function [L,U,P]=lufact(A)
% LU factorization with partial (row) pivoting

[~,n]=size(A);
L=eye(n); P=L; U=A;
for k=1:n
    [~, m]=max(abs(U(k:n,k)));
    m=m+k-1;
    if m~=k
        % interchange rows m and k in U
        temp=U(k,:);
        U(k,:)=U(m,:);
        U(m,:)=temp;
        % interchange rows m and k in P
        temp=P(k,:);
        P(k,:)=P(m,:);
        P(m,:)=temp;
        if k >= 2
            temp=L(k,1:k-1);
            L(k,1:k-1)=L(m,1:k-1);
            L(m,1:k-1)=temp;
        end
    end
    for j=k+1:n
        L(j,k)=U(j,k)/U(k,k);
        U(j,:)=U(j,:)-L(j,k)*U(k,:);
    end
end
%end
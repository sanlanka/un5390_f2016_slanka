%matrix_multiply_p
%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'matrix_multiply'" in the Command Window. 
%To open the file type "open 'matrix_multiply'" making sure...
%Matlab's present directory is changed to the 'matrix_multiply' directory

%slanka for SC1 Assignment_012
%Sun, 14:32PM, 11/27/2016
parpool('local',12);
timestamp = [];
tic
for z = 6:7
N = 2^z; %Size of matrix
 %Timestamps storage array
%Begin
%% Populate A and B
A = zeros(N,N);%parfor gives error w/o preallocation
B = zeros(N,N);%porfor gives error w/o preallocation
parfor i = 1:N 
    for j =1:N 
%         if i==j
%         A(i,j) = 1;
%         else
%         A(i,j) = 0;
%         end
        A(i,j) = i*(N-i-1)*(N-j-1);
        B(i,j) = i+j+2;
    end
end
%NxNmatrix = [Nx1matrix;Nx1matrix;Nx1matrix];
%% Multiply
C = zeros(N);
parfor i = 1:N
    for j = 1:N
            for k = 1:N %Sum all the individual products to get the main sum
                C(i,j) = C(i,j)+(A(i,k)*B(k,j));
            end
    end
end
end
timestamp(end+1) = toc;
dlmwrite('timestampn1.dat',timestamp,' ');
%end

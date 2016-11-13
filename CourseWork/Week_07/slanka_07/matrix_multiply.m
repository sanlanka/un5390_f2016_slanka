%matrix_multiply
%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'matrix_multiply'" in the Command Window. 
%To open the file type "open 'matrix_multiply'" making sure...
%Matlab's present directory is changed to the 'matrix_multiply' directory

%slanka for SC1 Assignment_07
%Wed, 14:32PM, 10/2/2016
tic
N = 8; %Size of matrix
timestamp = []; %Timestamps storage array
%Begin
%% Populate A and B
for i = 1:N 
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
for i = 1:N
    for j = 1:N
            for k = 1:N %Sum all the individual products to get the main sum
                C(i,j) = C(i,j)+(A(i,k)*B(k,j));
            end
    end
end
timestamp(end+1) = toc;
disp('C = ');
disp(C);
%end
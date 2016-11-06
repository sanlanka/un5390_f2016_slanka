%matrix_multiply
%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'matrix_multiply'" in the Command Window. 
%To open the file type "open 'matrix_multiply'" making sure...
%Matlab's present directory is changed to the 'matrix_multiply' directory

%slanka for SC1 Assignment_07
%Wed, 14:32PM, 10/2/2016
%All Matrices are represented as column vectors meaning that if we want to ..
%enter values in a matrix they are going to be arranged in straight columns
%[1,2,3;1,2,3;1,2,3] will be represented as[1,2,3,1,2,3,1,2,3] 
clc;
clear;

N = [2,3,4]; %RxV matrix
A = [2,3,4,2,3,4,2,3,4];%CxR
B = N;
%NxNmatrix = [Nx1matrix;Nx1matrix;Nx1matrix];
[~,c] = size(B);
co = 0;%Count to Jump Columns(Represneted as straight rows)
ii = 1;
C = zeros(1,c);
for i = 1:c
    for j = 1:c
    C(ii) = C(ii)...
                    +(A((co*c)+j)*B(j));
    end
        
        co = co + 1;
        ii = i + 1;
end
%Displays Multiplied matrix on the Command Prompt
disp('Result:')
disp(C');
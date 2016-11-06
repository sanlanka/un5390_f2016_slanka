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


N = [2,3,4]; %RxV matrix
Nx1matrix = N;
NxNmatrix = [2,3,4,2,3,4,2,3,4];%CxR
%NxNmatrix = [Nx1matrix;Nx1matrix;Nx1matrix];
[~,c] = size(Nx1matrix);
co = 0;%Count to Jump Columns(Represneted as straight rows)
ii = 1;
mulMatrix = zeros(1,3);
for i = 1:c
    for j = 1:c
    mulMatrix(ii) = mulMatrix(ii)...
                    +(NxNmatrix((co*c)+j)*Nx1matrix(j));
    end
        
        co = co + 1;
        ii = i + 1;
end
%Displays Multiplied matrix on the Command Prompt
disp('Result:')
disp(mulMatrix');
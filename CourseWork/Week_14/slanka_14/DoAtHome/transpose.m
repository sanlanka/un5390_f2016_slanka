%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/12, 9:45PM

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'transpose.m'" in the Command Window and provide the inputs. 
%To open the file type "open 'transpose.m'" making sure...
%Matlab's present directory is changed to the 'transpose' directory

% Example Run
% A=rand(5,4);
% T = transpose(A);

function [T]=transpose(A)

[r,c]   = size(A);
T       = zeros(c,r);

%Transpose

for i = 1:r
    for j = 1:c
        
        T(j,i)  = A(i,j);
        
    end
end

end

%end

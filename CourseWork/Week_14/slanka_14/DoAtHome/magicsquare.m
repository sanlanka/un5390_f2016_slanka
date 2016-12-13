%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/12, 10:07PM

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'magicsquare.m'" in the Command Window and provide the inputs. 
%To open the file type "open 'magicsquare.m'" making sure...
%Matlab's present directory is changed to the 'transpose' directory
% A is the size of te Matrix
% Example Run
% T = magicsquare(A);

function [T]=magicsquare(A)

T       = zeros(A,A);

%Magic

A = floor(real(double(A(1))));

if mod(A,2) == 1
   % Odd order 
   T = oddOrderMagicSquare(A);
elseif mod(A,4) == 0
   % Doubly even order.
   % Doubly even order.
   J = fix(mod(1:A,4)/2);
   K = J' == J;
   T = (1:A:(A*A))' + (0:A-1);
   T(K) = A*A+1 - T(K);
else
   % Singly even order.
   p = A/2;   %p is odd.
   T = oddOrderMagicSquare(p);
   T = [T T+2*p^2; T+3*p^2 T+p^2];
   if A == 2
      return
   end
   i = (1:p)';
   k = (A-2)/4;
   j = [1:k (A-k+2):A];
   T([i; i+p],j) = T([i+p; i],j);
   i = k+1;
   j = [1 i];
   T([i; i+p],j) = T([i+p; i],j);
end

function M = oddOrderMagicSquare(n)
p = 1:n;
M = n*mod(p'+p-(n+3)/2,n) + mod(p'+2*p-2,n) + 1;

%end

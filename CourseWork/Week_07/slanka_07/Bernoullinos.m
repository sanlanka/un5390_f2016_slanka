%function Bernoulinos
%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'Bernoulinos'" in the Command Window. 
%To open the file type "open 'Bernoulinos'" making sure...
%Matlab's present directory is changed to the 'Bernoulinos' directory

%slanka for SC1 Assignment_07
%Wed, 17:23PM, 11/8/2016
%To Generate Bernoulis Numbers by Masanobu Keneko method
function Bernoullinos(num)
num = num + 1;
numberList = zeros(num,1);%Vector for storing the list of B no's
   %The Matrix usrd to calculate Bernouli Numbers
   B = zeros(num,num);
  B(1,1) = 1;
  B(1,2) =1/2;
  for c = 1:num %Loop through the number of columns
            %B(1,colum) = 1/(1+column)
           B(1,c) = 1/(c); 
            %if row is not equal to 1, then the value ic calculate as shown
  end
  for r = 2:num %Loop throught the number of rows
     for c = 1:num-r %Loop through the number of columns
        
            %if row is not equal to 1, then the value ic calculate as shown
           B(r,c) = ((c)*(B(r-1,c)-B(r-1,c+1))); 
     end
  end

%% Storing all the Bernouli Numbers in the vector.
%  fprintf('Bernouli Number 0 = %d\n',numberList(1));
%  fprintf('Bernouli Number 1 = %d\n',numberList(2));
  for i = 1:num
     numberList(i) = B(i,1); 
     %Print Bernoulli Numbers
     fprintf('Bernouli Number %d = %f\n',i-1,B(i,1));
  end
end
 
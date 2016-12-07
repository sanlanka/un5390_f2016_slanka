%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/4, 2:00PM
%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'Ranges.m'" in the Command Window. 
%To open the file type "open 'Ranges'"and provide the inputs making sure...
%Matlab's present directory is changed to the 'timings' directory
%Prints the ranges of 16, 32 ,64 bit signed and unsigned systems
fprintf('Range of 16 bit signed system is %d to %d\n',intmin('int16'),intmax('int16'));
fprintf('Range of 16 bit unsigned system is %d to %d\n\n',intmin('uint16'),intmax('uint16'));

fprintf('Range of 32 bit signed system is %d to %d\n',intmin('int32'),intmax('int32'));
fprintf('Range of 32 bit unsigned system is %d to %d\n\n',intmin('uint32'),intmax('uint32'));

fprintf('Range of 64 bit signed system is %d to %d\n',intmin('int64'),intmax('int64'));
fprintf('Range of 64 bit unsigned system is %d to %f\n\n',intmin('uint64'),intmax('uint64'));

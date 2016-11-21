######################################################
######################################################
## Script Purpose:
## Calculate Golden Ratio
##
######################################################
## Usage: From shell command line: 
##        julia GoldenRatio.jl 
##       
## Prompts:
##   Follow prompts to enter values. Only necessary
##   parameters are required to meet a single formula
##   requirements.
######################################################
## Purpose:
##   Will print out Golden Ratio starting at fixed
##   integer until it reaches a tolerance value.
##   Each iteration will print to a file 
##   "GoldenRatio.dat" for plotting.
##   Optional input allows for values to print to 
##   screen as well.
######################################################
## Developer:  Adam A. Mitteer
## Date:       October 07, 2016
## Revision:   1.1
######################################################
######################################################
## Begin Script

######################################################
## Functions

  ## Golden Ratio Function (a = Integer to Start, b = Tolerance, c = Print Lines)
  function fncGolden(a,b,c)

    ## Initialize Variables
    iVal::Float64 = a
    iValOld::Float64 = a
    n::Int32 = 0
    error::Float64 = b + 1

    # Initialize File and Write Header
    open("GoldenRatio.dat","a") do objFile
      write(objFile, "Iteration,x,AbsoluteError\n") # write physical file
      write(objFile, "0,$a,\n") # write starting point

    if (c == 1) 
      print("Iteration      x                        Error\n----------------------------------------------------------------\n")
      print("0" * " "^14 * "$a" * " "^(25-length(string(a))) * "n/a\n")
    end


      ## Loop
      while error > b
      
        iValOld = iVal # Used for Error

        iVal = sqrt(1 + iVal) # set iterative value

        n += 1 # add 1 to # of iterations
     
        error = abs(iVal - iValOld) # absolute error

        ## Print Results on Screen
        if (c == 1) 
	  print("$n" * " "^(15-length(string(n))) * "$iVal" * " "^(25-length(string(iVal))) * "$error\n")
        end

        # Record Data Operations
        write(objFile, "$n,$iVal,$error\n") # write iterative row

      end
      close(objFile) #close the file

      ## Print Results on Screen
      if (c == 1) 
        print("\n")
      end
       
    end #end file

    return n, iVal, error

  end

######################################################
## Main Script

  ## Clear Out Data File
  try
    rm("GoldenRatio.dat")
  end

  try
    #input for x (Starting Value)
    print("Please Enter Starting Integer Value (x): ")
    x::Int64 = parse(readline())

    #input for t (Tolerance)
    print("Please Enter Tolerance Value (t) (ex. 10e-05): ")
    t::Float64 = parse(readline())

    #Print Results
    print("Show Results On Screen? (1=Yes, 0=No): ")
    results::Int32 = parse(readline())

    #execute function
    z, fv, abserr = fncGolden(x,t,results) 

    ## Print Complete
    print("Processing Complete:\n----------------------------------\n Start (x) = $x \n Tolerance = $t \n Total Iterations Executed = $z \n Final Value = $fv \n Abs. Error = $abserr\n\n")
  catch(e)
    print("There was an error calculating results.\n")
    println(e)
  end

## End Script
######################################################


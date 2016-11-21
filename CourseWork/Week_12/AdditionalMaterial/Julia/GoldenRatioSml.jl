######################################################
######################################################
## Script Purpose:
## Calculate Golden Ratio (Smaller Version)
##
######################################################
## Usage: From shell command line: 
##        julia GoldenRatioSml.jl 
##       
## Prompts:
##   Follow prompts to enter values. Only necessary
##   parameters are required to meet a single formula
##   requirements.
######################################################
## Purpose:
##   Will print out Golden Ratio starting at fixed
##   integer until it reaches a tolerance value.
##   Each iteration will print on the screen.
######################################################
## Developer:  Adam A. Mitteer
## Date:       October 07, 2016
## Revision:   1.0
######################################################
######################################################
## Begin Script

######################################################
## Functions

  ## Golden Ratio Function (a = Integer to Start, b = Tolerance)
  function fncGolden(a,b)

    ## Initialize Variables
    iVal::Float64 = a
    iValOld::Float64 = a
    n::Int32 = 0
    error::Float64 = b + 1

    # Print Data
    print("Iteration      x                        Error\n----------------------------------------------------------------\n")
    print("Start" * " "^10 * "$a" * " "^(25-length(string(a))) * "n/a\n")

    ## Loop
    while error > b
      
      iValOld = iVal              # Used for error calculation (previous result)
      iVal = sqrt(1 + iVal)       # Set iterative value (current result)
      n += 1 		          # add 1 to # of iterations
      error = abs(iVal - iValOld) # absolute error (current - previous)

      ## Print Results on Screen
      print("$n" * " "^(15-length(string(n))) * "$iVal" * " "^(25-length(string(iVal))) * "$error\n")
    end

    print("\n") # add extra space
    return n, iVal, error  #return values for additional printing
  end

######################################################
## Main Script

  try
    #input for x (Starting Value)
    print("Please Enter Starting Integer Value (x): ")
    x::Int64 = parse(readline())

    #input for t (Tolerance)
    print("Please Enter Tolerance Value (t) (ex. 10e-05): ")
    t::Float64 = parse(readline())

    #execute function
    z, fv, abserr = fncGolden(x,t) 

    ## Print Complete
    print("Processing Complete:\n----------------------------------\n Start (x) = $x \n Tolerance = $t \n Total Iterations Executed = $z \n Final Value = $fv \n Abs. Error = $abserr\n\n")
  catch(e)
    print("There was an error with the inputs or results.\n")
    println(e)
  end

## End Script
######################################################


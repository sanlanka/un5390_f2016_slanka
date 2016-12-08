-- MATLAB R2015b

-- Help
help([[

  Product details
  Name     : MATLAB
  Version  : R2015b
  Vendor   : MathWorks, Inc.
  Website  : http://mathworks.com/

  Compilation/Installation notes
  User     : John Sanderson
  Date     : 2015-10-01
  Compiler : Not applicable

]])

-- Package
local name    = "matlab"
local version = "R2015b"
local base    = pathJoin("/home/campusNN/john/apps", name, version)

-- PATH, LD_LIBRARY_PATH, MANPATH, VARS, MODULEPATH and MODULEPATH_ROOT, etc.
setenv("MATLAB", base)
prepend_path("PATH", pathJoin(base, "bin"))

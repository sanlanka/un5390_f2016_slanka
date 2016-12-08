-- mpiP 3.4.1

-- Help
help([[

  Product details
  Name     : mpiP
  Version  : 3.4.1
  Vendor   : LLNL
  Website  : http://mpip.sourceforge.net

  Compilation/Installation notes
  User     : John Sanderson
  Date     : 2016-03-08
  Compiler : GCC/4.8.5

]])

-- Package
local name      = "mpiP"
local version   = "3.4.1"
local compiler  = "mpich"
local cversion  = "3.2"
local ccompiler = "gcc"
local ccversion = "4.8.5"
local base      = pathJoin("/home/campusNN/john/apps", name,  version, compiler, cversion, ccompiler, ccversion)

-- PATH, LD_LIBRARY_PATH, MANPATH, VARS, MODULEPATH and MODULEPATH_ROOT, etc.
setenv("MPIP", base)
--
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

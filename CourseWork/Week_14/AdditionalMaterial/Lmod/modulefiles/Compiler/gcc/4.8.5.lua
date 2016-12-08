-- GCC 4.8.5

-- Help
help([[

  Product details
  Name     : GCC
  Version  : 4.8.5
  Vendor   : The Free Software Foundation
  Website  : https://gcc.gnu.org/

  Compilation/Installation notes
  User     : OS
  Date     : 2013-06-09
  Compiler : Not applicable

]])

-- Package
local name    = "GNU Compiler Collection"
local version = "4.8.5"
local base    = "/usr"

-- PATH, LD_LIBRARY_PATH, MANPATH, VARS, MODULEPATH and MODULEPATH_ROOT, etc.
setenv("GCC", base)
--
setenv("CC",  "gcc")
setenv("CXX", "g++")
setenv("FC",  "gfortran")
setenv("F77", "g77")
--
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("MANPATH", pathJoin(base, "share/man"))
prepend_path("LD_LIBRARY_PATH", "/lib64")
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib64"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "kerberos/lib64"))

--
-- Modules (packages) compiled with GCC 4.8.5
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot, "gcc", version)
append_path("MODULEPATH", mdir)

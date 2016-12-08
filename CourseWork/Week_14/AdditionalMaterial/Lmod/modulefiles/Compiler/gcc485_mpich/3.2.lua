-- MPICH 3.2

-- Help
help([[

  Product details
  Name     : MPICH
  Version  : 3.2
  Vendor   : Argonne National Laboratory
  Website  : http://www.mpich.org/

  Compilation/Installation notes
  User     : John Sanderson
  Date     : 2016-03-08
  Compiler : GCC/4.8.5

]])

-- Package
local name     = "mpich"
local version  = "3.2"
local compiler = "gcc"
local cversion = "4.8.5"
local base     = pathJoin("/home/campusNN/john/apps", name,  version, compiler, cversion)

-- PATH, LD_LIBRARY_PATH, MANPATH, VARS, MODULEPATH and MODULEPATH_ROOT, etc.
setenv("MPICH", base)
--
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("MANPATH", pathJoin(base, "share/man"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

--
-- Modules (packages) compiled with MPICH 3.2 (in turn, with GCC 4.8.5)
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot, "gcc485_mpich", version)
append_path("MODULEPATH", mdir)

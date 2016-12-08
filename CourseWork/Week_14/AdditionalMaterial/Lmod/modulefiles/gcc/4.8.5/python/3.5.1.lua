-- Python 3.5.1

-- Help
help([[

  Product details
  Name     : Python
  Version  : 3.5.1
  Vendor   : Python Software Foundation
  Website  : https://www.python.org/

  Compilation/Installation notes
  User     : John Sanderson
  Date     : 2016-03-08
  Compiler : GCC/4.8.5

]])

-- Package
local name     = "python"
local version  = "3.5.1"
local compiler = "gcc"
local cversion = "4.8.5"
local base     = pathJoin("/home/campusNN/john/apps", name,  version, compiler, cversion)

-- PATH, LD_LIBRARY_PATH, MANPATH, VARS, MODULEPATH and MODULEPATH_ROOT, etc.
setenv("PYTHON", base)
--
prepend_path("PATH", pathJoin(base, "bin"))
prepend_path("MANPATH", pathJoin(base, "share/man"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base, "lib"))

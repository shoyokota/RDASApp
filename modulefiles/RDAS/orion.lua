help([[
Load environment for running the RDAS application with Intel compilers and MPI.
]])

local pkgName    = myModuleName()
local pkgVersion = myModuleVersion()
local pkgNameVer = myModuleFullName()

prepend_path("MODULEPATH", '/work/noaa/epic/role-epic/spack-stack/orion/modulefiles')
load("miniconda/3.9.7")
load("ecflow/5.8.4")
load("mysql/8.0.31")

prepend_path("MODULEPATH", '/work/noaa/epic/role-epic/spack-stack/orion/spack-stack-1.5.1/envs/unified-env/install/modulefiles/Core')
load("stack-intel/2022.0.2")
load("stack-intel-oneapi-mpi/2021.5.1")
load("stack-python/3.10.8")
load("jedi-mpas-env/1.0.0")

setenv("CC","mpiicc")
setenv("FC","mpiifort")
setenv("CXX","mpiicpc")
local mpiexec = '/opt/slurm/bin/srun'
local mpinproc = '-n'
setenv('MPIEXEC_EXEC', mpiexec)
setenv('MPIEXEC_NPROC', mpinproc)

setenv("CRTM_FIX","/work2/noaa/da/cmartin/GDASApp/fix/crtm/2.4.0")
prepend_path("PATH","/apps/contrib/NCEP/libs/hpc-stack/intel-2018.4/prod_util/1.2.2/bin")

execute{cmd="ulimit -s unlimited",modeA={"load"}}

whatis("Name: ".. pkgName)
whatis("Version: ".. pkgVersion)
whatis("Category: RDASApp")
whatis("Description: Load all libraries needed for RDASApp")

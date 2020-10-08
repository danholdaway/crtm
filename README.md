CRTM REL-2.4.0-alpha
====================

Preamble
--------

CRTM v2.4.0 alpha release (`REL-2.4.0-alpha`)  

Created on October 7, 2020  

This is a fully functional release of CRTM v2.4.0.  

"Alpha" status indicates that this release has not been fully tested, and some minor work remains.  

Basic requirements:  
(1) A Fortran 2003 compatible compiler.  
(2) A netcdf4 / HDF5 library.   


Contents
========

1. Configuration  
  a. The easy (I hope) way  
  b. The more flexible way  
2. Building the library  
3. Testing the library  
4. Installing the library  
  a. GNU Install  
      - Linking to the library  
  b. Uninstalling the library  
5. Cleaning up  
6. Feedback and contact info  



Configuration, building, and testing the library
================================================	
JCSDA CRTM v2.4.x Build Instructions

- Development Repository Build
- Note: the development repository build differs from a release build. 
	
The CRTM **development** repository directory structure looks like:

<pre>
 .
  ├── LICENSE
  ├── NOTES
  ├── README.md
  ├── Set_CRTM_Environment.sh
  ├── <b>configuration/</b>
  ├── <b>documentation/</b>
  ├── <b>fix/</b>
  │   ├── AerosolCoeff/
  │   ├── CloudCoeff/
  │   ├── EmisCoeff/
  │   ├── SpcCoeff/
  │   └── TauCoeff/
  ├── scripts/
  │   ├── idl/
  │   ├── ruby/
  │   └── shell/
  ├── <b>src/</b>
  │   ├── Ancillary/
  │   ├── AntennaCorrection/
  │   ├── AtmAbsorption/
  │   ├── AtmOptics/
  │   ├── AtmScatter/
  │   ├── Atmosphere/
  │   ├── <b>Build/</b>
	│   │   └── <b>libsrc/</b>
	│   │       └── <b>test/</b>
  │   ├── CRTM_Utility/
  │   ├── ChannelInfo/
  │   ├── Coefficients/
  │   ├── GeometryInfo/
  │   ├── InstrumentInfo/
  │   ├── Interpolation/
  │   ├── NLTE/
  │   ├── Options/
  │   ├── RTSolution/
  │   ├── SensorInfo/
  │   ├── SfcOptics/
  │   ├── Source_Functions/
  │   ├── Statistics/
  │   ├── Surface/
  │   ├── TauProd/
  │   ├── TauRegress/
  │   ├── Test_Utility/
  │   ├── User_Code/
  │   ├── Utility/
  │   ├── Validation/
  │   ├── Zeeman/
  └── <b>test/</b>
      └── Main/
</pre>

In the above list, the directories highlighted in bold (bold in markdown), are the key directories of interest to the casual developer.
A user is only likely to be interested in creating a "build" or use a previously created build (see releases/* on the github.com repository).

A typical "build release" of CRTM (what you would normally find in a tarball and see in libraries) is what's contained under the `src/Build` directory.
But after a clean clone of the repository, none of the links to source code have been created yet under `src/Build`.  

## Configuration

At the top level (CRTM_dev/), the `configuration` directory contains the various compiler-specific configuration files.
```
  $ ls  config-setup/
  ftn.setup                 ftn.setup.csh
  g95-debug.setup           gfortran.setup.csh     pgf95.setup
  g95-debug.setup.csh       ifort-debug.setup      pgf95.setup.csh
  g95.setup                 ifort-debug.setup.csh  xlf2003-debug.setup
  g95.setup.csh             ifort.setup            xlf2003-debug.setup.csh
  gfortran-debug.setup      ifort.setup.csh        xlf2003.setup
  gfortran-debug.setup.csh  pgf95-debug.setup      xlf2003.setup.csh
  gfortran.setup            pgf95-debug.setup.csh

```
[Note: as of the time of writing, October 2020, only `ifort.setup`, `ifort-debug.setup`, `gfortran.setup`, `gfortran-debug.setup` have been actively developed and tested.  It is strongly recommended that the user use one of these compilers until the remaining setup files are updated.  Contact the support email address for specific compiler support requests.  The c-shell (.csh) extension files have not been updated.]

All of the above files define values for the environment variables `FC`, `FCFLAGS`, `LDFLAGS`, and `LIBS`.
 
To use these files to define the CRTM build environment, you should source them. For example, if you use the sh/bash/ksh shells and you want to setup
for a build using the gfortran compiler using debug options you would type:

**Configuration Step 1**  
    `$ . configuration/gfortran-debug.setup`  

(note the `.` -- for a detailed discussion of `.` vs. `source` see: https://unix.stackexchange.com/questions/58514/what-is-the-difference-between-and-source-in-shells)


Within the 'src/Build' directory, The legacy build system for the CRTM uses an autoconf-generated `configure` script, which depends on the existence of a few key files.
(1) the `configure.ac` file, which contains instructions for how the `configure` file will be built when the `autoconf` command is executed.  
(2) The `Makefile.in` file, which contains instructions on how executing the `configure` script will generate `Makefile` in libsrc and test subdirectories.  

The build `Makefile`s assume that environment variables (envars) will be defined that describe the compilation environment. The envars
that *must* be defined are:
  FC:      the Fortran95/2003 compiler executable,
  FCFLAGS: the flags/switches provided to the Fortran compiler,




##Building
From the top level directory (CRTM_dev/):



Feedback and Contact Information

CRTM SUPPORT EMAIL: crtm-support@googlegroups.com OR visit https://forums.jcsda.org/

```
If you have problems building the library please include the
generated "config.log" file in your email correspondence.
```






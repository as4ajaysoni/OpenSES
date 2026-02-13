#  OpenSES makefile
#  Version 4.3a - Enhanced with cross-platform build support

#  based on info in stackoverflow post about makefiles for release and debug versions
#  https://stackoverflow.com/questions/1079832/how-can-i-configure-my-makefile-for-debug-and-release-builds



FCOMP = gfortran
EXE = OpenSES

SRCS =      ACEST2.FOR  DTHTS2.FOR  FLYWHL.FOR   INPUT.FOR  LSINS.FOR  OMEGA5.FOR PINPNT.FOR   RELHUM.FOR   SIMQ2.FOR    TRINS.FOR   \
            AIR.FOR     EERROR.FOR  FORCE1.FOR   INTEXT.FOR MAXMIN.FOR OMGJ1.FOR  PRINT.FOR    RESIST.FOR   SUMARY.FOR   TRSLOP.FOR  \
            ALCHAR.FOR  EQUAT.FOR   FORCEL.FOR   JINS.FOR   MMAX.FOR   OMGJ2.FOR  RKTHRM.FOR   THDERV.FOR   VSINS.FOR    WETBLB.FOR  \
            AMPERE.FOR  CHECKI.FOR  EXTINT.FOR   GARAGE.FOR JULIE.FOR  MMIN.FOR   OMGJ3.FOR    PSI.FOR      RSTREAD.FOR  THNODE.FOR  \
            BEI.FOR     CHECKR.FOR  FCTORL.FOR   GRID.FOR   KEI.FOR    OMEGA1.FOR OMGJ4.FOR    QDERIV.FOR   RSTWRITE.FOR TORQUE.FOR  \
            BER.FOR     CREAT2.FOR  HEAT.FOR     KER.FOR    OMEGA2.FOR OMGJ5.FOR  QSQLP.FOR    SIMERR.FOR   TRAIN.FOR    WLLTM2.FOR  \
            BESSEL.FOR  CREAT3.FOR  FINS.FOR     HEATUP.FOR LATENT.FOR OMEGA3.FOR OMGJ6.FOR    QUARRK.FOR   SIMLAT.FOR   TRANST.FOR  \
            DSES.FOR    FLOWAY.FOR  HOOKUP.FOR   LOCATE.FOR OMEGA4.FOR RATES.FOR  SIMQ1.FOR    TRIDG3.FOR   FILESUBS.FOR PROGRESS.FOR       

OBJS =   $(SRCS:.FOR=.o) 
         
DBGDIR = ../builds
DBGEXE = $(DBGDIR)/$(EXE)_debug
DBGOBJS = $(addprefix $(DBGDIR)/, $(OBJS))
DBGFFLAGS = -falign-commons -Wno-align-commons -std=legacy -ggdb

RELDIR = temp_release
RELEXE = $(RELDIR)/$(EXE)
RELOBJS = $(addprefix $(RELDIR)/, $(OBJS))
RELFFLAGS = -falign-commons -Wno-align-commons -std=legacy

# High-performance release flags (new)
HPDIR = temp_high-perf
HPEXE = $(HPDIR)/$(EXE)
HPOBJS = $(addprefix $(HPDIR)/, $(OBJS))
HPFFLAGS = -falign-commons -Wno-align-commons -std=legacy -O3 -Ofast -march=native -mtune=native -ffast-math -funroll-loops -ftree-vectorize -floop-optimize

#*** General Purpose Rules ***
no_target:
	@echo \******** You did not specify a make target \********
	@echo Available Options:
	@echo   clean: 	deletes all the object and exe files in all folders
	@echo   remake:  	deletes obj and exe files then builds everything again
	@echo   prep:     creates all folders if they don't exist
	@echo   debug:    makes the debug exe file only
	@echo   release:  makes the release exe file only (original)
	@echo   high-perf: makes the high-performance exe file (maximum optimization)
	@echo   all:      makes all exe files
	@echo   win-all:  makes all Windows exe files
	@echo   win-release: makes Windows release exe file (v4.3a)
	@echo   win-high-perf: makes Windows high-performance exe file (v4.3a)


#*** Clean up and remove Object files ***
remake: clean all

clean:
	rm -f $(RELEXE) $(RELOBJS) $(DBGEXE) $(DBGOBJS) $(HPEXE) $(HPOBJS)
	rm -rf temp_release temp_high-perf debug

linux-all: prep-linux release debug high-perf

prep-linux:
	@mkdir -p $(RELDIR)

debug: debug_objects
	@mkdir -p ../builds
	gfortran -o ../builds/$(EXE)_debug debug/ACEST2.o debug/DTHTS2.o debug/FLYWHL.o debug/INPUT.o debug/LSINS.o debug/OMEGA5.o debug/PINPNT.o debug/RELHUM.o debug/SIMQ2.o debug/TRINS.o debug/AIR.o debug/EERROR.o debug/FORCE1.o debug/INTEXT.o debug/MAXMIN.o debug/OMGJ1.o debug/PRINT.o debug/RESIST.o debug/SUMARY.o debug/TRSLOP.o debug/ALCHAR.o debug/EQUAT.o debug/FORCEL.o debug/JINS.o debug/MMAX.o debug/OMGJ2.o debug/RKTHRM.o debug/THDERV.o debug/VSINS.o debug/WETBLB.o debug/AMPERE.o debug/CHECKI.o debug/EXTINT.o debug/GARAGE.o debug/JULIE.o debug/MMIN.o debug/OMGJ3.o debug/PSI.o debug/RSTREAD.o debug/THNODE.o debug/BEI.o debug/CHECKR.o debug/FCTORL.o debug/GRID.o debug/KEI.o debug/OMEGA1.o debug/OMGJ4.o debug/QDERIV.o debug/RSTWRITE.o debug/TORQUE.o debug/BER.o debug/CREAT2.o debug/HEAT.o debug/KER.o debug/OMEGA2.o debug/OMGJ5.o debug/QSQLP.o debug/SIMERR.o debug/TRAIN.o debug/WLLTM2.o debug/BESSEL.o debug/CREAT3.o debug/FINS.o debug/HEATUP.o debug/LATENT.o debug/OMEGA3.o debug/OMGJ6.o debug/QUARRK.o debug/SIMLAT.o debug/TRANST.o debug/DSES.o debug/FLOWAY.o debug/HOOKUP.o debug/LOCATE.o debug/OMEGA4.o debug/RATES.o debug/SIMQ1.o debug/TRIDG3.o debug/FILESUBS.o -static

$(DBGEXE): $(DBGOBJS)
	@mkdir -p $(DBGDIR)
	$(FCOMP) -o $(DBGEXE) $(DBGOBJS) -static

debug_objects:
	@mkdir -p debug
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c ACEST2.FOR -o debug/ACEST2.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c DTHTS2.FOR -o debug/DTHTS2.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c FLYWHL.FOR -o debug/FLYWHL.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c INPUT.FOR -o debug/INPUT.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c LSINS.FOR -o debug/LSINS.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c OMEGA5.FOR -o debug/OMEGA5.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c PINPNT.FOR -o debug/PINPNT.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c RELHUM.FOR -o debug/RELHUM.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c SIMQ2.FOR -o debug/SIMQ2.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c TRINS.FOR -o debug/TRINS.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c AIR.FOR -o debug/AIR.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c EERROR.FOR -o debug/EERROR.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c FORCE1.FOR -o debug/FORCE1.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c INTEXT.FOR -o debug/INTEXT.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c MAXMIN.FOR -o debug/MAXMIN.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c OMGJ1.FOR -o debug/OMGJ1.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c PRINT.FOR -o debug/PRINT.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c RESIST.FOR -o debug/RESIST.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c SUMARY.FOR -o debug/SUMARY.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c TRSLOP.FOR -o debug/TRSLOP.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c ALCHAR.FOR -o debug/ALCHAR.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c EQUAT.FOR -o debug/EQUAT.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c FORCEL.FOR -o debug/FORCEL.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c JINS.FOR -o debug/JINS.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c MMAX.FOR -o debug/MMAX.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c OMGJ2.FOR -o debug/OMGJ2.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c RKTHRM.FOR -o debug/RKTHRM.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c THDERV.FOR -o debug/THDERV.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c VSINS.FOR -o debug/VSINS.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c WETBLB.FOR -o debug/WETBLB.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c AMPERE.FOR -o debug/AMPERE.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c CHECKI.FOR -o debug/CHECKI.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c EXTINT.FOR -o debug/EXTINT.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c GARAGE.FOR -o debug/GARAGE.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c JULIE.FOR -o debug/JULIE.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c MMIN.FOR -o debug/MMIN.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c OMGJ3.FOR -o debug/OMGJ3.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c PSI.FOR -o debug/PSI.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c RSTREAD.FOR -o debug/RSTREAD.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c THNODE.FOR -o debug/THNODE.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c BEI.FOR -o debug/BEI.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c CHECKR.FOR -o debug/CHECKR.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c FCTORL.FOR -o debug/FCTORL.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c GRID.FOR -o debug/GRID.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c KEI.FOR -o debug/KEI.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c OMEGA1.FOR -o debug/OMEGA1.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c OMGJ4.FOR -o debug/OMGJ4.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c QDERIV.FOR -o debug/QDERIV.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c RSTWRITE.FOR -o debug/RSTWRITE.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c TORQUE.FOR -o debug/TORQUE.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c BER.FOR -o debug/BER.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c CREAT2.FOR -o debug/CREAT2.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c HEAT.FOR -o debug/HEAT.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c KER.FOR -o debug/KER.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c OMEGA2.FOR -o debug/OMEGA2.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c OMGJ5.FOR -o debug/OMGJ5.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c QSQLP.FOR -o debug/QSQLP.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c SIMERR.FOR -o debug/SIMERR.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c TRAIN.FOR -o debug/TRAIN.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c WLLTM2.FOR -o debug/WLLTM2.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c BESSEL.FOR -o debug/BESSEL.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c CREAT3.FOR -o debug/CREAT3.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c FINS.FOR -o debug/FINS.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c HEATUP.FOR -o debug/HEATUP.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c LATENT.FOR -o debug/LATENT.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c OMEGA3.FOR -o debug/OMEGA3.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c OMGJ6.FOR -o debug/OMGJ6.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c QUARRK.FOR -o debug/QUARRK.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c SIMLAT.FOR -o debug/SIMLAT.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c TRANST.FOR -o debug/TRANST.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c DSES.FOR -o debug/DSES.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c FLOWAY.FOR -o debug/FLOWAY.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c HOOKUP.FOR -o debug/HOOKUP.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c LOCATE.FOR -o debug/LOCATE.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c OMEGA4.FOR -o debug/OMEGA4.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c RATES.FOR -o debug/RATES.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c SIMQ1.FOR -o debug/SIMQ1.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c TRIDG3.FOR -o debug/TRIDG3.o
	gfortran -falign-commons -Wno-align-commons -std=legacy -ggdb -c FILESUBS.FOR -o debug/FILESUBS.o

$(DBGDIR)/%.o: %.FOR
	$(FCOMP) $(DBGFFLAGS) -c $< -o $@

release: $(RELEXE)
	@mkdir -p ../builds
	$(FCOMP) -o ../builds/$(EXE)_v4.3a_standard $(RELOBJS) -static

$(RELEXE): $(RELOBJS)
	@mkdir -p $(RELDIR)
	$(FCOMP) -o $(RELEXE) $(RELOBJS) -static

$(RELDIR)/%.o: %.FOR
	$(FCOMP) $(RELFFLAGS) -c $< -o $@

high-perf: $(HPEXE)
	@mkdir -p ../builds
	$(FCOMP) -o ../builds/$(EXE)_v4.3a_highperf $(HPOBJS) -static

$(HPEXE): $(HPOBJS)
	@mkdir -p $(HPDIR)
	$(FCOMP) -o $(HPEXE) $(HPOBJS) -static

$(HPDIR)/%.o: %.FOR
	$(FCOMP) $(HPFFLAGS) -c $< -o $@

# Windows cross-compilation targets
MINGW_FCOMP = x86_64-w64-mingw32-gfortran
WINRELDIR = ../builds
WINRELEXE = $(WINRELDIR)/$(EXE)_v4.3a_standard.exe
WINENHANCEDDIR = ../builds
WINENHANCEDEXE = $(WINENHANCEDDIR)/$(EXE)_v4.2.exe

WINHPDIR = ../builds
WINHPEXE = $(WINHPDIR)/$(EXE)_v4.3a_highperf.exe

win-all: win-release win-high-perf

win-release: prep-win $(WINRELEXE)

win-enhanced: 
	./build_windows_enhanced.sh

prep-win:
	@mkdir -p $(WINRELDIR)

$(WINRELEXE): $(addprefix $(WINRELDIR)/,$(SRCS:.FOR=.o))
	$(MINGW_FCOMP) -o $@ $^ -static

$(WINRELDIR)/%.o: %.FOR
	@mkdir -p $(WINRELDIR)
	$(MINGW_FCOMP) $(RELFFLAGS) -c $< -o $@

# Windows high-performance target
win-high-perf: prep-win-hp $(WINHPEXE)

$(WINHPEXE): $(addprefix $(WINHPDIR)/,$(SRCS:.FOR=.o))
	$(MINGW_FCOMP) -o $@ $^ -static

$(WINHPDIR)/%.o: %.FOR
	@mkdir -p $(WINHPDIR)
	$(MINGW_FCOMP) $(HPFFLAGS) -c $< -o $@

# Windows enhanced target (existing)
win-enhanced:
	./build_windows_enhanced.sh

prep-win:
	@mkdir -p $(WINRELDIR)

prep-win-hp:
	@mkdir -p $(WINHPDIR)





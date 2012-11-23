#CXX = /usr/bin/g++  #version 3.4.6
#CXX = /usr/bin/g++4 #version 4.1.0
CXX = g++

CXXFLAGS = -g -O -Wall -D_FILE_OFFSET_BITS=64

INCLUDEDIR = -I/local/data/labcal/include

LIBDIR = -L/local/data/labcal/lib -L/usr/X11R6/lib

LIBS = -lpthread -lfltk -lfltk_gl -lX11 -lGL -lm -lXext -ldl -lfftw3

LINKER = -Wl,-rpath /usr/local/lib


OBJS = XCALDAQServer.o DAQPipe.o PLSOutput.o StreamChannel.o Client.o xcaldaq_client.o ClientGUI.o XOUT.o FFTChannel.o plotWindow.o XPulseRec.o LJHOutput.o PRDisplay.o Cartesian.o PulseAnalysisDisplay.o LANLOutput.o FFTOutput.o gsd_error.o misc_utils.o string_utils.o  client_trigger_state.o client_gui_menus.o client_mixing_state.o
 
COBJS = uici.o uiciname.o 

.SUFFIXES: .cpp .cxx
.cpp.o:
	$(CXX) $(CXXFLAGS) $(INCLUDEDIR) -g  -c $<

TARGET = xcaldaq_client
SOURCE = riff
REMOTE_PATH = ~king/development/
USER = labcal


###############################################################
default: client

client: $(OBJS) $(COBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS) $(COBJS) $(LIBDIR) $(LIBS) $(LINKER)
	$(CXX) -dumpversion	

clean:
	rm -f *~ *.o core *# $(TARGET)
	rm -f -r $(TARGET).build
	rm -f -r $(TARGET).xcodeproj
	rm -f -r build
	rm -f gmon*
	rm -f .DS_Store

update:
	cp makefile.linux makefile.old
	cp makefile makefile.linux
	scp -r $(USER)@$(SOURCE):$(REMOTE_PATH)/$(TARGET) ../.
	cp makefile makefile.mac
	cp makefile.linux makefile
	make clean

tar:
	make clean
	rm -f $(TARGET).tar.gz
	tar -czf $(TARGET).tar.gz *.c *.cpp *.h *.cfg makefile
	tar --list -zf $(TARGET).tar.gz
	scp $(TARGET).tar.gz $(USER)@$(SOURCE):~$(USER)/Desktop	


install:
	cp $(TARGET) $(SLOCAL)/bin

deps:
	$(CXX) -MM *.cc *.cpp $(INCPATH) > makefile.deps


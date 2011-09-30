
CC=gcc

NETSNMPCONFIG=net-snmp-config

# uncomment this if you have GNU make
NETSNMPCFLAGS := $(shell $(NETSNMPCONFIG) --base-cflags)
NETSNMPLIBS := $(shell $(NETSNMPCONFIG) --agent-libs)
#NETSNMPCFLAGS=`$(NETSNMPCONFIG) --base-cflags`
#NETSNMPLIBS=`$(NETSNMPCONFIG) --agent-libs`

LIBS=$(NETSNMPLIBS)

DLFLAGS=-fPIC -shared
STRICT_FLAGS = -Wall -Wstrict-prototypes #-DPATH_MDSTAT=\"/tmp/mdstat\"
CFLAGS=-I. $(NETSNMPCFLAGS) $(STRICT_FLAGS) $(DLFLAGS)


SRCS=swRaidMIB.c swRaidMIB_access.c
OBJS=swRaidMIB.o swRaidMIB_access.o
TARGETS=swRaidPlugin.so

.SUFFIXES:
.SUFFIXES: .c .o .deps


all: $(TARGETS)

swRaidPlugin.so:	$(OBJS)
	$(CC) $(CFLAGS) -o swRaidPlugin.so $(OBJS)

clean:
	rm -f $(OBJS) $(TARGETS)


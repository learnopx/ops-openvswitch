if OPS
bin_PROGRAMS += \
	utilities/ovs-appctl \
	utilities/ovs-vsctl
else
bin_PROGRAMS += \
	utilities/ovs-appctl \
	utilities/ovs-testcontroller \
	utilities/ovs-dpctl \
	utilities/ovs-ofctl \
	utilities/ovs-vsctl
endif
bin_SCRIPTS += utilities/ovs-docker \
	utilities/ovs-pki
if HAVE_PYTHON
bin_SCRIPTS += \
	utilities/ovs-dpctl-top \
	utilities/ovs-l3ping \
	utilities/ovs-parse-backtrace \
	utilities/ovs-pcap \
	utilities/ovs-tcpundump \
	utilities/ovs-test \
	utilities/ovs-vlan-test
endif
scripts_SCRIPTS += \
	utilities/ovs-check-dead-ifs \
	utilities/ovs-ctl \
	utilities/ovs-save
scripts_DATA += utilities/ovs-lib

completion_SCRIPTS += \
	utilities/ovs-appctl-bashcomp.bash \
	utilities/ovs-vsctl-bashcomp.bash

check_SCRIPTS += \
	utilities/ovs-appctl-bashcomp.bash \
	utilities/ovs-vsctl-bashcomp.bash

EXTRA_DIST += utilities/ovs-sim.in utilities/ovs-sim.1.xml
noinst_man_MANS += utilities/ovs-sim.1
noinst_SCRIPTS += utilities/ovs-sim

utilities/ovs-lib: $(top_builddir)/config.status

docs += utilities/ovs-command-bashcomp.INSTALL.md
EXTRA_DIST += \
	utilities/ovs-appctl-bashcomp.bash \
	utilities/ovs-check-dead-ifs.in \
	utilities/ovs-command-bashcomp.INSTALL.md \
	utilities/ovs-ctl.in \
	utilities/ovs-dev.py \
	utilities/ovs-docker \
	utilities/ovs-dpctl-top.in \
	utilities/ovs-l3ping.in \
	utilities/ovs-lib.in \
	utilities/ovs-parse-backtrace.in \
	utilities/ovs-pcap.in \
	utilities/ovs-pipegen.py \
	utilities/ovs-pki.in \
	utilities/ovs-save \
	utilities/ovs-tcpundump.in \
	utilities/ovs-test.in \
	utilities/ovs-vlan-test.in \
	utilities/ovs-vsctl-bashcomp.bash \
	utilities/qemu-wrap.py
MAN_ROOTS += \
	utilities/ovs-appctl.8.in \
	utilities/ovs-benchmark.1.in \
	utilities/ovs-testcontroller.8.in \
	utilities/ovs-ctl.8 \
	utilities/ovs-dpctl.8.in \
	utilities/ovs-dpctl-top.8.in \
	utilities/ovs-l3ping.8.in \
	utilities/ovs-ofctl.8.in \
	utilities/ovs-parse-backtrace.8 \
	utilities/ovs-pcap.1.in \
	utilities/ovs-pki.8.in \
	utilities/ovs-tcpundump.1.in \
	utilities/ovs-vlan-bug-workaround.8.in \
	utilities/ovs-test.8.in \
	utilities/ovs-vlan-test.8.in \
	utilities/ovs-vsctl.8.in
MAN_FRAGMENTS += utilities/ovs-vlan-bugs.man
DISTCLEANFILES += \
	utilities/ovs-appctl.8 \
	utilities/ovs-ctl \
	utilities/ovs-benchmark.1 \
	utilities/ovs-check-dead-ifs \
	utilities/ovs-testcontroller.8 \
	utilities/ovs-dpctl.8 \
	utilities/ovs-dpctl-top \
	utilities/ovs-dpctl-top.8 \
	utilities/ovs-l3ping \
	utilities/ovs-l3ping.8 \
	utilities/ovs-lib \
	utilities/ovs-ofctl.8 \
	utilities/ovs-parse-backtrace \
	utilities/ovs-pcap \
	utilities/ovs-pcap.1 \
	utilities/ovs-pki \
	utilities/ovs-pki.8 \
	utilities/ovs-sim \
	utilities/ovs-sim.1 \
	utilities/ovs-tcpundump \
	utilities/ovs-tcpundump.1 \
	utilities/ovs-test \
	utilities/ovs-test.8 \
	utilities/ovs-vlan-test \
	utilities/ovs-vlan-test.8 \
	utilities/ovs-vlan-bug-workaround.8 \
	utilities/ovs-vsctl.8

man_MANS += \
	utilities/ovs-appctl.8 \
	utilities/ovs-benchmark.1 \
	utilities/ovs-ctl.8 \
	utilities/ovs-testcontroller.8 \
	utilities/ovs-dpctl.8 \
	utilities/ovs-dpctl-top.8 \
	utilities/ovs-l3ping.8 \
	utilities/ovs-ofctl.8 \
	utilities/ovs-parse-backtrace.8 \
	utilities/ovs-pcap.1 \
	utilities/ovs-pki.8 \
	utilities/ovs-tcpundump.1 \
	utilities/ovs-vlan-bug-workaround.8 \
	utilities/ovs-test.8 \
	utilities/ovs-vlan-test.8 \
	utilities/ovs-vsctl.8

utilities_ovs_appctl_SOURCES = utilities/ovs-appctl.c
utilities_ovs_appctl_LDADD = lib/libovscommon.la ovsdb/libovsdb.la

if !OPS
utilities_ovs_testcontroller_SOURCES = utilities/ovs-testcontroller.c
utilities_ovs_testcontroller_LDADD = lib/libovscommon.la ovsdb/libovsdb.la lib/libopenvswitch.la $(SSL_LIBS)

utilities_ovs_dpctl_SOURCES = utilities/ovs-dpctl.c
utilities_ovs_dpctl_LDADD = lib/libovscommon.la ovsdb/libovsdb.la lib/libopenvswitch.la

utilities_ovs_ofctl_SOURCES = utilities/ovs-ofctl.c
utilities_ovs_ofctl_LDADD = \
	ofproto/libofproto.la \
	lib/libovscommon.la \
	ovsdb/libovsdb.la \
	lib/libopenvswitch.la
endif

utilities_ovs_vsctl_SOURCES = utilities/ovs-vsctl.c
utilities_ovs_vsctl_LDADD = lib/libovscommon.la ovsdb/libovsdb.la

if LINUX
sbin_PROGRAMS += utilities/ovs-vlan-bug-workaround
utilities_ovs_vlan_bug_workaround_SOURCES = utilities/ovs-vlan-bug-workaround.c
utilities_ovs_vlan_bug_workaround_LDADD = lib/libovscommon.la ovsdb/libovsdb.la

noinst_PROGRAMS += utilities/nlmon
utilities_nlmon_SOURCES = utilities/nlmon.c
utilities_nlmon_LDADD = lib/libovscommon.la ovsdb/libovsdb.la lib/libopenvswitch.la
endif

bin_PROGRAMS += utilities/ovs-benchmark
utilities_ovs_benchmark_SOURCES = utilities/ovs-benchmark.c
utilities_ovs_benchmark_LDADD = lib/libovscommon.la ovsdb/libovsdb.la

if !OPS
FLAKE8_PYFILES += utilities/ovs-pcap.in
endif

include utilities/bugtool/automake.mk
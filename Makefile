WORKDIR=./build/bsc
SRCDIR=./src_bluespec
MISSINGLIB=$(shell locate libstdc++.so.6 | head -n 1)
BUILDFLAGS=-bdir $(WORKDIR) -simdir $(WORKDIR)

build_tb :
	mkdir -p $(WORKDIR)
	bsc $(BUILDFLAGS) -sim -g mkTb $(SRCDIR)/Tb.bsv 
	bsc $(BUILDFLAGS) -o $(WORKDIR)/tb_simrun -sim -e mkTb

run-sim : build_tb 
	cp -f $(MISSINGLIB) $(WORKDIR)
	cd $(WORKDIR) && ./tb_simrun 

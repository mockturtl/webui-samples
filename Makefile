pkg_root=packages/
src=src/
target=target/
ext=_bootstrap.dart
build_ext=.html$(ext)
cmd=web_ui/dwc.dart
files=hello binding watcher conditional table-if loops tictac events
views=views/

default: fix
	
.PHONY: default clean all check

all: $(files)

%: %.html 
	@dart --package-root=$(pkg_root) $(pkg_root)$(cmd) --out $(target) $<

# FIXME
2js: hello
	@dart2js $(target)$<$(build_ext) -o$(target)$<$(build_ext).js

check:
	@grep -nrq --color=auto import $(target)/*$(ext)

fix: all check
	@sed -i -r s%import\ \'%import\ \'$(src)% $(target)/*$(ext)

clean:
	@-rm -rf $(target)

pkg_root=packages/
src=src/
target=target/
build_ext=.html_bootstrap.dart
cmd=web_ui/dwc.dart
files=hello binding watcher conditional table-if loops tictac events
views=views/

default: all
	
.PHONY: default clean all check

all: $(files)

#$(src)%.dart

%: %.html 
	@dart --package-root=$(pkg_root) $(pkg_root)$(cmd) --out $(target) $<

# FIXME
2js: hello
	@dart2js $(target)$<$(build_ext) -o$(target)$<$(build_ext).js

check:
	@grep -nr --color=auto import target/*_bootstrap.dart

fix: all check
	@sed -i -r s%import\ \'%import\ \'src/% target/*_bootstrap.dart

clean:
	@-rm -rf $(target)

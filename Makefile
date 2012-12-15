pkg_root=packages/
target=target/
build_ext=.html_bootstrap.dart
cmd=web_ui/dwc.dart
files=hello binding watcher conditional table-if loops tictac events
views=views/

default: all
	
.PHONY: default clean all

all: $(files)

%: %.html
	@dart --package-root=$(pkg_root) $(pkg_root)$(cmd) --out $(target) $<

# FIXME
2js: hello
	@dart2js $(target)$<$(build_ext) -o$(target)$<$(build_ext).js

clean:
	@-rm -rf $(target)

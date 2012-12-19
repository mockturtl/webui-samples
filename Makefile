pkg_root=packages/
src=src/
target=target/
ext=_bootstrap.dart
build_ext=.html$(ext)
cmd=web_ui/dwc.dart
views=views/
open=dartium
files=hello \
	binding \
	watcher \
	conditional \
	tableif \
	loops \
	tictac \
	events \
	countcomponent \
	redbox

default: fix
	
.PHONY: default clean cleanlocal all check fix test

all: $(files)

countcomponent: countcomponent.html clickcounter.html
	@dart --package-root=$(pkg_root) $(pkg_root)$(cmd) --out $(target) $<

redbox: redbox.html redboxelement.html
	@dart --package-root=$(pkg_root) $(pkg_root)$(cmd) --out $(target) $<

%.html::
	@cp $(views)$@ .

%: %.html 
	@dart --package-root=$(pkg_root) $(pkg_root)$(cmd) --out $(target) $<

# FIXME
2js: hello
	@dart2js $(target)$<$(build_ext) -o$(target)$<$(build_ext).js

check:
	@echo "\nWill fix generated imports:\n"
	grep -nr --color=auto import $(target)*$(ext)

fix: all check
	@echo "\nPrepending 'src/' in generated imports..."
	sed -i -r s!import\ \'!import\ \'$(src)! $(target)*$(ext)
	@echo "...Done.\n"

localclean:
	@-rm -rf *.html

clean: localclean
	@-rm -rf $(target)

test:
	@$(open) $(target)/*.html

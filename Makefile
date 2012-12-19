pkg_root=packages
src=src
out=target
views=views

ext=_bootstrap.dart
gen_ext=.html$(ext)

cmd=$(pkg_root)/web_ui/dwc.dart
open=dartium
compile=dart --package-root=$(pkg_root)/ $(cmd) --out $(out)/
dart2js=dart2js -c

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
	
.PHONY: all clean localclean check fix test 2js

all: $(files)

countcomponent: countcomponent.html clickcounter.html
	@$(compile) $<

redbox: redbox.html redboxelement.html
	@$(compile) $<

%.html::
	@cp $(views)/$@ .

%: %.html 
	@$(compile) $<

2js: fix
	@for file in $(files) ; do \
		file=$(out)/$$file$(gen_ext) ; \
		$(dart2js) $$file -o$$file.js ; \
	done

check:
	@echo "\nWill fix generated imports:\n"
	grep -nr --color=auto import $(out)/*$(ext)

fix: all check
	@echo "\nPrepending 'src/' in generated imports..."
	sed -i -r s!import\ \'!import\ \'$(src)/! $(out)/*$(ext)
	@echo "...Done.\n"

localclean:
	@-rm -rf *.html

clean: localclean
	@-rm -rf $(out)/

test:
	@$(open) $(out)/*.html

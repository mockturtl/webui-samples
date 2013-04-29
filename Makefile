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

default: all
	
.PHONY: all clean localclean test 2js

all: $(files)

countcomponent: countcomponent.html clickcounter.html
	@$(compile) $<

redbox: redbox.html redboxelement.html
	@$(compile) $<

%.html::
	@cp $(views)/$@ .

%: %.html 
	@$(compile) $<

2js: 
	@for file in $(files) ; do \
		file=$(out)/$$file$(gen_ext) ; \
		$(dart2js) $$file -o$$file.js ; \
	done

localclean:
	@-rm -rf *.html

clean: localclean
	@-rm -rf $(out)/

test:
	@$(open) $(out)/*.html

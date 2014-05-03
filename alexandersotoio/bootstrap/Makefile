BOOTSTRAP_LESS = ./less/bootstrap.less
DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔\033[39m
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#

#
# MAKE BOOTSTRAP FILES
#
build:
	@mkdir -p build
	./node_modules/.bin/lessc ${BOOTSTRAP_LESS}  > build/bootstrap.css
	./node_modules/.bin/lessc ${BOOTSTRAP_LESS} --compress > build/bootstrap.min.css
	@echo "Successfully built bootstrap! 	${CHECK}"

clean:
	rm build/bootstrap*

.PHONY: build clean

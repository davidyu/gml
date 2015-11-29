.PHONY: folders lib test
SHELL = /bin/bash
DOC=doc

ts-doc:
	git checkout -b gh-pages
	typedoc --readme none --mode file --target ES5 --out $(DOC)/ts ts/src 

.PHONY: ts-doc
SHELL = /bin/bash
DOC=doc

ts-doc:
	typedoc --readme none --mode file --target ES5 --out $(DOC)/ts ts/src 

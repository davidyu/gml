.PHONY: ts-doc hx-doc
SHELL = /bin/bash
DOC=doc

ts-doc:
	typedoc --readme none --mode file --name gml --target ES5 --out $(DOC)/ts ts/src --exclude **/gml.ts

hx-doc:
	pushd hx && haxe doc.hxml && popd
	haxelib run dox -i hx -in gml -o doc/hx

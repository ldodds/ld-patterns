STYLESHEETS_DIR = /usr/share/xml/docbook/stylesheet/docbook-xsl

all: html pdf chunk epub

chunk:
	xsltproc --stringparam chunk.first.sections "1" --stringparam use.id.as.filename "1" --stringparam toc.section.depth "1" -o index.html $(STYLESHEETS_DIR)/xhtml/chunk.xsl linked-data-patterns.xml

html:
	xsltproc --stringparam toc.section.depth "1" -o index-full.html $(STYLESHEETS_DIR)/xhtml/docbook.xsl linked-data-patterns.xml

fo:
	xsltproc --stringparam toc.section.depth "1" -o linked-data-patterns.fo $(STYLESHEETS_DIR)/fo/docbook.xsl linked-data-patterns.xml

pdf: fo
	fop -pdf linked-data-patterns.pdf -fo linked-data-patterns.fo

epub:
	dbtoepub linked-data-patterns.xml

clean:
	rm -rf *.html linked-data-patterns.fo linked-data-patterns.pdf

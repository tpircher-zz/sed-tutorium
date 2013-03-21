ADS = 0

version = $(shell sed -ne '/<!ENTITY docversion ".*">/s/.*docversion *"\([0-9]*\.[^ ,]*\)".*/\1/p' sed-tutorium.xml)
tarball = sed-tutorium-$(version).tar.gz
cssfile = style.css
htmlsty = parameters-html.xsl
chunksty= parameters-chunked-html.xsl
outdir  = out

all: html html-nochunks #pdf

html: $(outdir)/index.html $(outdir)/$(cssfile)
html-nochunks: $(outdir)/sed-tutorium.html $(outdir)/$(cssfile)
pdf: $(outdir)/sed-tutorium.pdf

$(outdir)/sed-tutorium.html: sed-tutorium.xml $(htmlsty)
	xsltproc --stringparam google_ad.enable "$(ADS)" -o $@ $(htmlsty) $<
	#saxon-xslt -o $@ $< $(htmlsty) google_ad.enable="$(ADS)"

$(outdir)/index.html: sed-tutorium.xml $(chunksty)
	xsltproc --stringparam google_ad.enable "$(ADS)" -o $@ $(chunksty) $<
	#saxon-xslt $< $(chunksty) google_ad.enable="$(ADS)" base.dir="out/"

$(outdir)/sed-tutorium.pdf: sed-tutorium.xml
	#xsltproc -o $(outdir)/sed-tutorium.fo parameters-fo.xsl $^
	saxon-xslt -o $(outdir)/sed-tutorium.fo $^ parameters-fo.xsl
	fop -fo $(outdir)/sed-tutorium.fo -pdf $(outdir)/sed-tutorium.pdf
	$(RM) $(outdir)/sed-tutorium.fo

$(outdir)/$(cssfile): $(cssfile)
	cp $^ $@

clean:
	rm -f $(tarball) $(tarball).gz
	rm -rf $(outdir)

$(tarball):
	tar cvzf $(tarball) -C .. --exclude $(tarball) --exclude attic --exclude CVS --exclude .svn --exclude en_* sed-tutorium

.PHONY: dist
dist: all src-dist

.PHONY: src-dist
src-dist: clean $(tarball)

xslhtml = parameters-html.xsl
xslchnk = parameters-chunked-html.xsl
xslepub = parameters-epub.xsl
xslfo   = parameters-fo.xsl
outdir  = out
src     = sed-tutorium.xml

all: html chnk epub pdf

html: $(outdir) $(outdir)/sed-tutorium.html
chnk: $(outdir) $(outdir)/index.html
epub: $(outdir) $(outdir)/sed-tutorium.epub
pdf:  $(outdir) $(outdir)/sed-tutorium.pdf

$(outdir):
	mkdir -p $(outdir)

$(outdir)/$(src:.xml=.html): $(src) $(xslhtml)
	saxon-xslt -o $@ $< $(xslhtml) base.dir="$(outdir)/"

$(outdir)/index.html: $(src) $(xslhtml)
	saxon-xslt $< $(xslchnk) base.dir="$(outdir)/"

$(outdir)/$(src:.xml=.epub): $(src) $(xslepub)
	saxon-xslt $< $(xslepub) base.dir="ebook1/OEBPS/"
	cd ebook1 && zip -qX0  $(abspath $@) mimetype
	cd ebook1 && zip -qX9r $(abspath $@) META-INF OEBPS
	$(RM) -r ebook1

.INTERMEDIATE: $(outdir)/$(src:.xml=.fo)
$(outdir)/$(src:.xml=.fo): $(src) $(xslfo)
	saxon-xslt -o $(outdir)/$(src:.xml=.fo) $< $(xslfo)

$(outdir)/$(src:.xml=.pdf): $(outdir)/$(src:.xml=.fo)
	fop -fo $(outdir)/sed-tutorium.fo -pdf $(outdir)/sed-tutorium.pdf

clean:
	rm -rf $(outdir) ebook1

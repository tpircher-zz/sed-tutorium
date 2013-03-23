cssfile = style.css
xslhtml = parameters-html.xsl
xslchnk = parameters-chunked-html.xsl
xslepub = parameters-epub.xsl
xslfo   = parameters-fo.xsl
outdir  = out
src	= sed-tutorium.xml

all: html chnk epub

html: $(outdir) $(outdir)/sed-tutorium.html $(outdir)/$(cssfile)
chnk: $(outdir) $(outdir)/index.html $(outdir)/$(cssfile)
epub: $(outdir) $(outdir)/sed-tutorium.epub
pdf:  $(outdir) $(outdir)/sed-tutorium.pdf

$(outdir):
	mkdir -p $(outdir)

$(outdir)/$(src:.xml=.html): $(src) $(xslhtml)
	saxon-xslt -o $@ $< $(xslhtml)

$(outdir)/index.html: $(src) $(xslhtml)
	saxon-xslt $< $(xslchnk) base.dir="out/"

$(outdir)/$(src:.xml=.epub): $(src) $(xslepub)
	saxon-xslt $< $(xslepub)
	#xsltproc $(xslepub) $<
	echo "application/epub+zip" > mimetype
	zip -q0Xq  $@ mimetype
	zip -qXr9D $@ META-INF OEBPS
	$(RM) -r META-INF OEBPS mimetype

.INTERMEDIATE: $(outdir)/$(src:.xml=.fo)
$(outdir)/$(src:.xml=.fo): $(src) $(xslfo)
	saxon-xslt -o $(outdir)/$(src:.xml=.fo) $< $(xslfo)

$(outdir)/$(src:.xml=.pdf): $(outdir)/$(src:.xml=.fo)
	fop -fo $(outdir)/sed-tutorium.fo -pdf $(outdir)/sed-tutorium.pdf

$(outdir)/$(cssfile): $(cssfile)
	cp $^ $@

clean:
	rm -rf $(outdir) mimetype META-INF OEBPS

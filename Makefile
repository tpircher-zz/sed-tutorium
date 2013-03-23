cssfile = style.css
xslhtml = parameters-html.xsl
xslchnk = parameters-chunked-html.xsl
xslfo   = parameters-fo.xsl
outdir  = out

all: html chnk

html: $(outdir)/sed-tutorium.html $(outdir)/$(cssfile)
chnk: $(outdir)/index.html $(outdir)/$(cssfile)
pdf: $(outdir)/sed-tutorium.pdf

$(outdir)/sed-tutorium.html: sed-tutorium.xml $(xslhtml)
	saxon-xslt -o $@ $< $(xslhtml)

$(outdir)/index.html: sed-tutorium.xml $(xslhtml)
	saxon-xslt $< $(xslchnk) base.dir="out/"

$(outdir)/sed-tutorium.pdf: sed-tutorium.xml $(xslfo)
	saxon-xslt -o $(outdir)/sed-tutorium.fo $^ $(xslfo)
	fop -fo $(outdir)/sed-tutorium.fo -pdf $(outdir)/sed-tutorium.pdf
	$(RM) $(outdir)/sed-tutorium.fo

$(outdir)/$(cssfile): $(cssfile)
	cp $^ $@

clean:
	rm -rf $(outdir)

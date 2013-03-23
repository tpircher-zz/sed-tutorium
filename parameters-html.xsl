<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="file:///usr/share/xml/docbook/stylesheet/docbook-xsl/html/docbook.xsl"/>

<xsl:output encoding="UTF-8" indent="no" standalone="no" method="html"/>
<xsl:param name="chapter.autolabel"     select="1"/>
<xsl:param name="section.autolabel"     select="0"/>
<xsl:param name="appendix.autolabel"    select="1"/>
<xsl:param name="generate.toc"          select="'book toc'"/>
<xsl:param name="xref.with.number.and.title"    select="0"/>
<!--
<xsl:param name="toc.section.depth"     select="4"/>
<xsl:param name="toc.max.depth"         select="4"/>
<xsl:param name="bridgehead.in.toc"     select="1"/>
-->
<xsl:param name="use.id.as.filename"    select="1"/>
<xsl:param name="html.stylesheet"       select="'style.css'"/>
<xsl:param name="html.cleanup"          select="1"/>
<xsl:param name="make.valid.html"       select="1"/>

</xsl:stylesheet>

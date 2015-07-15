<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="file:///usr/share/xml/docbook/stylesheet/docbook-xsl-ns/fo/docbook.xsl"/>

<xsl:param name="paper.type"            select="'A4'"/>
<xsl:param name="fop1.extensions"       select="1"/>
<xsl:param name="shade.verbatim"        select="1"/>
<xsl:param name="section.autolabel"     select="0"/>
<xsl:param name="appendix.autolabel"    select="0"/>
<xsl:param name="generate.toc"          select="'book toc'"/>
<xsl:param name="toc.section.depth"     select="2"/>
<xsl:param name="toc.max.depth"         select="2"/>
<xsl:param name="bridgehead.in.toc"     select="1"/>
<xsl:param name="column.count.index"    select="2"/>
<!--
<xsl:param name="olink.doctitle"        select="yes"/>
-->
<xsl:attribute-set name="monospace.verbatim.properties">
    <xsl:attribute name="font-size">9pt</xsl:attribute>
</xsl:attribute-set>
</xsl:stylesheet>

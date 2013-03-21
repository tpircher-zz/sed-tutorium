<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="/usr/share/xml/docbook/stylesheet/docbook-xsl/xhtml/docbook.xsl"/>
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

<!-- enable or disable Google Ads here -->
<xsl:param name="google_ad.enable"      select="1"/>

<xsl:template name="google_ad.content">
    <script type="text/javascript">
        <xsl:text disable-output-escaping="yes"><![CDATA[/* <![CDATA[ */
            google_ad_client = "ca-pub-8680457035503198";
            /* Home page, 728x90, created 17/11/07 */
            google_ad_slot = "2648065618";
            google_ad_width = 728;
            google_ad_height = 90;
        ]]>/* ]]&gt; */</xsl:text>
    </script>
    <script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js" />
</xsl:template>

<xsl:template name="user.header.content">
    <xsl:if test="$google_ad.enable != '0'">
        <xsl:call-template name="google_ad.content"/>
        <hr/>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
    <xsl:output method="text"/>
    <xsl:output method="html" encoding="utf-8" indent="yes" name="html" />

    <xsl:template match="/">
        <xsl:for-each select="SHOPITEM">
            <xsl:variable name="filename"
                          select="concat('output1/',@id,'.html')" />
            <xsl:value-of select="$filename" />  <!-- Creating  -->
            <xsl:result-document href="{$filename}" format="html">
                <html><body>
                    <xsl:value-of select="@id"/>
                </body></html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

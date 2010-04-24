<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>

<xsl:template match="/">
	<xsl:apply-templates select="/rss/channel/item"/>
</xsl:template>

<!-- write out comma separated file -->
<xsl:template match="/rss/channel/item">
   TITLE:<xsl:value-of select="title"/>
   <xsl:value-of select="'&#10;'"/>
   LINK:<xsl:value-of select="link"/>
   <xsl:value-of select="'&#10;'"/>
   DESCRIPTION:<xsl:value-of select="description"/>
   <xsl:text>
</xsl:text>
</xsl:template>

</xsl:stylesheet>

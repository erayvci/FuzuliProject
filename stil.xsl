<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei">
    <xsl:template match="/">
        <html>
            <head>
                <title>Fuzuli Project - Digital Edition</title>
                <style>
                    body { font-family: 'Georgia', serif; background-color: #fcfaf5; padding: 30px; }
                    .page-container { display: flex; gap: 40px; background: white; padding: 20px; border: 1px solid #ddd; margin-bottom: 30px; }
                    .image-area { flex: 1; }
                    .image-area img { width: 100%; border: 1px solid #333; }
                    .text-area { flex: 1; line-height: 1.8; font-size: 1.1em; }
                    .couplet { margin-bottom: 15px; padding-left: 10px; border-left: 2px solid #a33; }
                    .line { display: block; }
                    h1 { text-align: center; color: #444; }
                </style>
            </head>
            <body>
                <h1>Bahâriye: Manzume-i Kasîde</h1>
                <xsl:for-each select="//tei:pb">
                    <div class="page-container">
                        <div class="image-area">
                            <img src="{@facs}" alt="Manuscript Page"/>
                            <p style="text-align:center">Folio: <xsl:value-of select="@n"/></p>
                        </div>
                        <div class="text-area">
                            <xsl:for-each select="following-sibling::tei:div//tei:lg">
                                <div class="couplet">
                                    <xsl:for-each select="tei:l">
                                        <span class="line"><xsl:value-of select="."/></span>
                                    </xsl:for-each>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

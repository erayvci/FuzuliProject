<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Fuzuli Digital Edition</title>
                <style>
                    body { font-family: 'Times New Roman', serif; background-color: #f5f5f0; margin: 0; padding: 20px; }
                    header { text-align: center; border-bottom: 2px solid #333; margin-bottom: 30px; }
                    .page-wrapper { display: flex; flex-direction: row; justify-content: center; gap: 40px; margin-bottom: 50px; background: white; padding: 20px; box-shadow: 5px 5px 15px rgba(0,0,0,0.1); }
                    .manuscript-side { flex: 1; max-width: 500px; }
                    .manuscript-side img { width: 100%; border: 1px solid #999; }
                    .text-side { flex: 1; max-width: 500px; padding-top: 20px; }
                    .couplet { margin-bottom: 15px; border-left: 3px solid #ccc; padding-left: 15px; }
                    .line { display: block; font-size: 1.2em; line-height: 1.6; }
                    .page-number { font-weight: bold; color: #700; margin-bottom: 10px; display: block; }
                </style>
            </head>
            <body>
                <header>
                    <h1>Fuzuli - Kaside-i Su</h1>
                    <p>Digital Edition Project - ISME Department</p>
                </header>

                <xsl:for-each select="//tei:pb">
                    <div class="page-wrapper">
                        <div class="manuscript-side">
                            <span class="page-number">Folio: <xsl:value-of select="@n"/></span>
                            <img src="{@facs}" alt="Manuscript Page"/>
                        </div>
                        
                        <div class="text-side">
                            <xsl:for-each select="following-sibling::tei:lg[preceding-sibling::tei:pb[1] = current()]">
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

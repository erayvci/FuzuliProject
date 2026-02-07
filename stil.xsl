<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Fuzûlî - Dijital Edisyon</title>
                <style>
                    body { font-family: 'Georgia', serif; background-color: #f4f1ea; padding: 20px; line-height: 1.6; }
                    .header-section { text-align: center; border-bottom: 3px double #333; margin-bottom: 40px; padding-bottom: 10px; }
                    .page-container { display: flex; flex-direction: row; background: white; margin-bottom: 60px; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
                    .manuscript-side { flex: 1; padding: 10px; border-right: 1px solid #eee; text-align: center; }
                    .manuscript-side img { width: 100%; max-width: 500px; border: 1px solid #ccc; }
                    .text-side { flex: 1; padding: 20px; }
                    .couplet { margin-bottom: 18px; }
                    .line { display: block; font-style: italic; font-size: 1.1em; color: #2c3e50; }
                    .folio-label { font-weight: bold; color: #800; display: block; margin-top: 10px; }
                </style>
            </head>
            <body>
                <div class="header-section">
                    <h1>Fuzuli Kasidesi</h1>
                    <h3>Fuzûlî</h3>
                    <p>Digital Edition by Eray Avcı</p>
                </div>

                <xsl:for-each select="//tei:pb">
                    <div class="page-container">
                        <div class="manuscript-side">
                            <img src="{@facs}" alt="Manuscript Page"/>
                            <span class="folio-label">Folio: <xsl:value-of select="@n"/></span>
                        </div>
                        <div class="text-side">
                            <xsl:for-each select="following-sibling::tei:div[1]/tei:lg">
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

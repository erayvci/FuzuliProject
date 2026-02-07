<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Fuzûlî Digital Edition</title>
                <style>
                    body { font-family: 'Georgia', serif; background-color: #f4f1ea; padding: 20px; line-height: 1.6; }
                    .header-section { text-align: center; border-bottom: 3px double #333; margin-bottom: 20px; padding-bottom: 10px; }
                    
                    /* Buton Tasarımı */
                    .sticky-button {
                        position: fixed; top: 20px; right: 20px; padding: 15px 25px;
                        background-color: #800; color: white; border: none; border-radius: 30px;
                        cursor: pointer; font-size: 16px; box-shadow: 0 4px 10px rgba(0,0,0,0.3); z-index: 1000;
                    }
                    .sticky-button:hover { background-color: #a00; }

                    .page-container { display: flex; flex-direction: row; background: white; margin-bottom: 60px; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
                    .manuscript-side { flex: 1; padding: 10px; border-right: 1px solid #eee; text-align: center; }
                    .manuscript-side img { width: 100%; max-width: 500px; border: 1px solid #ccc; }
                    .text-side { flex: 1; padding: 20px; position: relative; }
                    
                    .couplet { margin-bottom: 20px; }
                    .ota-text { display: block; font-style: italic; font-size: 1.1em; color: #2c3e50; }
                    .en-text { display: none; font-size: 1.05em; color: #555; border-left: 3px solid #800; padding-left: 10px; }
                    
                    .folio-label { font-weight: bold; color: #800; display: block; margin-top: 10px; }
                </style>
                
                <script>
                    function toggleLanguage() {
                        var ota = document.getElementsByClassName("ota-text");
                        var en = document.getElementsByClassName("en-text");
                        var btn = document.getElementById("langBtn");
                        
                        if (ota[0].style.display === "none") {
                            for(var i=0; i != ota.length; i++) { ota[i].style.display = "block"; en[i].style.display = "none"; }
                            btn.innerHTML = "Switch to English Translation";
                        } else {
                            for(var i=0; i != ota.length; i++) { ota[i].style.display = "none"; en[i].style.display = "block"; }
                            btn.innerHTML = "Orijinal Metne Dön";
                        }
                    }
                </script>
            </head>
            <body>
                <button id="langBtn" class="sticky-button" onclick="toggleLanguage()">Switch to English Translation</button>

                <div class="header-section">
                    <h1>Bahâriye: Manzume-i Kasîde</h1>
                    <h3>Fuzûlî</h3>
                    <p>Digital Variorum Edition by Eray Avcı</p>
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
                                    <div class="ota-text">
                                        <xsl:for-each select="tei:l">
                                            <span style="display:block;"><xsl:value-of select="."/></span>
                                        </xsl:for-each>
                                    </div>
                                    <div class="en-text">
                                        <p><xsl:value-of select="tei:quote"/></p>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

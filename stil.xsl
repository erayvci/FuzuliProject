<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Fuzûlî Digital Edition</title>
                <style>
                    body { font-family: 'Georgia', serif; background-color: #f4f1ea; padding: 20px; line-height: 1.6; margin: 0; }
                    .header-section { text-align: center; border-bottom: 3px double #333; margin-bottom: 40px; padding: 20px; }
                    
                    /* Buton Tasarımı - Garantici Ayarlar */
                    .sticky-button {
                        position: fixed; 
                        top: 20px; 
                        right: 20px; 
                        padding: 15px 30px;
                        background-color: #800000; 
                        color: #ffffff; 
                        border: 2px solid #500; 
                        border-radius: 50px;
                        cursor: pointer; 
                        font-size: 16px; 
                        font-weight: bold;
                        box-shadow: 0 5px 15px rgba(0,0,0,0.4); 
                        z-index: 9999 !important;
                        display: block !important;
                    }
                    .sticky-button:hover { background-color: #a00000; transform: scale(1.05); }

                    .page-container { display: flex; flex-direction: row; background: white; margin-bottom: 60px; padding: 20px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.15); max-width: 1200px; margin-left: auto; margin-right: auto; }
                    .manuscript-side { flex: 1; padding: 10px; border-right: 1px solid #eee; text-align: center; }
                    .manuscript-side img { width: 100%; max-width: 500px; border: 1px solid #ccc; border-radius: 4px; }
                    .text-side { flex: 1; padding: 20px; }
                    
                    .couplet { margin-bottom: 25px; min-height: 50px; }
                    .ota-text { display: block; font-style: italic; font-size: 1.2em; color: #2c3e50; }
                    .en-text { display: none; font-size: 1.1em; color: #444; border-left: 4px solid #800; padding-left: 15px; font-style: normal; }
                    
                    .folio-label { font-weight: bold; color: #800; display: block; margin-top: 15px; font-size: 1.1em; }
                    h1 { margin: 0; color: #333; }
                </style>
                
                <script type="text/javascript">
                    function toggleLanguage() {
                        var otaElements = document.getElementsByClassName("ota-text");
                        var enElements = document.getElementsByClassName("en-text");
                        var btn = document.getElementById("langBtn");
                        
                        // İlk elementin görünürlüğüne bakarak karar ver
                        if (otaElements[0].style.display !== "none") {
                            // İngilizceye Geç
                            for(var i=0; i &lt; otaElements.length; i++) {
                                otaElements[i].style.display = "none";
                                enElements[i].style.display = "block";
                            }
                            btn.innerHTML = "Orijinal Metne Dön (TR)";
                        } else {
                            // Türkçeye Geç
                            for(var i=0; i &lt; otaElements.length; i++) {
                                otaElements[i].style.display = "block";
                                enElements[i].style.display = "none";
                            }
                            btn.innerHTML = "Switch to English Translation";
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
                                        <xsl:value-of select="tei:quote"/>
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

<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head> <title> Evénements au musée </title> </head>
            <body>
                <h3>Liste des événements organisés au musée</h3>
                <!-- création du tableau -->
                <table border="1">
                    <tr>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Nombre de participants</th>
                    </tr>
                    <xsl:for-each select="BigVir/events/event">
                        <!-- tri des événements par date, du plus récent au plus ancien -->
                        <xsl:sort select="date" order="descending"/>
                        <!-- sélection des événements oragnisés au musée -->
                        <xsl:if test="site/@id = '2'">
                            <!-- affichage de la date, la description de l'événements et le nombre de participants -->
                            <tr>
                                <td><xsl:value-of select="date"/></td>
                                <td><xsl:value-of select="eventDescription"/></td>
                                <!-- calcul du nombre de participants -->
                                <td><xsl:value-of select="count(participants/participant)"/></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

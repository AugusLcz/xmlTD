<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head> <title> Ev�nements au mus�e </title> </head>
            <body>
                <h3>Liste des �v�nements organis�s au mus�e</h3>
                <!-- cr�ation du tableau -->
                <table border="1">
                    <tr>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Nombre de participants</th>
                    </tr>
                    <xsl:for-each select="BigVir/events/event">
                        <!-- tri des �v�nements par date, du plus r�cent au plus ancien -->
                        <xsl:sort select="date" order="descending"/>
                        <!-- s�lection des �v�nements oragnis�s au mus�e -->
                        <xsl:if test="site/@id = '2'">
                            <!-- affichage de la date, la description de l'�v�nements et le nombre de participants -->
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

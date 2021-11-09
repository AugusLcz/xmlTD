<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head> <title> Citoyens vaccin�s </title> </head>
            <body>
                <h3>Liste des
                    <!-- calcul le nombre de citoyens vaccin�s -->
                    <xsl:value-of select="count(BigVir/citizens/citizen/BigVirStatus/vaccine)"/>
                    citoyens vaccin�s</h3>
                <!-- cr�ation du tableau -->
                <table border="1">
                    <tr>
                        <th>Nom</th>
                        <th>Pr�nom</th>
                        <th>Date de vaccination</th>
                    </tr>
                    <xsl:for-each select="BigVir/citizens/citizen">
                        <!-- tri par ordre alphab�tique -->
                        <xsl:sort select="lastname"/>
                        <!-- s�lection des citoyens vaccin�s -->
                        <xsl:if test="BigVirStatus/vaccine/vaccineName = 'Rivgib'">
                            <!-- affichage du nom, pr�nom et date de vaccination -->
                            <tr>
                                <td><xsl:value-of select="lastname"/></td>
                                <td><xsl:value-of select="firstname"/></td>
                                <td><xsl:value-of select="BigVirStatus/vaccine/date"/></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

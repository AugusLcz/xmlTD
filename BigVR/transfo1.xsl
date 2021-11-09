<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head> <title> Citoyens vaccinés </title> </head>
            <body>
                <h3>Liste des
                    <!-- calcul le nombre de citoyens vaccinés -->
                    <xsl:value-of select="count(BigVir/citizens/citizen/BigVirStatus/vaccine)"/>
                    citoyens vaccinés</h3>
                <!-- création du tableau -->
                <table border="1">
                    <tr>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Date de vaccination</th>
                    </tr>
                    <xsl:for-each select="BigVir/citizens/citizen">
                        <!-- tri par ordre alphabétique -->
                        <xsl:sort select="lastname"/>
                        <!-- sélection des citoyens vaccinés -->
                        <xsl:if test="BigVirStatus/vaccine/vaccineName = 'Rivgib'">
                            <!-- affichage du nom, prénom et date de vaccination -->
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

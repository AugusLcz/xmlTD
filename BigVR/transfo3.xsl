<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Evénements avec des nb de patients</title>
            </head>
            <table border="1">
                <tr>
                    <th>Date</th>
                    <th>Evénements</th>
                    <th>Nombre de participants</th>
                    <th>Nombre de presonnes infectees</th>
                </tr>
                <xsl:for-each select="BigVir/events/event">
                    <xsl:sort select="date" order="descending"/>

                    <tr>

                            <td><xsl:value-of select="date"/></td>
                            <td><xsl:value-of select="eventDescription"/></td>
                        
                    <xsl:for-each select="participants">
                        <th>
                            <xsl:value-of select="count(participant)"/>

                        </th>
                        <th>
                            <xsl:variable name="r" select="participant/@id"/>
                            <xsl:value-of select="count(ancestor::BigVir/citizens/citizen[@citizenId=$r]/BigVirStatus[infectionStatus='INFECTED'])"/>

                        </th>

                    </xsl:for-each>
                    </tr>
                </xsl:for-each>


            </table>

        </html>
    </xsl:template>
</xsl:stylesheet>
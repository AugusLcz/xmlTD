<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:template match="/">
        <CONSULTATIONS>
            <!-- selection des consultations -->
            <xsl:for-each select="BigVir/citizens/citizen/MedicalHistory/consultations/consultation">
                <xsl:sort select="date" order="descending"></xsl:sort>
                <CONSULTATION>
                    <!-- classement des consultations par date -->
                    <DATE> <xsl:value-of select="date"/></DATE>
                    <!-- récupération des informations du patient -->
                    <PATIENT id="{../../../@citizenId}">
                        <LASTNAME><xsl:value-of select="../../../lastname"/></LASTNAME>
                        <FIRSTNAME><xsl:value-of select="../../../firstname"/></FIRSTNAME>
                    </PATIENT>
                   <!-- affichage des informations de la consultation -->
                    <MOTIVATION><xsl:value-of select="motivation"/></MOTIVATION>
                    <DESCRIPTION><xsl:value-of select="description"/></DESCRIPTION>
                </CONSULTATION>
            </xsl:for-each>
        </CONSULTATIONS>
    </xsl:template>
    <xsl:output method="xml" encoding="UTF-8"/>
</xsl:stylesheet>
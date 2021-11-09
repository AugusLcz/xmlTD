<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:template match="/">
        <CITIZENS>
            <xsl:for-each select="BigVir/citizens/citizen">
                <xsl:sort select="lastname" />
                <xsl:if test="BigVirStatus/infectionStatus = 'INFECTED'">
                    <INFECTED_CITIZEN id="{@citizenId}" name="{lastname} {firstname}">
                        <CLOSE_RELATIONS>
                            <xsl:for-each select="Relations/person">
                                <xsl:sort select="proximityLevel" order="descending"/>
                                <xsl:if test="proximityLevel &gt; 1">
                                    <PERSON id="{@id}" proximity="{proximityLevel}">
                                    </PERSON>
                                </xsl:if>
                            </xsl:for-each>
                        </CLOSE_RELATIONS>
                    </INFECTED_CITIZEN>
                </xsl:if>

            </xsl:for-each>
        </CITIZENS>
    </xsl:template>
    <xsl:output method="xml" encoding="UTF-8"/>
</xsl:stylesheet>
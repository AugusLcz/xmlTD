<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head> <title> Bilan des tests </title> </head>
            <body>
                <h3>Nombre de tests BigVir effectués:
                    <!-- calcul du nombre total de tests de BigVor -->
                    <xsl:value-of select="count(BigVir/citizens/citizen/MedicalHistory/TestResults/test[type='BigVir'])"/></h3>
                <h3>Pourcentage de tests positifs :
                    <!-- calcul du pourcentage de positivité des tests en divisant le nombre de tests positifs par le nombre total de tests -->
                    <xsl:value-of select='format-number(count(BigVir/citizens/citizen/MedicalHistory/TestResults/test[type="BigVir"][result="Positive"]) div count(BigVir/citizens/citizen/MedicalHistory/TestResults/test[type="BigVir"]), "#%")' />
                    </h3>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

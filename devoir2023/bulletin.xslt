<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  
  <!-- Add college and academic year information -->
  <xsl:param name="college" select="'Collège CSS'"/>
  <xsl:param name="anneeAcademique" select="'Année Académique: 2023-2024'"/>
  
  <xsl:template match="/">
    <xsl:apply-templates select="classe/eleve"/>
  </xsl:template>

  <xsl:template match="eleve">
    <html>
      <head>
        <title>Bulletin de notes</title>
        <style>
          body { font-family: Arial, sans-serif; }
          .header { text-align: right; }
          .title { text-align: center; font-weight: bold; margin-top: 20px; }
          .right-align { text-align: right; }
          .border-apply { border: 1px solid black; margin: 20px; padding: 20px; }
          .table-width {
            width: 100%;
            border: 1px solid black;
            text-align: left;
            border-collapse: collapse; /* Merge borders */
            border-spacing: 0; /* No space between cells */
          }
          .table-width th, .table-width td {
            border: 1px solid black;
            padding: 10px;
            margin: 0; /* No margin for cells */
          }
        </style>
      </head>
      <body>
        <div class="border-apply">
          <div class="header">
            <p><xsl:value-of select="$college"/></p>
            <p><xsl:value-of select="$anneeAcademique"/></p>
          </div>
          <div>
            <h2 class="title">Bulletin du trimestre N°1</h2>
            <p>Classe : <xsl:value-of select="../nom_classe"/><br/></p>
            <p><xsl:value-of select="nom/prenom"/> <xsl:text> </xsl:text><xsl:value-of select="nom/patronyme"/></p>
            <p><xsl:value-of select="adresse/ville"/> <xsl:text> </xsl:text><xsl:value-of select="adresse/quartier"/> <xsl:text>lot </xsl:text><xsl:value-of select="adresse/lot"/> <xsl:text>maison </xsl:text><xsl:value-of select="adresse/maison"/></p>
            <p>Né le, <xsl:value-of select="naiss"/></p>
          </div>
          <table class="table-width">
            <thead>
              <tr>
                <th>Matières</th>
                <th>Contrôles</th>
                <th>Examens</th>
                <th>Moyennes</th>
                <th>Coefficients</th>
                <th>Moyennes finales</th>
                <th>Observations</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="resultats/trimestre[@num='1']/controle/*">
                <tr>
                  <td><xsl:value-of select="name()"/></td>
                  <td><xsl:value-of select="."/></td>
                  <td><xsl:value-of select="../following-sibling::examen/*[name() = name(current())]"/></td>
                  <td>
                    <xsl:value-of select="(number(.) + number(../following-sibling::examen/*[name() = name(current())])) div 2"/>
                  </td>
                  <td>1</td>
                  <td>
                    <xsl:value-of select="(number(.) + number(../following-sibling::examen/*[name() = name(current())])) div 2"/>
                  </td>
                  <td></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
          <p class="right-align">Moyenne générale: 
            <xsl:variable name="sumOfAverages" select="
              sum(resultats/trimestre[@num='1']/controle/*) + 
              sum(resultats/trimestre[@num='1']/examen/*)"/>
            <xsl:value-of select="$sumOfAverages div (2 * count(resultats/trimestre[@num='1']/controle/*))"/>
          </p>
          <p class="right-align">Observation générale: ------</p>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

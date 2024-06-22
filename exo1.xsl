<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
  <html>
  <head>
    <title>Annuaire</title>
  </head>
  <body>
    <h2>Annuaire des personnes</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Nom</th>
        <th>Prénom</th>
        <th>Sexe</th>
        <th>Pays</th>
        <th>Département</th>
        <th>Ville</th>
        <th>Maison</th>
        <th>Téléphone</th>
        <th>Email</th>
      </tr>
      <xsl:apply-templates select="repertoire/personne"/>
    </table>
  </body>
  </html>
</xsl:template>

<xsl:template match="personne">
  <tr>
    <td><xsl:value-of select="nom"/></td>
    <td><xsl:value-of select="prenom"/></td>
    <td><xsl:value-of select="@sexe"/></td>
    <td><xsl:value-of select="adresse/pays"/></td>
    <td><xsl:value-of select="adresse/departement"/></td>
    <td><xsl:value-of select="adresse/ville"/></td>
    <td><xsl:value-of select="adresse/maison"/></td>
    <td>
      <xsl:for-each select="telephones/telephone">
        <xsl:value-of select="."/><br/>
      </xsl:for-each>
    </td>
    <td>
      <xsl:for-each select="emails/email">
        <xsl:value-of select="."/><br/>
      </xsl:for-each>
    </td>
  </tr>
</xsl:template>

</xsl:stylesheet>

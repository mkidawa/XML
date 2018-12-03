<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>
    <!--<xsl:output method="html" />-->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
            <head>
                <title>Music_set</title>
            </head>
            <body>
                <table border="2" bgcolor="#6fa3f7" align="center" style="text-align:center" >
                    <caption><b>Nasza kolekcja albumów muzycznych</b></caption>
                    <tr>
                        <th>Nazwa albumu</th>
                        <th>Gatunek</th>
                        <th>Data wydania w Polsce</th>
                        <th>Ocena</th>
                        <th>Długość albumu</th>
                        <th>Wydawca</th>
                        <th>Piosenki</th>
                    </tr>
                    <xsl:for-each select="MuzycznyRaport/Album">
                        <tr>
                            <td><xsl:value-of select="@Nazwa"/></td>
                            <td><xsl:value-of select="@Gatunek"/></td>
                            <td><xsl:value-of select="@Data_wydania_w_Polsce"/></td>
                            <td><xsl:value-of select="@Ocena"/></td>
                            <td><xsl:value-of select="@Dlugosc_albumu"/></td>
                            <td><xsl:value-of select="@Wydawca"/></td>
                            <td><xsl:value-of select="Piosenki"/></td>

                        </tr>
                    </xsl:for-each>
                </table >
                <table border="4" style="text-align:center" width="100%">
                    <caption><b>Podsumowanie_Muzyczne</b></caption>
                    <tr>
                        <th>Ilość albumów</th>
                        <th>Ilość piosenek</th>
                        <th>Ilość albumów rockowych</th>
                        <th>Ilość albumów rapowych</th>
                        <th>Ilość albumów bluesowych</th>
                        <th>Ilość albumów funkowych</th>
                        <th>Ilość albumów jazzowych</th>
                        <th>Ilość albumów metalowych</th>
                    </tr>
                    <tr>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Ilość_Albumów"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Łączna_ilość_piosenek"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Ilość_albumów_rockowych"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Ilość_albumów_rapowych"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Ilość_albumów_bluesowych"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Ilość_albumów_funkowych"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Ilość_albumów_jazzowych"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Ilość_albumów_metalowych"/></td>
                    </tr>
                    <tr>
                        <th>Najwyższa ocena albumu</th>
                        <th>Najwyżej oceniany album</th>
                        <th>Należność w polskich złotych za zakup</th>
                        <th>Należność w funtach za zakup</th>
                        <th>Należność w euro za zakup</th>
                        <th>Należność w dolarach za zakup</th>
                        <th>VAT odprowadzony od zakupu</th>
                        <th>Data Raportu</th>
                    </tr>
                    <tr>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Najwyższa_ocena_albumu"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Najwyżej_oceniany_album"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Należność_w_POLSKICH_ZLOTYCH_za_zamówienie"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Należność_w_FUNTACH_za_zamówienie"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Należność_w_EURO_za_zamówienie"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Należność_w_DOLARACH_za_zamówienie"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/VAT_odprowadzony_od_zamówienia"/></td>
                        <td><xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Data_Raportu"/></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
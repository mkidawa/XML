<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
        <xsl:template match="/">
            <xsl:element name="MuzycznyRaport">
                <xsl:apply-templates select="music_set/owned_albums"/>

                <xsl:element name="Podsumowanie_informacji">
                    <xsl:element name="Ilość_Albumów">
                        <xsl:value-of select="count(music_set/owned_albums/CD)"/>
                    </xsl:element>
                    <xsl:element name="Łączna_ilość_piosenek">
                        <xsl:value-of select="count(music_set/owned_albums/CD/songs/song)"/>
                    </xsl:element>
                    <xsl:element name="Ilość_albumów_rockowych">
                        <xsl:value-of select="count(music_set/owned_albums/CD[@genre_id='rock'])"/>
                    </xsl:element>
                    <xsl:element name="Ilość_albumów_rapowych">
                        <xsl:value-of select="count(music_set/owned_albums/CD[@genre_id='rap'])"/>
                    </xsl:element>
                    <xsl:element name="Ilość_albumów_bluesowych">
                        <xsl:value-of select="count(music_set/owned_albums/CD[@genre_id='blues'])"/>
                    </xsl:element>
                    <xsl:element name="Ilość_albumów_funkowych">
                        <xsl:value-of select="count(music_set/owned_albums/CD[@genre_id='funk'])"/>
                    </xsl:element>
                    <xsl:element name="Ilość_albumów_jazzowych">
                        <xsl:value-of select="count(music_set/owned_albums/CD[@genre_id='jazz'])"/>
                    </xsl:element>
                    <xsl:element name="Ilość_albumów_metalowych">
                        <xsl:value-of select="count(music_set/owned_albums/CD[@genre_id='metal'])"/>
                    </xsl:element>
                    <xsl:element name="Najwyższa_ocena_albumu">
                        <xsl:value-of select="concat(max(music_set/owned_albums/CD/metacritics),'%')"/>
                    </xsl:element>
                    <xsl:variable name="maxVar" select="max(music_set/owned_albums/CD/metacritics)"/>

                    <xsl:element name="Najwyżej_oceniany_album">
                        <xsl:for-each select="music_set/owned_albums/CD">
                                <xsl:choose>
                                    <xsl:when test="metacritics = $maxVar">
                                        <xsl:value-of select="title"/>
                                    </xsl:when>
                                </xsl:choose>
                        </xsl:for-each>
                    </xsl:element>

                    <xsl:element name="Należność_w_POLSKICH_ZLOTYCH_za_zamówienie">
                        <xsl:value-of select="concat(sum(music_set/owned_albums/CD/prices/price[@currency='PLN']),'zł')"/>
                    </xsl:element>

                    <xsl:element name="Należność_w_FUNTACH_za_zamówienie">
                        <xsl:value-of select="concat(sum(music_set/owned_albums/CD/prices/price[@currency='GBP']),'£')"/>
                    </xsl:element>

                    <xsl:element name="Należność_w_EURO_za_zamówienie">
                        <xsl:value-of select="concat(sum(music_set/owned_albums/CD/prices/price[@currency='EURO']),'€')"/>
                    </xsl:element>

                    <xsl:element name="Należność_w_DOLARACH_za_zamówienie">
                        <xsl:value-of select="concat(sum(music_set/owned_albums/CD/prices/price[@currency='DOLLAR']),'$')"/>
                    </xsl:element>

                    <xsl:variable name="wyludzenieVatowe" select="sum(music_set/owned_albums/CD/prices/price[@currency='PLN'])"/>

                    <xsl:element name="VAT_odprowadzony_od_zamówienia">
                        <xsl:value-of select="concat(round(($wyludzenieVatowe * 23)div 100),'zł')"/>
                    </xsl:element>

                    <xsl:element name="Data_Raportu">
                        <xsl:value-of select="format-dateTime(current-dateTime(),'[D01]-[M01]-[Y0001]')" />
                    </xsl:element>



                </xsl:element>
            </xsl:element>
        </xsl:template>

    <xsl:template match="music_set/owned_albums">
        <xsl:for-each select="CD">
            <xsl:sort select="metacritics" order="descending"/>
            <xsl:element name="Album">
                <xsl:attribute name="Nazwa">
                    <xsl:value-of select="title"/>
                </xsl:attribute>
                <xsl:choose>
                    <xsl:when test="string(@genre_id) = 'rock'">
                        <xsl:attribute name="Gatunek">Rock</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@genre_id) = 'metal'">
                        <xsl:attribute name="Gatunek">Metal</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@genre_id) = 'funk'">
                        <xsl:attribute name="Gatunek">Funk</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@genre_id) = 'blues'">
                        <xsl:attribute name="Gatunek">Blues</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@genre_id) = 'jazz'">
                        <xsl:attribute name="Gatunek">jazz</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@genre_id) = 'rap'">
                        <xsl:attribute name="Gatunek">Rap</xsl:attribute>
                    </xsl:when>
                </xsl:choose>
                <xsl:attribute name="Data_wydania_w_Polsce">
                    <xsl:value-of select="release_dates/release_date[@nation='PL']" />
                </xsl:attribute>
                <xsl:attribute name="Ocena">
                    <xsl:value-of select="concat(metacritics,'%')"/>
                </xsl:attribute>
                <xsl:attribute name="Dlugosc_albumu">
                    <xsl:value-of select="concat(album_length,' minut')"/>
                </xsl:attribute>
                <xsl:attribute name="Wydawca">
                    <xsl:value-of select="publisher"/>
                </xsl:attribute>
                <xsl:element name="Piosenki">
                <xsl:for-each select="songs/song">
                        <xsl:element name="Nazwa"><xsl:value-of select="name"/></xsl:element>
                        <xsl:element name="Długość"><xsl:value-of select="song_length"/></xsl:element>
                </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
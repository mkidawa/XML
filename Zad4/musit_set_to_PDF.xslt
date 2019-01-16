<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                >
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="Nasza_kolekcja_albumów_muzycznych" page-height="14in" page-width="14in" font-family="sans-serif">
                    <fo:region-body region-name="only_region" margin="1in" background-color="#303030"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="Piosenki" page-height="14in" page-width="14in" font-family="sans-serif">
                    <fo:region-body  region-name="only_region" margin="1in" background-color="#303030" />
                </fo:simple-page-master>
                <fo:simple-page-master master-name="Podsumowanie" page-height="11in" page-width="11in" font-family="sans-serif">
                    <fo:region-body  region-name="only_region" margin="1in" background-color="#303030" />
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="Nasza_kolekcja_albumów_muzycznych">
                <fo:flow flow-name="only_region">
                    <fo:block text-align="center" font-weight="bold" font-family="Arial" font-size="20" color="#ffffff">
                        <xsl:value-of select="substring('Nasza kolekcja albumów muzycznych', 1)"/>
                    </fo:block>
                    <fo:table border="dashed 3pt #751b1b" table-layout="fixed" width="100%" font-size="10">
                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell width="150px">
                                    <fo:block font-weight="bold" color="#ff3d3d">Nazwa albumu</fo:block>
                                </fo:table-cell>
                                <fo:table-cell >
                                    <fo:block font-weight="bold" color="#ff3d3d">Gatunek</fo:block>
                                </fo:table-cell >
                                <fo:table-cell >
                                    <fo:block font-weight="bold" color="#ff3d3d">Data wydania w Polsce</fo:block>
                                </fo:table-cell>
                                <fo:table-cell >
                                    <fo:block font-weight="bold" color="#ff3d3d">Ocena</fo:block>
                                </fo:table-cell>
                                <fo:table-cell >
                                    <fo:block font-weight="bold" color="#ff3d3d">Dlugosc albumu</fo:block>
                                </fo:table-cell>
                                <fo:table-cell >
                                    <fo:block font-weight="bold" color="#ff3d3d">Wydawca</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <xsl:for-each select="MuzycznyRaport/Album">
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell >
                                        <fo:block color="#ff3d3d">
                                            <xsl:value-of select="@Nazwa"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell >
                                        <fo:block color="#ff3d3d">
                                            <xsl:value-of select="@Gatunek"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block color="#ff3d3d"> 
                                            <xsl:value-of select="@Data_wydania_w_Polsce"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell >
                                        <fo:block color="#ff3d3d">
                                            <xsl:value-of select="@Ocena"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell >
                                        <fo:block color="#ff3d3d">
                                            <xsl:value-of select="@Dlugosc_albumu"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell >
                                        <fo:block color="#ff3d3d">
                                            <xsl:value-of select="@Wydawca"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </xsl:for-each>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="Piosenki">
                <fo:flow flow-name="only_region">
                    <fo:block text-align="center" font-weight="bold" font-family="Arial" font-size="20" color="#ffffff">
                        <xsl:value-of select="substring('Piosenki', 1)"/>
                    </fo:block>
                    <fo:table border="dashed 3pt #751b1b" table-layout="fixed" width="100%" font-size="10">
                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell width="150px">
                                    <fo:block font-weight="bold" font-size="15" color="#ffffff">Nazwa albumu</fo:block>
                                </fo:table-cell>
                                <fo:table-cell >
                                    <fo:block font-weight="bold" font-size="15" color="#ffffff">Piosenka</fo:block>
                                </fo:table-cell >
                                <fo:table-cell >
                                    <fo:block font-weight="bold" font-size="15" color="#ffffff">Dlugosc</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <xsl:for-each select="MuzycznyRaport/Album">
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell >
                                        <fo:block color="#ff3d3d">
                                            <xsl:value-of select="@Nazwa"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
									<xsl:for-each select="Piosenki/Piosenka">
											<fo:table-row>
											<fo:table-cell>
												<fo:block>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block color="#ff3d3d">
													<xsl:value-of select="@Nazwa"/>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block color="#ff3d3d">
													<xsl:value-of select="@Dlugosc"/>
												</fo:block>
											</fo:table-cell>
											</fo:table-row>
									</xsl:for-each>
                            </fo:table-body>
                        </xsl:for-each>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="Podsumowanie">
                <fo:flow flow-name="only_region">
                    <fo:block text-align="center" font-weight="bold" font-size="12" color="#ffffff">Podsumowanie</fo:block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Liczba albumów: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Liczba_Albumów"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Laczna liczba piosenek: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Łączna_liczba_piosenek"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Liczba albumów rockowych: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Liczba_albumów_rockowych"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Liczba albumów rapowych:  </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Liczba_albumów_rapowych"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Liczba albumów bluesowych:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Liczba_albumów_bluesowych"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Liczba albumów funkowych: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Liczba_albumów_funkowych"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Liczba albumów jazzowych: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Liczba_albumów_jazzowych"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Liczba albumów metalowych: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Liczba_albumów_metalowych"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Najwyższa ocena albumu: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Najwyższa_ocena_albumu"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Najwyżej oceniany album: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Najwyżej_oceniany_album"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Należność w PLN za zamówienie: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Należność_w_POLSKICH_ZLOTYCH_za_zamówienie"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Należność w GBP za zamówienie: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Należność_w_FUNTACH_za_zamówienie"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Należność w EURO za zamówienie: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Należność_w_EURO_za_zamówienie"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Należność w USD za zamówienie: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Należność_w_DOLARACH_za_zamówienie"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">VAT odprowadzony od zamówienia: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/VAT_odprowadzony_od_zamówienia"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block color="#ffffff">Data Raportu:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="20em" color="#ffffff">
                                    <xsl:value-of select="MuzycznyRaport/Podsumowanie_informacji/Data_Raportu"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
</xsl:stylesheet>
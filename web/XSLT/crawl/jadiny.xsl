<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : jadiny.xsl
    Created on : June 12, 2019, 8:44 PM
    Author     : stephen
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="root">
        <ProductDetailLinks>
            <xsl:for-each select="product">
                <xsl:variable name="links" select="links/div[1]" />
                <Product>
                    <Links>
                        <xsl:for-each select="$links/div[@class='col-md-6 col-sm-6 col-lg-4 col-xs-6 product-holder']">
                            <xsl:variable name="link" select="div/div[@class='image']/a/@href"/>
                            <Link>https://jadiny.vn<xsl:value-of select="$link"/></Link>
                        </xsl:for-each>
                    </Links>
                    <Sex>
                        <xsl:value-of select="sex" />
                    </Sex>
                </Product>
            </xsl:for-each>
        </ProductDetailLinks>
    </xsl:template>

</xsl:stylesheet>

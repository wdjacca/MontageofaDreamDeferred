<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Montage of A Dream Deferred</title>
                <link rel="stylesheet" type="text/css" href="hughproject.css"/>
                <link rel="stylesheet" type="text/css" href="chanXSLTexercise3.css" />
                <link rel="stylesheet" type="text/css" href="https://use.typekit.net/jkx1xou.css" />
                <link rel="stylesheet" type="text/css" href="https://use.typekit.net/jkx1xou.css" />
                <link rel="stylesheet" type="text/css" href="https://use.typekit.net/jkx1xou.css" />
            </head>
            <body>
                <h1>MONTAGE OF A DREAM DEFFERED</h1>
                <h2>by Langston Hughes</h2>
                
                <!--jkc:Table of Contents -->
                <section id="contents"> <table> 
                    <tr>
                        <th>Poem</th>
                        <th>Page Number</th>
                    </tr>
                    <xsl:apply-templates select="descendant::poem" mode="toc"/>
                    
                </table></section>
                <hr/>
                <!-- jkc: the actual poems -->
                <section id="readingView">
                    <xsl:apply-templates select="descendant::poem"/>
                </section>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="poem" mode="toc">
        <tr>
            <td><a href="#C{count(preceding-sibling::poem) + 1}"></a><xsl:if test="not(poem[@cont])"><xsl:apply-templates select="poemTitle"/></xsl:if></td>
            <td><xsl:apply-templates select="pb/@pNum"></xsl:apply-templates></td>
        </tr>
    </xsl:template>
    <xsl:template match="poem">
        <h2><xsl:apply-templates select="descendant::poemTitle"/></h2>
        <xsl:for-each select="descendant::line">
            <p><xsl:apply-templates/></p><br/>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="format[@wordType='italics']">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    <xsl:template match="format[@wordType='underline']">
        <em class="underline">
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    <xsl:template match="format[@wordType='caps']">
        <em class="caps">
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    <xsl:template match="format[@margin='ind1']">
        <em class="ind1">
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    <xsl:template match="format[@margin='ind2']">
        <em class="ind2">
            <xsl:apply-templates/>
        </em>
    </xsl:template>
   
</xsl:stylesheet>
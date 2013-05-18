<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
    <xsl:output method="html" encoding="utf-8" indent="yes" />

    <!-- root element, zde pouzit pro konstrukci hlavicky vystupniho HTML -->
    <!-- kazda sablona zacina xsl:template a je nasledovana definici elementu na ktery se vztahuje -->
    <!-- jakekoli znacky, ktere nejsou soucasti namespacu xsl: se objevi jako znacky ve vystupnim XML -->
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
        <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

                <link rel="shortcut icon" href="/themes/favicon.ico" type="image/x-icon"/>

                <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"/>
                <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

                <title>Blog | Kategorie číslo jedna</title>
            </head>


            <body>
                <h1>Boot.cz</h1>

                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <!-- minimalisticka sablona, ktera pouze zaruci zpracovani vnitrnich elementu-->
    <xsl:template match="boot">
        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="autor">
        <h3 class='autor'>
            <a>
                <xsl:attribute name="href">mailto:
                    <xsl:value-of select="@email"/>
                </xsl:attribute>
                <xsl:apply-templates/>
            </a>
        </h3>
    </xsl:template>

    <!-- klasicky priklad prejmenovavaci sablony-->
    <xsl:template match="nazev">
        <h2 class='nazev'>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>


    <xsl:template match="telo">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- na atributy se odkazujeme pomoci "@jmeno_atributu"-->
    <xsl:template match="zaver">
        <p>
            <i>Cena:<xsl:value-of select="@cena"/>, VC=kon:<xsl:value-of select="@vykon"/>,
                PomD�r cena/vC=kon:
                <xsl:value-of select="@cena_vykon"/>
            </i>
        </p>
        <p>
            <b>CelkovC) hodnocenC-:
                <xsl:value-of select="@celek"/>
            </b>
        </p>
    </xsl:template>

    <!-- sablona, ktera ma vice moznych "substratu" -->
    <xsl:template match="p | b | i | u">
        <!-- vytvarime vystupni element s nazvem {name()} coz je jmeno prave zpracovavaneho elementu -->
        <!-- jde tedy o pouhe kopirovani -->
        <xsl:element name="{name()}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>

        <!-- nektere dalsi veci jsou kratce komentovany v summary.xsl -->

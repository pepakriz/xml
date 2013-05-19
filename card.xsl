<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
    <xsl:output method="text"/>
    <xsl:output method="html" encoding="utf-8" indent="yes" name="html" />

    <xsl:template match="/">
        <xsl:for-each select="//SHOPITEM">
            <xsl:variable name="filename"
                          select="concat('www/product-',@id,'.html')" />
            <xsl:value-of select="$filename" />
            <xsl:result-document href="{$filename}" format="html">
                <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
                <html>

                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                        <meta name="author" content="Pavlína Ostrá, Josef Kříž" />

                        <link rel="shortcut icon" href="/themes/favicon.ico" type="image/x-icon"/>

                        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"/>
                        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

                        <title>Katalog | <xsl:value-of select="//PRODUCT" /></title>
                    </head>


                    <body>


                        <div class="container" style="padding-top: 40px;">

                            <div class="row">
                                <div class="span12">

                                    <ul class="breadcrumb">
                                        <li><a href="./">Katalog</a> <span class="divider">/</span></li>
                                        <li class="active"><xsl:value-of select="//PRODUCT" /></li>
                                    </ul>
                                    <h1>Hlavní strana</h1>
                                    <div class="navbar">
                                        <div class="navbar-inner">
                                            <div class="container">
                                                <ul style="width: 100%;" class="nav">
                                                    <li style="width: 100%;" class="dropdown">
                                                        <a href="#" class="pull-left dropdown-toggle" data-toggle="dropdown"><span
                                                                class="icon icon-shopping-cart"></span> <strong>nákupní košík:</strong> <span
                                                                class="pull-right">0 Kč <b class="caret"></b></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li class="nav-header">Košík je prázdný</li>
                                                        </ul>
                                                    </li>
                                                </ul>

                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>

                            <hr />

                            <footer>
                                <p>Company 2013</p>
                                <p><a rel="nofollow" href="/admin">Administrace </a></p>
                            </footer>

                        </div>

                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

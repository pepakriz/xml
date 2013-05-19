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

                        <title>Katalog | <xsl:value-of select="PRODUCT" /></title>
                    </head>


                    <body>


                        <div class="container" style="padding-top: 40px;">

                            <div class="row">
                                <div class="span12">

                                    <ul class="breadcrumb">
                                        <li><a href="./">Katalog</a> <span class="divider">/</span></li>
                                        <li class="active"><xsl:value-of select="PRODUCT" /></li>
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


									<h4><a href="/katalog/kategorie-cislo-jedna/stare-kosile"><xsl:value-of select="PRODUCT" /></a></h4>
									<span class="label">výprodej</span>
									<p>
										<xsl:apply-templates select="DESCRIPTION"/>
									</p>
									<div class="row-fluid">
									<a href="#">
										<img style="margin-bottom: 5px;" alt="" width="400" height="">
											<xsl:attribute name="src">
												<xsl:value-of select="IMGURL"/>
											</xsl:attribute>
										</img>
									</a>
									
									<div class="span6 pull-right">
										<h3>Popis produktu</h3>
										<xsl:value-of select="FUNCTION_TYPE"/>
										<dt>Základní rozměry:</dt> 
										<dd><xsl:value-of select="DIMENSIONS_TYPE"/></dd>
										<dt>Značka:</dt> <dd><xsl:value-of select="MANUFACTURER_NAME"/></dd>
										<b>Typy: </b>
										<ul>
											<xsl:for-each select="TYPE/TYPEITEM">
												<li><xsl:apply-templates/></li>
											</xsl:for-each>
										</ul>
										<b>Rozměry: </b>
										<ul>
											<xsl:for-each select="SIZE/SIZEITEM">
												<li><xsl:apply-templates/></li>
											</xsl:for-each>
										</ul>
									</div>
									</div>
									<div class="row-fluid">
										<div class="span6">
											<span class="lead">12,-</span>
										</div>
										<div class="span6">
											<form class="navbar-form" action="/katalog/kategorie-cislo-jedna/stare-kosile?do=catalog-product-5-submit" method="post" id="frm-catalog-product-5"><input type="hidden" name="type" id="frm5-type" required="required" value="7" />					
											<button class="pull-right span8 btn btn-primary" onclick="$().click();"><span class="icon icon-white icon-shopping-cart"></span> Koupit</button>
												<input class="btn hidden" style="display: none;" type="submit" id="frm5-order" name="order" value="Koupit" /><div><!--[if IE]><input type=IEbug disabled style="display:none"><![endif]--></div>
											</form>
										</div>
									</div>

									<div class="row-fluid">
										<div class="span12" style="min-height: 20px;">
											<small>In stock: <xsl:value-of select="AVAILABILITY"/> ks.</small>
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

	<!-- sablona, ktera ma vice moznych "substratu" -->
	<xsl:template match="p | b | i | u">
		<!-- vytvarime vystupni element s nazvem {name()} coz je jmeno prave zpracovavaneho elementu -->
		<!-- jde tedy o pouhe kopirovani -->
		<xsl:element name="{name()}">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>

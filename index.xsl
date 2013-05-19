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
                <meta name="author" content="Pavlína Ostrá, Josef Kříž" />

                <link rel="shortcut icon" href="/themes/favicon.ico" type="image/x-icon"/>

                <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"/>
                <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

                <title>Katalog | Hlavní strana</title>
            </head>


            <body>


		<div class="container" style="padding-top: 40px;">

			<div class="row">
				<div class="span12">

					<ul class="breadcrumb">
						<li class="active">Katalog</li>
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
					<div id="snippet--productsItems">
						<div class="tabbable">
							<ul class="nav nav-tabs">
								<li class="active"><a class="ajax" href="/katalog/kategorie-cislo-jedna">Podle ceny</a></li>
								<li><a class="ajax" href="/katalog/kategorie-cislo-jedna?order=name">Podle jména</a></li>
								<li><a class="ajax" href="#tab-filter" data-toggle="tab">Rozšířené</a></li>

								<li class="pull-right active dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">Položky: 20 <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a class="ajax" href="/katalog/kategorie-cislo-jedna?itemsPerPage=10">10</a></li>
										<li><a class="ajax" href="/katalog/kategorie-cislo-jedna">20</a></li>
										<li><a class="ajax" href="/katalog/kategorie-cislo-jedna?itemsPerPage=50">50</a></li>
										<li><a class="ajax" href="/katalog/kategorie-cislo-jedna?itemsPerPage=100">100</a></li>
										<li><a class="ajax" href="/katalog/kategorie-cislo-jedna?itemsPerPage=200">200</a></li>
										<li><a class="ajax" href="/katalog/kategorie-cislo-jedna?itemsPerPage=500">500</a></li>
									</ul>
								</li>
								<li class="pull-right"><a class="ajax" href="/katalog/kategorie-cislo-jedna?show=table"><span class="icon icon-th-list"></span></a></li>
								<li class="pull-right active"><a class="ajax" href="/katalog/kategorie-cislo-jedna"><span class="icon icon-th"></span></a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade in" id="tab-filter">

									<form action="/katalog/kategorie-cislo-jedna?do=filterForm-submit" method="post" id="frm-filterForm" class="ajax form-horizontal">
										<div id="frmfilterForm-text-pair" class="control-group">
											<label class="control-label" for="frmfilterForm-text">Text</label>
											<div class="controls">
												<input type="text" name="text" id="frmfilterForm-text" value="" />

											</div>
										</div>
										<div id="frmfilterForm-priceFrom-pair" class="control-group">
											<label class="control-label" for="frmfilterForm-priceFrom">Price from</label>
											<div class="controls">
												<input type="text" name="priceFrom" id="frmfilterForm-priceFrom" value="" />

											</div>

										</div>


										<div id="frmfilterForm-priceTo-pair" class="control-group">


											<label class="control-label" for="frmfilterForm-priceTo">Price to</label>
											<div class="controls">
												<input type="text" name="priceTo" id="frmfilterForm-priceTo" value="" />

											</div>

										</div>



										<div id="frmfilterForm-labels-pair" class="control-group">


											<label class="control-label">štítky</label>
											<div class="controls">
												<input type="checkbox" name="labels[]" id="frmfilterForm-labels-0" value="0" /><label for="frmfilterForm-labels-0">novinka</label><br /><input type="checkbox" name="labels[]" id="frmfilterForm-labels-1" value="1" /><label for="frmfilterForm-labels-1">akce</label><br /><input type="checkbox" name="labels[]" id="frmfilterForm-labels-2" value="2" /><label for="frmfilterForm-labels-2">výprodej</label><br />

											</div>

										</div>

										<div class="form-actions">

											<input type="submit" class="btn" name="_submit" id="frmfilterForm-_submit" value="Aplikovat" />                </div>
									</form>
								</div>
							</div>
						</div>

						<div id="snippet--paginatorBefore">

						</div>

						<div id="snippet--productItemList">
							<div class="row-fluid">
								<ul class="thumbnails">
								</ul>
							</div>
							<div class="row-fluid">
								<xsl:apply-templates/>
							</div>
						</div>
					</div>

					<div style="text-align: center;" id="snippet--paginatorAfter">


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
    </xsl:template>

    <!-- minimalisticka sablona, ktera pouze zaruci zpracovani vnitrnich elementu-->
	<xsl:template match="SHOP">
						<xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="SHOPITEM">
		<li class="span4">
			<div class="thumbnail">
				<div id="snippet-catalog-add"></div>
				<xsl:apply-templates/>
			</div>


		</li>

    </xsl:template>


    <xsl:template match="PRODUCT">
        <h4 class='product'>
            <a href="">
				<xsl:apply-templates/>
			</a>
        </h4>
    </xsl:template>

    <!-- klasicky priklad prejmenovavaci sablony-->
    <xsl:template match="DESCRIPTION">
       <div class="span12" style="min-height: 20px;">
				<small>
					<xsl:apply-templates/>
				</small>
		</div>
    </xsl:template>


    <xsl:template match="PRICE">
       <div class="span6">
				<span class="lead">
					<xsl:apply-templates/>,-
				</span>
			</div>
    </xsl:template>

    <!-- na atributy se odkazujeme pomoci "@jmeno_atributu"-->
    <xsl:template match="IMGURL">
       <a href="">
			<img style="margin-bottom: 5px;" alt="" class="show" width="400" height="">
                <xsl:attribute name="src"><xsl:apply-templates/></xsl:attribute>
            </img>
		</a>
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

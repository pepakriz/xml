<?xml version="1.0" encoding="utf-8"?>
<schema xmlns="http://www.ascc.net/xml/schematron">
 
  <!-- SHOP elementy -->
  <pattern name="Seznam položek je prázdný">
    <rule context="/SHOP">
      <report test="count(SHOPITEM) &lt; 1">element shop musí obsahovat alespoň jednu položku SHOPITEM</report>
    </rule>
  </pattern>

  
  <!-- SHOPITEM elementy a atributy -->
  <pattern name="Element SHOPITEM musí obsahovat všechny následující elementy">
    <rule context="/SHOP/SHOPITEM">   
      <report test="count(PRODUCT) != 1">element SHOPITEM musí obsahovat právě jednu položku PRODUCT</report>
      <report test="count(DESCRIPTION) != 1">element SHOPITEM musí obsahovat právě jednu položku DESCRIPTION</report>
      <report test="count(URL) != 1">element SHOPITEM musí obsahovat právě jednu položku URL</report>
      <report test="count(AVAILABILITY) != 1">element SHOPITEM musí obsahovat právě jednu položku AVAILABILITY</report>
      <report test="count(IMGURL) != 1">element SHOPITEM musí obsahovat právě jednu položku IMGURL</report>
      <report test="count(PRICE) != 1">element SHOPITEM musí obsahovat právě jednu položku PRICE</report>
      <report test="count(TYPE) != 1">element SHOPITEM musí obsahovat právě jednu položku TYPE</report>
      <report test="count(SIZE) != 1">element SHOPITEM musí obsahovat právě jednu položku SIZE</report>
      <report test="count(TAG) != 1">element SHOPITEM musí obsahovat právě jednu položku TAG</report>
      <report test="count(FUNCTION_TYPE) != 1">element SHOPITEM musí obsahovat právě jednu položku FUNCTION_TYPE</report>
	  <report test="count(MANUFACTURER_NAME) != 1">element SHOPITEM musí obsahovat právě jednu položku MANUFACTURER_NAME</report>
    </rule>
  </pattern>
	
 <!-- TYPE elementy -->
  <pattern name="Element TYPE musí obsahovat všechny následující elementy">
    <rule context="/SHOP/SHOPITEM/TYPE">   
      <report test="count(TYPEITEM) &lt; 1">element TYPE musí obsahovat nejméně jednu položku TYPEITEM </report>
    </rule>
  </pattern>

 <!-- SIZE elementy -->
  <pattern name="Element TAG musí obsahovat všechny následující elementy">
    <rule context="/SHOP/SHOPITEM/SIZE">   
      <report test="count(SIZEITEM) &lt; 1">element SIZE musí obsahovat nejméně jednu položku SIZEITEM </report>
    </rule>
  </pattern>

 <!-- TAG elementy -->
  <pattern name="Element TAG musí obsahovat všechny následující elementy">
    <rule context="/SHOP/SHOPITEM/TAG">   
      <report test="count(TAGITEM) &lt; 1">element TAG musí obsahovat nejméně jednu položku TAGITEM </report>
    </rule>
  </pattern>

  <!-- unikatnost shopitem atributu id -->
  <pattern name="Duplicita ID položek">
    <rule context="/SHOP/SHOPITEM">
      <report test="count(../SHOPITEM[@id = current()/@id]) &gt; 1">Duplicitní id: <value-of select="@id"/> u elementu <name/>.</report>
    </rule>
  </pattern>	
 	
 
</schema> 

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="OV-collection" as="document-node()+" select="collection('../OV-xml/?select=*.xml')"/>
    
    
    <xsl:template match="/">
        <TEI>
          <xsl:copy-of select="teiHeader"/>
            
            <text>
                
                <xsl:apply-templates select="$OV-collection//text/back"/>

            </text>
            
        </TEI>
    </xsl:template>
    
    <xsl:template match="back">
        <xsl:variable name="filename" as="xs:string" select="base-uri() ! tokenize(., '/')[last()]"/>
        <div type="file">
            <head><xsl:value-of select="$filename"/></head>
            
            
            
            
        </div>
        
    </xsl:template>
    
    
    
    
    
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="DM-siteindex" as="document-node()" select="doc('https://digitalmitford.org/si.xml')"/>
    
    <xsl:template match="/">
        <xsl:variable name="sourcefile" as="document-node()" select="current()"/>
        <!--ebb: Add the Mitford SI schema lines -->
        <xsl:processing-instruction name="xml-model">
    <xsl:text>href="https://digitalmitford.org/schemas/out/si_ODD.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
  </xsl:processing-instruction>
        <xsl:processing-instruction name="xml-model">
            <xsl:text>href="https://digitalmitford.org/schemas/out/si_ODD.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
        </xsl:processing-instruction>
        <TEI>
          <teiHeader>
              <fileDesc>
                  <titleStmt>
                  <title>Proposed Site Index Entries from Our Village: Sketches of Rural Character and Scenery</title>
                  <editor ref="#scw">Samantha Webb</editor>
                  <sponsor>
                      <orgName>Mary Russell Mitford Society: Digital Mitford
                          Project</orgName>
                  </sponsor>
              </titleStmt>
              <editionStmt>
                  <edition>This file is born digital in TEI P5, date:
                      <xsl:value-of select="current-date()"/>. 
                      
                      </edition>
              </editionStmt>
                  <publicationStmt>
                      <p>Internal file for the Digital Mitford project team.</p>
                  </publicationStmt>
                  <sourceDesc>
                      <p>The source document on which this is based is a file of proposed new site index entries. 
                          The number of proposed site index entries in the source file is 
                          <xsl:value-of select="descendant::*[@xml:id] => count()"/>.</p>
                  </sourceDesc>
              </fileDesc>
              
          </teiHeader>
            
            <text>
               <body>            
                   <xsl:for-each select="$DM-siteindex//div">
                       <div type="{@type}">
                           <xsl:for-each select="child::*">
                               <xsl:if test="$sourcefile//*[@sortKey = current()/@sortKey]//*"> 
            
                               <xsl:copy select="current()">
                                   <xsl:for-each select="@*">
                                       <xsl:copy select="current()"/>
                                   </xsl:for-each>
                                   
                                    <xsl:apply-templates select="$sourcefile//*[@sortKey = current()/@sortKey]//*[@xml:id]">
                                        <xsl:sort select="@xml:id"/>
                                    </xsl:apply-templates>
                               </xsl:copy>
                               </xsl:if>
                           </xsl:for-each>
          
                       </div>
                   </xsl:for-each>
                   
               </body>
            </text>
            
        </TEI>
    </xsl:template>
    
  
    <xsl:template match="*[@xml:id]">
        <xsl:copy-of select="."/>
        
    </xsl:template>
    
    
    
    
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8" ?>
<!-- 


    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/
	Developed by DSpace @ Lyncode <dspace@lyncode.com>
	
	> http://www.openarchives.org/OAI/2.0/oai_dc.xsd

 -->
 
 
 <!-- die geänderten Stellen sind markiert mit MODIFIED -->
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:doc="http://www.lyncode.com/xoai"
	version="1.0">
	<xsl:output omit-xml-declaration="yes" method="xml" indent="yes" />
	
	<xsl:template match="/">
		<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
			xmlns:dc="http://purl.org/dc/elements/1.1/" 
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
			xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
			<!-- dc.title -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>
			<!-- dc.title.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>
			<!-- dc.creator -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='creator']/doc:element/doc:field[@name='value']">
				<dc:creator><xsl:value-of select="." /></dc:creator>
			</xsl:for-each>
			<!-- dc.contributor.author -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='author']/doc:element/doc:field[@name='value']">
				<dc:creator><xsl:value-of select="." /></dc:creator>
			</xsl:for-each>
			<!-- dc.contributor.* (!author) -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name!='author']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			<!-- dc.contributor -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			<!-- dc.subject -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element/doc:field[@name='value']">
				<dc:subject><xsl:value-of select="." /></dc:subject>
			</xsl:for-each>
			
			<!-- MODIFIED dc.subject.*  alle außer DDC werden unverändert weitergegeben -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element[not(@name='ddc')]/doc:element/doc:field[@name='value']">
				<dc:subject><xsl:value-of select="." /></dc:subject>
			</xsl:for-each>
			
			 <!-- MODIFIED dc.subject.ddc DDC/DNB-SG nach M.A.3-6 -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element[@name='ddc']/doc:element/doc:field[@name='value']">
					<dc:subject><xsl:value-of select='concat("ddc:", substring-before(., " "))' /></dc:subject>
			</xsl:for-each>
			
			<!-- dc.description -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element/doc:field[@name='value']">
				<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>
			<!-- dc.description.* (not provenance)-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name!='provenance']/doc:element/doc:field[@name='value']">
				<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>
			
			<!-- MODIFIED dc.date nur dc.date.issued wird ausgegeben, nach E.A.3-6
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each> -->
			
			<!-- MODIFIED dc.date nur dc.date.issued wird ausgegeben, nach E.A.3-6 -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='issued']/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="substring(.,0,11)" /></dc:date>
			</xsl:for-each>
			
			<!-- MODIFIED dc.type DINI-Publikationstypen nach M.A.3-5 -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:field[@name='value']">
				<dc:type><xsl:value-of select="concat('doc-type:', substring-before(substring-after(.,'['),']'))" /></dc:type>
			</xsl:for-each>
			<!-- dc.type.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:element/doc:field[@name='value']">
				<dc:type><xsl:value-of select="." /></dc:type>
			</xsl:for-each>
			<!-- dc.identifier -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
			<!-- dc.identifier.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
			
			<!-- MODIFIED dc.language wird aus der Sprachangabe von dc.title geholt, da kein dc.language vorhanden
			
			für M.A.3-7
			
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:field[@name='value']">
				<dc:language><xsl:value-of select="." /></dc:language>
			</xsl:for-each>
			
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:element/doc:field[@name='value']">
				<dc:language><xsl:value-of select="." /></dc:language>
			</xsl:for-each>
			
			-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element[./doc:field]/@name">
				<dc:language><xsl:value-of select="." /></dc:language>
			</xsl:for-each>
			
			
			<!-- dc.relation -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="." /></dc:relation>
			</xsl:for-each>
			<!-- dc.relation.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="." /></dc:relation>
			</xsl:for-each>
			
			<!-- MODIFIED  Ausgabe von rightsstatements.org-Verweis wenn keine CC-Lizenz vergeben (bei uns: kein dc.rights.uri) Siehe M.4-10 -->
			<!-- dc.rights -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:field[@name='value']">
				<dc:rights><xsl:value-of select="." /></dc:rights>
			</xsl:for-each>
			<!-- dc.rights.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element[not(@name='uri')]/doc:element/doc:field[@name='value']">
				<dc:rights><xsl:value-of select="." /></dc:rights>
			</xsl:for-each>
			<xsl:choose>
				<xsl:when test="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element[@name='uri']/doc:element">
					<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element[@name='uri']/doc:element/doc:field[@name='value']">
						<dc:rights><xsl:value-of select="." /></dc:rights>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<dc:rights>http://rightsstatements.org/vocab/InC/1.0/</dc:rights>
				</xsl:otherwise>
			</xsl:choose>
			
			<!-- dc.format -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='format']/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- dc.format.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='format']/doc:element/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- ? -->
			<xsl:for-each select="doc:metadata/doc:element[@name='bundles']/doc:element[@name='bundle']/doc:field[@name='name'][text()='ORIGINAL']/../doc:element[@name='bitstreams']/doc:element[@name='bitstream']/doc:field[@name='format']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- dc.coverage -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element/doc:field[@name='value']">
				<dc:coverage><xsl:value-of select="." /></dc:coverage>
			</xsl:for-each>
			<!-- dc.coverage.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element/doc:element/doc:field[@name='value']">
				<dc:coverage><xsl:value-of select="." /></dc:coverage>
			</xsl:for-each>
			<!-- dc.publisher -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:field[@name='value']">
				<dc:publisher><xsl:value-of select="." /></dc:publisher>
			</xsl:for-each>
			<!-- dc.publisher.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:element/doc:field[@name='value']">
				<dc:publisher><xsl:value-of select="." /></dc:publisher>
			</xsl:for-each>
			<!-- dc.source -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='source']/doc:element/doc:field[@name='value']">
				<dc:source><xsl:value-of select="." /></dc:source>
			</xsl:for-each>
			<!-- dc.source.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='source']/doc:element/doc:element/doc:field[@name='value']">
				<dc:source><xsl:value-of select="." /></dc:source>
			</xsl:for-each>
		</oai_dc:dc>
	</xsl:template>
</xsl:stylesheet>

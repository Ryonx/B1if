<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:b1e="urn:com.sap.b1i.sim:b1event" xmlns:b1ie="urn:com.sap.b1i.sim:b1ievent" xmlns:bfa="urn:com.sap.b1i.bizprocessor:bizatoms" xmlns:jdbc="urn:com.sap.b1i.adapter:jdbcadapter" xmlns:rfc="urn:sap-com:document:sap:rfc:functions" xmlns:sim="urn:com.sap.b1i.sim:entity" xmlns:utils2="com.sap.b1i.bpc_tools.Utilities" xmlns:vpf="urn:com.sap.b1i.vplatform:entity" xmlns:xci="urn:com.sap.b1i.xcellerator:intdoc" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" bfa:force="" vpf:force="" jdbc:force="" rfc:force="" b1ie:force="" b1e:force="" xci:force="" sim:force="" utils2:force=""><xsl:output method="xml" encoding="UTF-8" indent="yes"></xsl:output><xsl:param name="atom"></xsl:param><xsl:param name="sessionid"></xsl:param><xsl:variable name="msg" select="/vpf:Msg/vpf:Body/vpf:Payload[./@Role=&apos;S&apos;]"></xsl:variable><xsl:variable name="vpSender" select="/vpf:Msg/vpf:Header/vpf:Sender/@Id"></xsl:variable><xsl:variable name="vpObject" select="/vpf:Msg/vpf:Header/vpf:Sender/@ObjId"></xsl:variable><xsl:variable name="vpReceiver" select="/vpf:Msg/vpf:Header/vpf:ReceiverList/vpf:Receiver[./@handover=&apos;P&apos;]/@Id"></xsl:variable><xsl:template match="/">
		<Msg xmlns="urn:com.sap.b1i.vplatform:entity">
			<xsl:copy-of select="/vpf:Msg/@*"></xsl:copy-of>
			<xsl:copy-of select="/vpf:Msg/vpf:Header"></xsl:copy-of>
			<Body>
				<xsl:copy-of select="/vpf:Msg/vpf:Body/*"></xsl:copy-of>
				<Payload Role="X" id="{$atom}">
					<xsl:call-template name="transform"></xsl:call-template>
				</Payload>
			</Body>
		</Msg>
	</xsl:template><xsl:template name="transform">
		
			
				
					<BOM xmlns="">
						<BO>
							<AdmInfo>
								<Object>13</Object>
								<Version>2</Version>
							</AdmInfo>
							<Documents>
								<row>
									<DocDueDate>
										<xsl:value-of select="document(&apos;./MsgPersist.xml&apos;)/vpf:Payload/BOM/BO/Documents/row/DocDueDate"></xsl:value-of>
									</DocDueDate>
									<CardCode>
										<xsl:value-of select="document(&apos;./MsgPersist.xml&apos;)/vpf:Payload/BOM/BO/Documents/row/CardCode"></xsl:value-of>
									</CardCode>
									<TaxDate>
										<xsl:value-of select="document(&apos;./MsgPersist.xml&apos;)/vpf:Payload/BOM/BO/Documents/row/TaxDate"></xsl:value-of>
									</TaxDate>
								</row>
							</Documents>
							<Document_Lines>
								<row>
									<ItemCode>
										<xsl:value-of select="row/ItemCode"></xsl:value-of>
									</ItemCode>
									<Quantity><xsl:value-of select="row/Quantity"></xsl:value-of></Quantity>
									<UnitPrice><xsl:value-of select="row/UnitPrice"></xsl:value-of></UnitPrice>
								</row>
							</Document_Lines>
						</BO>
					</BOM>
	</xsl:template></xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 
<xsl:output method="xml" />
<xsl:template match="UsrReservationMeetingRoom">
	<UsrReservationMeetingRoom>
	<FreeString47>
		<xsl:value-of select="SessionID"/>
	</FreeString47>
	<FreeString44>
		<xsl:value-of select="ActivityID"/>
	</FreeString44>
	<FreeString6>
		<xsl:value-of select="ActivityCode"/>
	</FreeString6>
	<Description>	
		<xsl:value-of select="CourseTitle"/>
	</Description>
	
				<xsl:variable name="x" select="StartTime"/>
 		<xsl:variable name="y" select="substring(SessionStartDate, 7,4)"/>
		<xsl:variable name="m" select="substring(SessionStartDate, 4,2)"/>
		<xsl:variable name="d" select="substring(SessionStartDate, 1,2)"/>
		<xsl:variable name="h" select="substring(StartTime, 1,1)"/>
		<xsl:variable name="hh" select="substring(StartTime, 1,2)"/>
		<xsl:variable name="min" select="substring(StartTime, 3,2)"/>
		<xsl:variable name="minmin" select="substring(StartTime, 4,2)"/>
		
	<BeginDateTime>
	<xsl:choose>
				<xsl:when test="string-length($x) = 10 and substring(StartTime, 9,2) = 'AM'">
				<xsl:value-of select="concat($y, '-', $m, '-', $d, 'T', '0', $h, ':', $min, ':', '00')"/>
				</xsl:when>
				<xsl:when test="string-length($x) = 10 and substring(StartTime, 9,2) = 'PM'">
				<xsl:value-of select="concat($y, '-', $m, '-', $d, 'T', $h+12, ':', $min, ':', '00')"/>
				</xsl:when>
				<xsl:when test="string-length($x) = 11">
				<xsl:value-of select="concat($y, '-', $m, '-', $d, 'T', $hh, ':', $minmin, ':', '00')"/>
				</xsl:when>
				
	</xsl:choose>	
	</BeginDateTime>			
	
		<xsl:variable name="x2" select="EndTime"/>
 		<xsl:variable name="y2" select="substring(SessionStartDate, 7,4)"/>
		<xsl:variable name="m2" select="substring(SessionStartDate, 4,2)"/>
		<xsl:variable name="d2" select="substring(SessionStartDate, 1,2)"/>
		<xsl:variable name="h2" select="substring(EndTime, 1,1)"/>
		<xsl:variable name="hh2" select="substring(EndTime, 1,2)"/>
		<xsl:variable name="min2" select="substring(EndTime, 3,2)"/>
		<xsl:variable name="minmin2" select="substring(EndTime, 4,2)"/>
	<EndDateTime>
	<xsl:choose>
				<xsl:when test="string-length($x2) = 10 and substring(EndTime, 9,2) = 'AM'">
				<xsl:value-of select="concat($y2, '-', $m2, '-', $d2, 'T', '0', $h2, ':', $min2, ':', '00')"/>
				</xsl:when>
				<xsl:when test="string-length($x2) = 10 and substring(EndTime, 9,2) = 'PM'">
				<xsl:value-of select="concat($y2, '-', $m2, '-', $d2, 'T', $h2+12, ':', $min2, ':', '00')"/>
				</xsl:when>
				<xsl:when test="string-length($x2) = 11">
				<xsl:value-of select="concat($y2, '-', $m2, '-', $d2, 'T', $hh2, ':', $minmin2, ':', '00')"/>
				</xsl:when>
				
	</xsl:choose>
	</EndDateTime>	 	
	
	<OrderGroupRef>	
	<xsl:text>02.01</xsl:text>
	</OrderGroupRef>
	<PropertyRef>
				<xsl:value-of select="'9999'"/>
	</PropertyRef>
	<!-- trainer assignment START -->
	<xsl:variable name="pText" select="TrainerID"/>
	<xsl:variable name="pText2" select="substring-after($pText, '|')"/>
	<xsl:variable name="pText3" select="substring-after($pText2, '|')"/>
	<xsl:variable name="pText4" select="substring-after($pText3, '|')"/>
	<xsl:variable name="pText5" select="substring-after($pText4, '|')"/>
    <InternalRequestorPersonRef><xsl:value-of select="substring-before(concat($pText,'|'),'|')"/></InternalRequestorPersonRef>
    <InternalAssignedByPersonRef><xsl:value-of select="substring-before(concat($pText2,'|'),'|')"/></InternalAssignedByPersonRef> 
	<FreeString32><xsl:value-of select="substring-before(concat($pText3,'|'),'|')"/></FreeString32>
	<FreeString41><xsl:value-of select="substring-before(concat($pText4,'|'),'|')"/></FreeString41>
	<FreeString31><xsl:value-of select="substring-before(concat($pText5,'|'),'|')"/></FreeString31>
	
	<!-- trainer assignment END -->
	<FreeString20><xsl:value-of select="ProgramOwnerID"/></FreeString20>
	
	<xsl:variable name="lc">abcdefghijklmnopqrstuvwxyz</xsl:variable>
	<xsl:variable name="uc">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>

	
	<SpaceRef><xsl:choose>
				<xsl:when test="translate(Room,$uc,$lc) = 'hong kong' ">
				<xsl:value-of select="'2.1'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'jakarta' ">
				<xsl:value-of select="'2.2'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'mumbai' ">
				<xsl:value-of select="'2.3'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'singapore' ">
				<xsl:value-of select="'2.4'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'new delhi' ">
				<xsl:value-of select="'2.5'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'seoul' ">
				<xsl:value-of select="'2.6'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'taipei' ">
				<xsl:value-of select="'2.7'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'beijing' ">
				<xsl:value-of select="'2.8'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'guangzhou' ">
				<xsl:value-of select="'2.9'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'shanghai' ">
				<xsl:value-of select="'2.10'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'dubai' ">
				<xsl:value-of select="'3.1'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'london' ">
				<xsl:value-of select="'3.2'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'new york' ">
				<xsl:value-of select="'3.3'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'sydney' ">
				<xsl:value-of select="'3.4'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'tokyo' ">
				<xsl:value-of select="'3.5'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'bangkok' ">
				<xsl:value-of select="'4.1'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'hanoi' ">
				<xsl:value-of select="'4.2'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'labuan' ">
				<xsl:value-of select="'4.3'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'manila' ">
				<xsl:value-of select="'4.4'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'yangon' ">
				<xsl:value-of select="'4.5'"/>
				</xsl:when>			
				</xsl:choose></SpaceRef>
	<ReservationUnitRef>	
				<xsl:choose>
				<xsl:when test="translate(Room,$uc,$lc) = 'hong kong' ">
				<xsl:value-of select="'2.1'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'jakarta' ">
				<xsl:value-of select="'2.2'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'mumbai' ">
				<xsl:value-of select="'2.3'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'singapore' ">
				<xsl:value-of select="'2.4'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'new delhi' ">
				<xsl:value-of select="'2.5'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'seoul' ">
				<xsl:value-of select="'2.6'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'taipei' ">
				<xsl:value-of select="'2.7'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'beijing' ">
				<xsl:value-of select="'2.8'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'guangzhou' ">
				<xsl:value-of select="'2.9'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'shanghai' ">
				<xsl:value-of select="'2.10'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'dubai' ">
				<xsl:value-of select="'3.1'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'london' ">
				<xsl:value-of select="'3.2'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'new york' ">
				<xsl:value-of select="'3.3'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'sydney' ">
				<xsl:value-of select="'3.4'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'tokyo' ">
				<xsl:value-of select="'3.5'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'bangkok' ">
				<xsl:value-of select="'4.1'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'hanoi' ">
				<xsl:value-of select="'4.2'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'labuan' ">
				<xsl:value-of select="'4.3'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'manila' ">
				<xsl:value-of select="'4.4'"/>
				</xsl:when>
				<xsl:when test="translate(Room,$uc,$lc) = 'yangon' ">
				<xsl:value-of select="'4.5'"/>
				</xsl:when>			
				</xsl:choose>
		</ReservationUnitRef>	
	
		</UsrReservationMeetingRoom>
		
	</xsl:template> 
	
 </xsl:stylesheet>

 
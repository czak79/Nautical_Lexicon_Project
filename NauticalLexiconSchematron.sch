<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
<sch:pattern>
    
    <sch:rule context="*">
        <sch:let name="id" value="@xml:id"/>
        <sch:report test="preceding-sibling::element()[@xml:id = $id]">
            This @xml:id is already in use.
        </sch:report>
    </sch:rule>
    
    <sch:rule context="tei:list//tei:item/@ref">
        <sch:let name="termstandoff" value="doc('https://raw.githubusercontent.com/czak79/Nautical_Lexicon_Project/main/NauticalLexiconTermStandoff.xml')"/>
        <sch:let name="termIDs"
            value="$termstandoff//tei:item/@xml:id"/>
        <sch:let name="termRefValues" value="for $i in $termIDs return concat('#', $i)"></sch:let>
        <sch:let name="error" value ="."/>
        <sch:assert test=". = $termRefValues" role="warning">
            <sch:value-of select="$error"/> is not currently in use.
            Acceptable values: <sch:value-of select="string-join($termRefValues, ', ')"/>
            <!-- For each term item, there should be a unique xml:id -->
        </sch:assert>        
    </sch:rule>
    
    <sch:rule context="tei:orth/@ref">
        <sch:let name="subjectindexstandoff" value="doc('https://raw.githubusercontent.com/czak79/Nautical_Lexicon_Project/main/NauticalLexiconSubjectIndexStandoff.xml')"/>
        <sch:let name="subjectindexIDs"
            value="$subjectindexstandoff//tei:orth/@xml:id"/>
        <sch:let name="subjectIndexRef" value="for $i in $subjectindexIDs return concat('#', $i)"></sch:let>
        <sch:let name="error" value ="."/>
        <sch:assert test=". = $subjectIndexRef" role="warning">
            <sch:value-of select="$error"/> is not currently in use.
            Acceptable values: <sch:value-of select="string-join($subjectIndexRef, ', ')"/>
            <!-- For each subject index header, there should be a unique xml:id -->
            <!-- Each term in a subject index should have an xml:id that matches that of the term ID standoff list -->
        </sch:assert>        
    </sch:rule>
    
    <sch:rule context="tei:bibl/@ref">
        <sch:let name="biblstandoff" value="doc('https://raw.githubusercontent.com/czak79/Nautical_Lexicon_Project/main/NauticalLexiconSubjectIndexStandoff.xml')"/>
        <sch:let name="biblIDs"
            value="$biblstandoff//tei:bibl/@xml:id"/>
        <sch:let name="biblRefValues" value="for $i in $biblIDs return concat('#', $i)"></sch:let>
        <sch:let name="error" value ="."/>
        <sch:assert test=". = $biblRefValues" role="warning">
            <sch:value-of select="$error"/> is not currently in use.
            Acceptable values: <sch:value-of select="string-join($biblRefValues, ', ')"/>
            <!-- For each bibliographic entry, there should be a unique xml:id -->
        </sch:assert>        
    </sch:rule>
    
</sch:pattern>
</sch:schema>
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
        
    </sch:pattern>
    
</sch:schema>
    <cffunction  name="displayFunc" access="remote">
        <cfargument  name="key">
        <cfargument  name="value">
        <cfapplication name="structures" sessionTimeout=#CreateTimeSpan(0, 0, 0, 60)# sessionManagement="Yes">
        <cfif NOT StructKeyExists(Session, "mystruct" )>
        <cflock timeout=20 scope="Session" type="Exclusive">
        <cfset Session.mystruct=structNew()>
        </cflock>
        </cfif>
        <cfif StructKeyExists(Session, "mystruct" )>
        <cfif IsDefined("key") AND IsDefined("value")>
        <cfif StructKeyExists(Session.mystruct,"#key#")>
        <p>Key Already exist</p>
        </cfif>
        <cfif NOT StructKeyExists(Session.mystruct,"#key#")>
        <cfset Session.mystruct["#key#"]=#value#>
        </cfif>
        </cfif>
        </cfif>
        <cfreturn Session.mystruct>
    </cffunction>
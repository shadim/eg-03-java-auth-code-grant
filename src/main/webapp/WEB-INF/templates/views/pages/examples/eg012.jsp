<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../partials/head.jsp"/>

<h4>12. Embedded DocuSign web tool</h4>
<p>Redirect the user to the DocuSign web tool.</p>
<p>Use this API call to open the DocuSign web tool, the NDSE (New DocuSign Signing Experience),
    with the user already logged in.</p>
<p>The starting view can be either an envelope's documents or the web tool's front page.</p>
<p>The user does not necessarily return from the NDSE, so using this API call is often a final
    step for your application.
    Or you can open the NDSE in a new tab for the user.
</p>

<c:if test="${showDoc}">
    <p><a target='_blank' href='${documentation}'>Documentation</a> about this example.</p>
</c:if>


<p>API method used:
    <a target='_blank'
       href="https://developers.docusign.com/esign-rest-api/reference/Envelopes/EnvelopeViews/createConsole">EnvelopeViews::createConsole</a>.
</p>

<p>
    View source file <a target="_blank" href="${source}">EG012ControllerEmbeddedConsole.java</a> on GitHub.
</p>
<c:if test="${not envelopeOk}">
    <p><b>Optional:</b> to use the <i>Envelope's document view</i> please first create an envelope using
        <a href="eg002">example 2.</a></p>
</c:if>


<form class="eg" action="" method="post" data-busy="form">
    <div class="form-group">
        <label for="startingView">Starting View</label>
        <select id="startingView" name="startingView" class="form-control">
            <option value="frontPage" selected>Front page</option>
            <option value="envelope" ${envelopeOk ? '' : 'disabled="true"'} >
                The envelope's documents view
            </option>
        </select>
    </div>
    <input type="hidden" name="_csrf" value="${csrfToken}">
    <button type="submit" class="btn btn-primary">Continue</button>
</form>

<jsp:include page="../../partials/foot.jsp"/>

<div class="verticalTabs">
    <ul class="nav">
        <li class="block ${params.type ? '' : 'selected'}"><strong><a href="${createLink(controller: params.controller, action: params.action, id: params.id)}"><g:message code="openfurry.allUO" default="All" /></a></strong></li>
        <li class="block ${params.type == 'image' ? 'selected' : ''}"><strong><a href="${createLink(controller: params.controller, action: params.action, id: params.id)}?type=image"><g:message code="openfurry.imageUO.plural" default="Images" /></a></strong></li>
        <li class="block ${params.type == 'text' ? 'selected' : ''}"><strong><a href="${createLink(controller: params.controller, action: params.action, id: params.id)}?type=text"><g:message code="openfurry.textUO.plural" default="Text" /></strong></a></li>
        <li class="block ${params.type == 'audio' ? 'selected' : ''}"><strong><a href="${createLink(controller: params.controller, action: params.action, id: params.id)}?type=audio"><g:message code="openfurry.audioUO.plural" default="Audio" /></strong></a></li>
        <li class="block ${params.type == 'video' ? 'selected' : ''}"><strong><a href="${createLink(controller: params.controller, action: params.action, id: params.id)}?type=video"><g:message code="openfurry.videoUO.plural" default="Videos" /></strong></a></li>
        <li class="block ${params.type == 'flash' ? 'selected' : ''}"><strong><a href="${createLink(controller: params.controller, action: params.action, id: params.id)}?type=flash"><g:message code="openfurry.flashUO.plural" default="Flash" /></strong></a></li>
        <li class="block ${params.type == 'application' ? 'selected' : ''}"><strong><a href="${createLink(controller: params.controller, action: params.action, id: params.id)}?type=application"><g:message code="openfurry.applicationUO.plural" default="Applications" /></a></strong></li>
        <li class="block ${params.type == 'orderedCollection' ? 'selected' : ''}"><strong><a href="${createLink(controller: params.controller, action: params.action, id: params.id)}?type=orderedCollection"><g:message code="openfurry.collection.ordered.plural" default="Ordered collections" /></a></strong></li>
        <li class="block ${params.type == 'unorderedCollection' ? 'selected' : ''}"><strong><a href="${createLink(controller: params.controller, action: params.action, id: params.id)}?type=unorderedCollection"><g:message code="openfurry.collection.unordered.plural" default="Unordered collections" /></a></strong></li>
    </ul>
    <div class="content block">
        <g:set var="dateString" value="" />
        <g:each in="${uoList}" var="uo" status="count">
            <g:if test="${dateString != formatDate(date: uo.dateCreated, format: 'yyyy-MM-dd')}">
            <h3 style="margin-bottom: 0.5em"><g:formatDate date="${uo.dateCreated}" format="EEEEEEEEEEE MMMMMMMMMMMM d, yyyy" /></h3>
            <g:set var="dateString" value="${formatDate(date: uo.dateCreated, format: 'yyyy-MM-dd')}" />
            </g:if>
            <div class="submission" style="width: 25%; display: block; float: left; text-align: center; margin-bottom: 1em">
                <a href="${createLink(controller: 'view', action: 'show', id: uo.id)}">
                    <img src="${resource(file: uo.thumbnail)}" /><br />
                    ${uo.title}
                </a><br />
                <g:link controller="person" action="show" params="[username: uo.owner.username]">~${uo.owner.username}</g:link>
            </div>
        </g:each>
        <g:if test="${uoList.size() < 1}"><g:message code="openfurry.technical.noSubmissions" default="No submissions to list" /></g:if>
        <hr style="width: 50%; clear: both; margin: auto">
        <g:paginate total="${uoList.size()}" params="${params}" max="16" />
    </div>
</div>

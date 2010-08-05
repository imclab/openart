<head>
	<meta name="layout" content="main" />
	<title>User Registration</title>
</head>

<body>

    <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${person}">
    <div class="errors">
        <g:renderErrors bean="${person}" as="list" />
    </div>
    </g:hasErrors>

    <g:form action="save">
    <div class="dialog">
    <table>
    <tbody>

        <tr class='prop'>
            <th valign='top' class='name'><label for='username'><g:message code="openfurry.user.username" default="Username" /></label></th>
            <td valign='top' class='value ${hasErrors(bean:person,field:'username','errors')}'>
                <input type="text" name='username' value="${person?.username?.encodeAsHTML()}"/>
            </td>
        </tr>

        <tr class='prop'>
            <th valign='top' class='name'><label for='userRealName'><g:message code="openfurry.user.userRealName" default="Display name" /></label></th>
            <td valign='top' class='value ${hasErrors(bean:person,field:'userRealName','errors')}'>
                <input type="text" name='userRealName' value="${person?.userRealName?.encodeAsHTML()}"/>
            </td>
        </tr>

        <tr class='prop'>
            <th valign='top' class='name'><label for='passwd'><g:message code="openfurry.user.password" default="Password" /></label></th>
            <td valign='top' class='value ${hasErrors(bean:person,field:'passwd','errors')}'>
                <input type="password" name='passwd' />
            </td>
        </tr>

        <tr class='prop'>
            <th valign='top' class='name'><label for='repasswd'><g:message code="openfurry.user.confirmPassword" default="Confirm password" /></label></th>
            <td valign='top' class='value ${hasErrors(bean:person,field:'passwd','errors')}'>
                <input type="password" name='repasswd' />
            </td>
        </tr>

        <tr class='prop'>
            <th valign='top' class='name'><label for='email'>Email:</label></th>
            <td valign='top' class='value ${hasErrors(bean:person,field:'email','errors')}'>
                <input type="text" name='email' value="${person?.email?.encodeAsHTML()}"/>
            </td>
        </tr>

        <tr class="prop">
            <th class="name"><label for="species.id">Species:</label></th>
            <td class="value ${hasErrors(bean: person, field: 'species', 'errors')}">
                <select name="species.id">
                    <of:speciesOptions fromPerson="${person}" />
                </select>
            </td>
        </tr>

        <g:if test="${grailsApplication.config.openfurry.requireInvitation}">
            <tr class="prop">
                <th class="name"><label for="invitationCode"><g:message code="openfurry.userInvitation.code" default="Invitation Code" /></label></th>
                <td class="value"><g:textField name="invitationCode" value="${params?.invitationCode ?: ''}" /></td>
            </tr>
        </g:if>

        <tr class="prop" style="display: none">
            <th class="name"><label for="hp"><g:message code="openfurry.user.honeypot" default="Do not enter anything in this field; if you do, your registration will be rejected" />
            <td class="value"><input type="text" name="hp" /></td>
        </tr>

        <input type="hidden" name="tstart" value="${tstart}" />

    </tbody>
    </table>
    </div>

    <div class="buttons">
        <span class="formButton">
            <input class='save' type="submit" value="Create"></input>
        </span>
    </div>

    </g:form>
</body>

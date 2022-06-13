
<#include "admin-panel.ftlh">

<h2>List of Users</h2>
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Role</th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td><#list user.roles as role>${role}<#sep>, </#list></td>
            <td><a href="/admin-panel/users/${user.userid}">edit</a></td>
            <td><a href="/admin-panel/users/delete/${user.userid}">delete</a></td>
        </tr>
    </#list>
    </tbody>
</table>

<#include "admin-panel.ftlh">

<h2>List of Concerts</h2>
<table>
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Date</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <#list concerts as concert>
        <tr>
            <td>${concert.id}</td>
            <td>${concert.name}</td>
            <td>${concert.date}</td>
            <td><a href="/concerts/${concert.id}">edit</a></td>
        </tr>
    </#list>
    </tbody>
</table>
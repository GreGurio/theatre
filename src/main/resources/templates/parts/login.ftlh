<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label"> User Name :  </label>
            <div class="col-sm-6">
                <input class="form-control" type="text" name="username" placeholder="Username"/>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label"> Password:  </label>
            <div class="col-sm-6">
                <input class="form-control" type="password" name="password" placeholder="Password"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
        <div><button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign In</#if></button></div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
            <button type="submit" class="register-btn">ВИЙТИ</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
    </form>
</#macro>
<#macro login path isRegisterForm>

    <form action="" method="POST" class="reg-form" id="register-form">


        <div class="inputs-cont">
            <!--
            <p>
                <label for="name">ПІБ</label>
              <input type="text" name="name" required>
            </p>-->

            <p class="nickname">
                <label for="username">Нікнейм</label>
                <input type="text" name="username" required>
            </p>
            <!--
            <p class="nickname">
                <label for="email1">E-mail</label>
                <input type="email" name="email1" required>
            </p>
            -->

            <p>
                <label for="password">Пароль</label>
                <input type="password" name="password" required>
            </p>
            <!--
                                <p>
                                    <label for="password2">Підтвердити пароль</label>
                                    <input type="password" name="password2" required>
                                </p>
                        -->
            <!--
            <p>
                <label for="birthday">Дата народження</label>
                <input type="date" name="birthday" required>
            </p>
            -->
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <#if !isRegisterForm><a href="/registration" style="color: #fff; margin-left: -45px">Зареєструватись</a></#if>
            <p class="for-button">
                <input type="submit" name="" value="<#if isRegisterForm>ЗАРЕЄСТРУВАТИСЬ<#else>ВВІЙТИ</#if>" id="form-btn">
            </p>
        </div>
    </form>

</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <button type="submit" class="register-btn">ВИЙТИ</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
    </form>
</#macro>
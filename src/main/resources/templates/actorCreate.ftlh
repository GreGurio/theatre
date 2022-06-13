<#import "admin-panel2.ftlh" as admin>

<@admin.adminpanel2>


<div class="admin-container">
    <div class="admin-wrapper">
        <a href="" class="admin-general-link">
            <img src="/static/img/logo/logo-black.png" alt="" class="admin-general-img">
        </a>
        <p class="admin-header">Додати актора</p>
        <form method="post" action="" class="admin-form" enctype="multipart/form-data">
        <label class="input-label" for="name">Ім'я</label>
        <input type="text" name="name" class="admin-input" required>
        <label class="input-label" for="name">Прізвище</label>
        <input type="text" name="surname" class="admin-input" required>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
        <label class="file-label">
            <p class="file-header">
                Додати файл
            </p>
            <input type="file" name="file" class="admin-file-input" required>
        </label>

        <input type="submit" class="submit-button">
        </form>
        ${message?ifExists}
    </div>
</div>

</@admin.adminpanel2>
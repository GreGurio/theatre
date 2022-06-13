<#import "admin-panel2.ftlh" as admin>

<@admin.adminpanel2>


    <div class="admin-container">
        <div class="admin-wrapper">
            <a href="" class="admin-general-link">
                <img src="/static/img/logo/logo-black.png" alt="" class="admin-general-img">
            </a>
            <p class="admin-header">Редагувати працівника</p>
            <form method="post" action="" class="admin-form" enctype="multipart/form-data">
                <label class="input-label" for="name">Ім'я</label>
                <input type="text" name="name" class="admin-input" value="${worker.name}" required>
                <label class="input-label" for="name">Прізвище</label>
                <input type="text" name="surname" class="admin-input" value="${worker.surname}" required>
                <label class="input-label" for="name">Посада</label>
                <input type="text" name="position" class="admin-input" value="${worker.position}" required>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <label class="file-label">
                    <p class="file-header">
                        Додати файл
                    </p>
                    <input type="file" name="file" class="admin-file-input">
                </label>

                <input type="submit" class="submit-button">
            </form>
        </div>
    </div>

</@admin.adminpanel2>
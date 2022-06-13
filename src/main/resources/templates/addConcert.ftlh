<#import "admin-panel2.ftlh" as admin>

<@admin.adminpanel2>

<main class="main-window">
    <!-- CREATING FORM -->

    <div class="creating-form-container">
        <form action="" method="POST" class="form-content" id="create-spectacle-form" enctype="multipart/form-data">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <a href="/"><div class="form-logo"><img src="/static/img/logo/logo-black.png"></div></a>
            <div class="inputs-cont">
                <div class="some-text-container">
                    <p>
                        <label for="name">Назва</label>
                        <input type="text" name="name">
                    </p>

                    <p>
                        <label for="date">Дата проведення</label>
                        <input type="date" name="date">
                    </p>

                    <p class="spectacle-members">
                        <label for="members">Учасники спектаклю</label>
                        <textarea class="spectacle-members-input" name="members"></textarea>
                    </p>

                    <p class="spectacle-description">
                        <label for="description">Опис</label>
                        <textarea class="spectacle-description-input" name="description"> </textarea>
                    </p>

                </div>

                <div class="images-container">
                    <p class="main-image-container">
                        <label for="main-img"><img src="/static/img/icons/main-image-placeholder.png" alt="main image"></label>
                        <input type="file" accept="image/*" name="file" class="inputfile">
                    </p>
                    <div class="secondary-images-container">
                        <p>
                            <label for="first-image"><img src="/static/img/icons/secondary-image-placeholder.png" alt="first image"></label>
                            <input type="file"  name="files" class="inputfile" multiple="multiple">
                        </p>


                    </div>

                    <p class="for-button for-button2">
                        <input type="submit" name="" value="Створити" id="create-form-submit-btn">

                    </p>
                </div>
            </div>
        </form>

    </div>

</main>

</div>

</@admin.adminpanel2>
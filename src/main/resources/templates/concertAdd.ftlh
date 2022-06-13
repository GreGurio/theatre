<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/static/css/spectacle-control-create.css">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <link rel="icon" type="image/ico" href="/static/img/icons/favicon.ico"/>
    <title>Створення спектаклю</title>
</head>
<body>

<div class="wrapper">
    <!-- NAVIGATION -->
    <aside class="admin-aside">
        <nav>
            <ul>
                <li><div class="main-menu"><img src="/static/img/icons/gear.png">Панель керування</div></li>
                <li><a href="/admin-panel/users"><img src="/static/img/icons/user-control-icon.png" class="user-control-img">Керування користувачами</a></li>
                <li><a href="/admin-panel/concerts"><img src="/static/img/icons/spectacles-control-icon.png" class="spectacle-control-img">Керування спектаклями</a></li>
                <li><a href="/admin-panel/statistics"><img src="/static/img/icons/statistics-icon.png" class="statistics-img">Статистика популярності</a></li>
                <li><a href="/admin-panel/actors/"><img src="/static/img/icons/statistics-icon.png" class="statistics-img">Керування акторами</a></li>
                <li><a href="/admin-panel/workers/"><img src="/static/img/icons/statistics-icon.png" class="statistics-img">Керування працівниками</a></li>
                <li><a href="/"><img src="/static/img/icons/exit-icon.png" class="exit-img">Вихід</a></li>
            </ul>
        </nav>
    </aside>

    <!-- MAIN -->

    <main class="main-window">
        <!-- CREATING FORM -->

        <div class="creating-form-container">
            <form action="" method="POST" class="form-content" id="create-spectacle-form" enctype="multipart/form-data">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <div class="form-logo"><img src="/static/img/icons/logo-black.png"></div>
                <div class="inputs-cont">
                    <div class="some-text-container">
                        <p class="container-margin">
                            <label for="name">Назва</label>
                            <input type="text" name="name" required>
                        </p>

                        <p class="container-margin">
                            <label for="date">Дата проведення</label>
                            <input type="datetime-local" name="date" required>
                        </p>

                        <!-- ACTORS -->

                        <p class="spectacle-members ">
                            <label for="members">Учасники спектаклю</label>
                        <div class="datalist-container" name="members">
                            <input class="addActor" list="actors" id="actorsListContent">
                            <button class="datalist-btn" onclick="addActorIntoSpectacle()" type="button">Додати</button>
                            <datalist id="actors">
                                <#list actors as actor>
                                <option value="${actor.name} ${actor.surname}">
                                </#list>
                            </datalist>
                        </div>
                        <div class="spectacle-members-input container-margin" name="members" id="spectacleMembers">

                        </div>
                        </p>

                        <!-- WORKERS -->

                        <p class="spectacle-members">
                            <label for="workers">Працівники</label>
                        <div class="datalist-container" name="workers">
                            <input class="addActor" list="workers" id="workersListContent">
                            <button class="datalist-btn" onclick="addWorkerIntoSpectacle()" type="button">Додати</button>
                            <datalist id="workers">
                                <#list workers as worker>
                                <option value="${worker.name} ${worker.surname}">
                                </#list>
                            </datalist>
                        </div>
                        <div class="spectacle-members-input" name="members" id="spectacleWorkers">

                        </div>
                        </p>

                        <p class="spectacle-description container-margin">
                            <label for="description">Опис</label>
                            <textarea class="spectacle-description-input" name="description" required></textarea>
                        </p>

                    </div>

                    <div class="images-container">
                        <p class="main-image-container container-margin">
                            <label for="main-img"><img src="/static/img/icons/main-image-placeholder.png" alt="main image"></label>
                            <input type="file" accept="image/*" name="file" class="inputfile" required>
                        </p>
                        <div class="secondary-images-container">
                            <p class="container-margin">
                                <label for="first-image"><img src="/static/img/icons/secondary-image-placeholder.png" alt="first image"></label>
                                <input type="file" accept="image/*" name="files" class="inputfile" multiple="multiple" required>
                            </p>

                            <p class="container-margin">
                                <label for="second-image"><img src="/static/img/icons/secondary-image-placeholder.png" alt="second image"></label>
                                <input type="file" accept="image/*" name="second-image" class="inputfile">
                            </p>

                            <p class="container-margin">
                                <label for="third-image"><img src="/static/img/icons/secondary-image-placeholder.png" alt="third image"></label>
                                <input type="file" accept="image/*" name="third-image" class="inputfile">
                            </p>
                        </div>

                        <p class="for-button for-button2 container-margin">
                            <input type="submit" name="" value="Створити" id="create-form-submit-btn">
                            ${message?ifExists}
                        </p>
                    </div>
                </div>
                <div class="veryHidden">
                    <input type="text" name="actor-names" id="actorsInput" required>
                    <input type="text" name="worker-names" id="workersInput" required>
                </div>
            </form>
        </div>

    </main>

</div>




<script type="text/javascript" src="/static/js/spectacle-control-create.js"></script>

</body>
</html>
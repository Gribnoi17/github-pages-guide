$taskRoot='D:\_Sao_Minecraft\Web-Site\aincrad-concept'
$taskHtml=Get-Content -Raw -LiteralPath "$taskRoot\dist\index.html"
$taskHtml=$taskHtml.Replace('<title>AINCRAD — твоя жизнь на кону</title>','<title>AINCRAD — 100 этажей. Одна жизнь.</title>')
$taskHtml=$taskHtml.Replace('<a href="#world">О мире</a><a href="#paths">Твой путь</a><a href="#development">Разработка</a>','<a href="#development">Разработка</a><a href="#world">Мир и правила</a><a href="#paths">Твой путь</a>')
$taskHtml=$taskHtml.Replace('<button class="header-cta" data-info="account">Личный кабинет <span>↗</span></button>','<a class="header-cta" href="#development">Статус проекта <span>↗</span></a>')
$taskHtml=$taskHtml.Replace('<p class="hero-kicker">MINECRAFT × SWORD ART ONLINE</p><h1 id="hero-title">Этот мир реален.<br>Твоя история —<br><em>ещё не написана.</em></h1>','<p class="hero-kicker">MMORPG ПО МОТИВАМ SWORD ART ONLINE</p><h1 id="hero-title">Аинкрад в Minecraft.<br>100 этажей.<br><em>Одна жизнь.</em></h1>')
$taskHtml=$taskHtml.Replace('Сто этажей над облаками. Одна жизнь.<br>Мир, где каждый клинок выкован игроком,<br>а следующий этаж открывают вместе.','Объединяйтесь в гильдии, побеждайте мировых боссов<br>и открывайте следующие этажи всему серверу.<br>Снаряжение создают игроки. Силу не купить.')
$taskHtml=$taskHtml.Replace('<a class="button primary" href="#join">Быть у истоков <span>↗</span></a><a class="button secondary" href="#world"><span class="play-icon">▷</span> Открыть мир</a>','<a class="button primary project-follow" href="#development">Что готовим к запуску <span>↓</span></a><a class="button secondary" href="#world">Мир и правила <span>↗</span></a>')
$taskHtml=$taskHtml.Replace('CONNECTION PENDING','ОТКРЫТИЕ ПОКА НЕ ОБЪЯВЛЕНО')
$taskHtml=$taskHtml.Replace('01 / ДОБРО ПОЖАЛОВАТЬ В АИНКРАД','02 / МИР И ПРАВИЛА').Replace('02 / ВЫБЕРИ СВОЮ ИСТОРИЮ','03 / ВЫБЕРИ СВОЮ ИСТОРИЮ').Replace('05 / БАЗА ЗНАНИЙ','04 / ПЕРЕД НАЧАЛОМ ПУТИ')
$taskHtml=$taskHtml.Replace('<span class="tiny-label">COMBAT SYSTEM</span>','<span class="tiny-label">ТАКТИЧЕСКИЙ БОЙ</span>').Replace('<span class="tiny-label">PLAYER ECONOMY</span>','<span class="tiny-label">ЭКОНОМИКА ИГРОКОВ</span>').Replace('<span class="tiny-label">LEGACY SYSTEM</span>','<span class="tiny-label">НАСЛЕДИЕ</span>')
$taskHtml=$taskHtml.Replace('<span>WORLD EXPLORATION</span>','<span>ЭТАЖИ АИНКРАДА</span>').Replace('ВИЗУАЛЬНАЯ КОНЦЕПЦИЯ МИРА','КОНЦЕПТ-АРТ · НЕ СКРИНШОТ СЕРВЕРА')
$taskDev=@'
<section class="development section" id="development"><div class="section-heading"><div><span class="eyebrow blue">01 / ПРОЕКТ СЕЙЧАС</span><h2>Сначала — первый этаж.<br><span>Потом — путь к сотому.</span></h2></div><p>Сервер в разработке.<br>Дата открытия и набор на тестирование<br>пока не объявлены.</p></div><div class="dev-board"><div class="dev-board-head"><span class="status-dot"></span><strong>Что входит в первый прототип</strong><span class="dev-chip">ПЛАН РАЗРАБОТКИ</span></div><div class="prototype-grid"><article><span>01</span><h3>Первый этаж</h3><p>Безопасный город, поля для исследования и лабиринт с боссом.</p></article><article><span>02</span><h3>Основа боя</h3><p>Выносливость, уклонения, комбо и читаемые атаки противников.</p></article><article><span>03</span><h3>Цена ошибки</h3><p>Правила смерти, сохранение косметики и проверка спорных ситуаций.</p></article></div><div class="dev-board-foot"><span>Далее: профессии и торговля → закрытая бета → публичный сезон.</span><span>10 этажей — план запуска</span></div></div><p class="development-note">Это план по концепции проекта. Записи игрового процесса, скриншоты и результаты тестов появятся по мере готовности. Иллюстрации на странице — концепт-арт.</p></section>
'@
$taskHtml=[regex]::Replace($taskHtml,'<section class="development section".*?</section>','',[System.Text.RegularExpressions.RegexOptions]::Singleline)
$taskHtml=$taskHtml.Replace('<section class="world section" id="world">',"$taskDev`n<section class=`"world section`" id=`"world`">")
$taskRisk=@'
<div class="risk-panel"><div><span class="eyebrow blue">ПРАВИЛА ЭТОГО МИРА</span><h3>Одна жизнь —<br>осознанный риск.</h3></div><div><h4>Что можно потерять</h4><p>В опасных зонах смерть означает потерю персонажа, снаряжения и прогресса.</p></div><div><h4>Что остаётся</h4><p>Косметика и достижения аккаунта. Память о персонаже — в наследии и мемориале.</p></div><div><h4>Где безопасно</h4><p>В городах PvP отключён. Правила защиты новичков уточним до тестирования.</p></div></div>
'@
$taskHtml=$taskHtml.Replace('</div></div></section>'+[Environment]::NewLine+'<section class="paths section"',"</div></div>$taskRisk</section>"+[Environment]::NewLine+'<section class="paths section"')
# Fallback for LF-only HTML.
if(-not $taskHtml.Contains('risk-panel')){$taskHtml=$taskHtml.Replace('</div></div></section>'+"`n"+'<section class="paths section"',"</div></div>$taskRisk</section>`n<section class=`"paths section`"")}
$taskLauncher=@'
<aside class="launcher-strip"><div class="launcher-mark" aria-hidden="true">◇</div><div><h3>Свой лаунчер. Одна сборка.</h3><p>Планируем объединить моды, обновления и вход на сервер в одном приложении.</p></div><span>В РАЗРАБОТКЕ<br><small>Скачивание пока недоступно</small></span></aside>
'@
$taskHtml=[regex]::Replace($taskHtml,'<section class="launcher section".*?</section>',$taskLauncher,[System.Text.RegularExpressions.RegexOptions]::Singleline)
$taskHtml=$taskHtml.Replace('<div class="join-actions"><button class="button primary" data-info="community">Следить за проектом <span>↗</span></button><button class="button secondary" data-info="discord">Сообщество Discord <span>↗</span></button></div>','<div class="join-actions"><span class="community-pending">Официальные каналы скоро появятся здесь</span></div>')
$taskHtml=$taskHtml.Replace('А пока — знакомься с миром, собирай свою гильдию<br>и следи за рождением Аинкрада.','Собираем мир, в который захочется вернуться.<br>О тестировании сообщим в официальном сообществе.')
$taskHtml=$taskHtml.Replace('КОНЦЕПТ ГЛАВНОЙ / V.01','КОНЦЕПТ ГЛАВНОЙ / V.02')
[System.IO.File]::WriteAllText("$taskRoot\dist\index.html",$taskHtml,[System.Text.UTF8Encoding]::new($false))

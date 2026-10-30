# AINCRAD — React / v04

React 19 + Vite + Motion. Статическая сборка публикуется в прежний приватный Sites-проект.

## Запуск
- npm ci
- npm run dev — http://127.0.0.1:4173
- npm run build — сборка в dist/ с предрендером HTML, robots.txt и sitemap.xml
- npm run preview — просмотр сборки

## Исходники
- src/App.jsx — секции, вкладки занятий, FAQ, мобильная навигация, SVG-иконки.
- src/styles.css — оформление, адаптивная сетка, CSS-анимации и reduced-motion.
- src/site.js — название, адрес сайта, Telegram, тексты для поиска.
- src/main.jsx — точка входа React (гидрация предрендеренного HTML).
- src/entry-server.jsx, prerender.js — предрендер при сборке.
- public/art/ — концепт-арты в WebP; не скриншоты сервера. Исходные PNG — art-source/.
- public/og.jpg, favicon.svg, apple-touch-icon.png — превью для соцсетей и иконки.
- .openai/hosting.json — существующий Site и статическая папка dist.

Motion: однократное появление блоков при прокрутке, переходы текста занятий, индикатор выбранной вкладки, прогресс чтения. CSS: медленное движение фона, схема этажей, hover-состояния, раскрытие FAQ. prefers-reduced-motion отключает декоративные движения и переходы.

Сервер находится в разработке; дата запуска не объявлена. План работ не обозначает готовность систем. Новости — в Telegram-канале https://t.me/turris_mmo (ссылка задаётся в src/site.js). Платежи, регистрация и скачивание лаунчера не реализованы.

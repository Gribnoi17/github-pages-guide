# github-pages-guide

Лендинг на **React (Vite)**, задеплоенный на **GitHub Pages**.

Живой сайт: https://gribnoi17.github.io/github-pages-guide/

## Структура

```
index.html        исходный HTML-шаблон Vite
vite.config.js     конфиг (base + сборка в docs/)
src/
  main.jsx         точка входа React
  App.jsx          сама страница
  index.css        стили (зелёная гамма)
docs/              СОБРАННЫЙ сайт — его раздаёт GitHub Pages
```

## Разработка

```bash
npm install
npm run dev        # локально на http://localhost:5173
```

## Сборка и деплой

```bash
npm run build      # собирает в docs/
git add -A
git commit -m "update"
git push
```

GitHub Pages настроен на **Settings → Pages → Source → Deploy from a branch → `main` / `/docs`**.

> Файл `docs/.nojekyll` обязателен — без него Pages обрабатывает сайт через Jekyll.

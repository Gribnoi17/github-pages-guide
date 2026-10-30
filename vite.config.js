import { defineConfig } from 'vite';
import { SITE } from './src/site.js';

const escape = s => s.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;');

// Подставляет значения из src/site.js в index.html (%SITE_NAME% и т.п.).
const siteMeta = {
  name: 'site-meta',
  transformIndexHtml: html => html
    .replaceAll('%SITE_NAME%', escape(SITE.name))
    .replaceAll('%SITE_TITLE%', escape(SITE.title))
    .replaceAll('%SITE_DESCRIPTION%', escape(SITE.description))
    .replaceAll('%SITE_URL%', SITE.url),
};

// На GitHub Pages сайт живёт в подпапке (/github-pages-guide/), поэтому при сборке base берётся из SITE.url.
export default defineConfig(({ command, isPreview }) => ({
  base: command === 'build' || isPreview ? new URL(SITE.url).pathname.replace(/\/?$/, '/') : '/',
  plugins: [siteMeta],
}));

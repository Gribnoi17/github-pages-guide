// Вставляет готовый HTML страницы в dist/index.html и создаёт robots.txt и sitemap.xml.
import fs from 'node:fs';
import { SITE } from './src/site.js';

const { render } = await import('./dist-ssr/entry-server.js');
const file = 'dist/index.html';
const html = fs.readFileSync(file, 'utf8');
if (!html.includes('<div id="root"></div>')) throw new Error('В dist/index.html не найден <div id="root"></div>');
fs.writeFileSync(file, html.replace('<div id="root"></div>', `<div id="root">${render()}</div>`));

const today = new Date().toISOString().slice(0, 10);
fs.writeFileSync('dist/robots.txt', `User-agent: *\nAllow: /\n\nSitemap: ${SITE.url}/sitemap.xml\n`);
fs.writeFileSync('dist/sitemap.xml', `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n  <url><loc>${SITE.url}/</loc><lastmod>${today}</lastmod></url>\n</urlset>\n`);
fs.rmSync('dist-ssr', { recursive: true, force: true });
console.log('prerender: dist/index.html, robots.txt, sitemap.xml');

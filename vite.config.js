import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// Сайт деплоится в подпапку репозитория на GitHub Pages:
// https://gribnoi17.github.io/github-pages-guide/
// поэтому base должен совпадать с именем репозитория.
export default defineConfig({
  base: '/github-pages-guide/',
  // Собираем в docs/, чтобы GitHub Pages мог раздавать из этой папки,
  // а исходники жили рядом в корне репозитория.
  build: {
    outDir: 'docs',
    emptyOutDir: true,
  },
  plugins: [react()],
});

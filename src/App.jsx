import { useState } from 'react';

export default function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="page">
      <main className="hero">
        <span className="badge">React + GitHub Pages</span>

        <h1>
          Сделано на <span className="accent">React</span>
          <br />и залито на <span className="accent">GitHub&nbsp;Pages</span>
        </h1>

        <p className="subtitle">
          Это статический сайт: после сборки React превращается в обычные файлы,
          которые GitHub Pages раздаёт бесплатно и быстро.
        </p>

        {/* Маленькое доказательство, что это живой React, а не просто HTML */}
        <button className="btn" onClick={() => setCount((c) => c + 1)}>
          Кликнуто раз: {count}
        </button>
      </main>

      <footer className="footer">
        <p className="footer-title">Мой Telegram-канал</p>
        <a className="footer-link" href="https://t.me/gribnoi_it" target="_blank" rel="noreferrer">
          «Путь в IT» →
        </a>
        <p className="footer-note">
          Про бэкенд, продукты и путь в разработку. Подписывайся 💚
        </p>
      </footer>
    </div>
  );
}

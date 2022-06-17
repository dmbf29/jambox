import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './components/App';

window.initReact = () => {
  const container = document.getElementById('root');
  const initialState = {
    bookmarks: JSON.parse(container.dataset.bookmarks),
    user: JSON.parse(container.dataset.user),
    tag: container.dataset.tag
  };

  if (container) {
    const root = ReactDOM.createRoot(container);
    root.render(<App initialState={initialState} />);
  }
}
window.initReact();

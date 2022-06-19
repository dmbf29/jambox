import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './components/App';

window.initReact = () => {
  const container = document.getElementById('root');
  console.log(container.dataset)
  const initialState = {
    bookmarks: JSON.parse(container.dataset.bookmarks),
    favs: JSON.parse(container.dataset.favs),
    newOnes: JSON.parse(container.dataset.newOnes),
    recents: JSON.parse(container.dataset.recents),
    throwBacks: JSON.parse(container.dataset.throwBacks),
    user: JSON.parse(container.dataset.user),
    tag: container.dataset.tag
  };

  if (container) {
    const root = ReactDOM.createRoot(container);
    root.render(<App initialState={initialState} />);
  }
}
window.initReact();

import React, { useState } from 'react';
import Title from './Title';
import Tags from './Tags';
import List from './List';

const App = (props) => {
  const { initialState } = props;
  const allTags = [];
  initialState.bookmarks.forEach((bookmark) => {
    bookmark.tag_list.forEach(tag => allTags.push(tag))
  });
  const tags = [...new Set(allTags)];
  const lists = [
    {
      name: 'Go-to Albums',
      bookmarks: initialState.bookmarks
    },
    {
      name: 'Recently Listened',
      bookmarks: initialState.bookmarks
    },
    {
      name: 'Newly Added',
      bookmarks: initialState.bookmarks
    }
  ]

  return (
    <div>
      <Title />
      <Tags tags={tags} />
      { lists.map(
          (list, index) => <List name={list.name} key={index} bookmarks={list.bookmarks} />
        )}
    </div>
  );
};

export default App;

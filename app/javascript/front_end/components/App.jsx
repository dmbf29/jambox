import React, { useState } from 'react';
import Title from './Title';
import Tags from './Tags';

const App = (props) => {
  const { initialState } = props;
  const allTags = [];
  initialState.bookmarks.forEach((bookmark) => {
    bookmark.tag_list.forEach(tag => allTags.push(tag))
  });
  const tags = [...new Set(allTags)];

  return (
    <div>
      <Title />
      <Tags tags={tags} />
    </div>
  );
};

export default App;

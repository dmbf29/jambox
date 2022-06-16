import React, { useState } from 'react';
import Title from './Title';
import Tags from './Tags';

const App = (props) => {
  const { initialState } = props;
  console.log(initialState);

  return (
    <div>
      <Title />
      <Tags bookmarks={initialState.bookmarks} />
    </div>
  );
};

export default App;

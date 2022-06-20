import React, { useState } from 'react';
import Title from './Title';
import Tags from './Tags';
import List from './List';
import Bookmarks from './Bookmarks';

const App = (props) => {
  const { initialState } = props;
  const tag = initialState.tag
  const allTags = [];
  initialState.bookmarks.forEach((bookmark) => {
    bookmark.tag_list.forEach(tag => allTags.push(tag))
  });
  const tags = [...new Set(allTags)];
  const bookmarks = initialState.bookmarks
  const lists = [
    {
      name: 'All time favorites',
      bookmarks: initialState.favs
    },
    {
      name: 'Been a While',
      bookmarks: initialState.throwBacks
    },
    {
      name: 'Newly Added',
      bookmarks: initialState.newOnes
    },
    {
      name: 'Recently Listened',
      bookmarks: initialState.recents
    }
  ]
  function bookmarkRender(bookmarks, tag) {
    return (
      <div>
        <Title name={tag} />
        <Bookmarks bookmarks={bookmarks} key={tag + '1'} />
      </div>
    );
  };

  function listRender(lists, tags) {
    return (
      <div>
        <Title name="Get Groovin'" />
        <Tags tags={tags} />
        { lists.map(
          (list, index) => <List name={list.name} key={index} bookmarks={list.bookmarks} />
        )}
      </div>
    );
  };

  return (
    <div>
      { tag !== '' ? (
        bookmarkRender(bookmarks, tag)
      ) : (
        listRender(lists, tags)
      )}
    </div>
  );
};

export default App;

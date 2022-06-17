import React from 'react';
import Bookmark from './Bookmark';

const List = (props) => {
  const { name, bookmarks } = props;

  return (
    <div className="container my-3">
      <h3>{ name }</h3>
      <div className="d-flex">
        { bookmarks.map(
          (bookmark) => <Bookmark key={bookmark.id} bookmark={bookmark} />
        )}
      </div>
    </div>
  );
};

export default List;

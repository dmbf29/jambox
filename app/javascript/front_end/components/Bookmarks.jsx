import React from 'react';
import Bookmark from './Bookmark';

const Bookmarks = (props) => {
  const { bookmarks } = props;

  return (
    <div className="d-flex flex-wrap">
      { bookmarks.map(
        (bookmark) => <Bookmark key={bookmark.id} bookmark={bookmark} />
      )}
    </div>
  );
};

export default Bookmarks;

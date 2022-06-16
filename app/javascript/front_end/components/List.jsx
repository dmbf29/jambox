import React from 'react';

const List = (props) => {
  const { name, bookmarks } = props;

  return (
    <div className="container my-3">
      <h3>{ name }</h3>
    </div>
  );
};

export default List;

import React from 'react';

const List = (props) => {
  const { list } = props;

  return (
    <div className="container my-3">
      <h3>{ list.name }</h3>
    </div>
  );
};

export default List;

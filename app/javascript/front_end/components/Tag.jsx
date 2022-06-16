import React from 'react';

const Tag = (props) => {
  const { tag } = props;

  return (
    <div className="tag-item">
      <span>{ tag }</span>
    </div>
  );
};

export default Tag;

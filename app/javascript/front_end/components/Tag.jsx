import React from 'react';

const Tag = (props) => {
  const { tag } = props;
  const url = `/bookmarks?tag=${ tag }`;

  return (
    <div className="tag-item">
      <a href={ url }><span>{ tag }</span></a>
    </div>
  );
};

export default Tag;

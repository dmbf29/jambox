import React from 'react';
import Tag from './Tag';

const Tags = (props) => {
  const { tags } = props;

  return (
    <div className="container my-3">
      <fieldset className="form-group check_boxes optional snippet_tags">
        <input type="hidden" name="snippet[tag_ids][]" value=""></input>
        { tags.map(
          (tag, index) => <Tag tag={tag} key={index} />
        )}
      </fieldset>
    </div>
  );
};

export default Tags;

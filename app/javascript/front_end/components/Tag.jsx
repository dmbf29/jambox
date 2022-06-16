import React from 'react';

const Tag = (props) => {
  const { bookmarks } = props;

  return (
    <div className="tag-item">
      <input className="form-check-input check_boxes optional tag-selector" type="checkbox" value="1" name="snippet[tag_ids][]" id="snippet_tag_ids_1" />
      <label className="form-check-label collection_check_boxes" for="snippet_tag_ids_1">Shortcut</label>
    </div>
  );
};

export default Tag;

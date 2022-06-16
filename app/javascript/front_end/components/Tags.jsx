import React from 'react';
import Tag from './Tag';

const Tags = (props) => {
  const { bookmarks } = props;
  const tags = [];
  bookmarks.forEach((bookmark) => {
    bookmark.tagList.forEach(tag => tags.push(tag))
  });

  return (
    <div className="container my-3">
      <fieldset class="form-group check_boxes optional snippet_tags">
        <legend class="col-form-label pt-0">Tags</legend>
        <input type="hidden" name="snippet[tag_ids][]" value=""></input>
        { tags.map(
          (tagId) => <Tag tagId={tagId} key={tagId} />
        )}
      </fieldset>
    </div>
  );
};

export default Tags;

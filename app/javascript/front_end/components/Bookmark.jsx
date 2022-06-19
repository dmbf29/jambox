import React from 'react';
// import Bookmark from './Bookmark';

const Bookmark = (props) => {
  const { bookmark } = props;

  return (
    <div className="card-product mx-2">
      <img src={ bookmark.album.photo_url } />
      <span className='bookmark-count'><i className="fas fa-headphones-alt"></i> { bookmark.cached_votes_total }</span>
      <div className="card-product-infos">
        <h2>{ bookmark.album.artist.name }</h2>
        <p>{ bookmark.album.name }</p>
      </div>
    </div>
  );
};

export default Bookmark;

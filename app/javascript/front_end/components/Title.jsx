import React from 'react';

const Title = (props) => {
  const { name } = props;
  return (
    <div className="container mt-3">
      <h1>{ name }</h1>
    </div>
  );
};

export default Title;

import React from 'react';
import './App.css';
import stripes01 from './assets/stripes01.png';
import stripes02 from './assets/stripes02.png';
import line01 from './assets/line01.png';
import line02 from './assets/line02.png';
import Routes from './routes';

function App() {
  return (
    <div className="App">
      <img src={stripes01} alt="" id="s01" />
      <img src={stripes02} alt="" id="s02" />
      <img src={line01} alt="" id="l01" />
      <img src={line02} alt="" id="l02" />
      <Routes />
    </div>
  );
}

export default App;

import styled from 'styled-components';

export const Container = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  height: 90%;
  width: 100%;

  button{
    background-color: transparent;
    border: 3px solid #C9FFEB;
    border-radius: 10px;
    color: #C9FFEB; 
    font-family: 'Spectral SC';
    font-size: 15px;
    padding: 5px 10px;
    margin: 5px 0;
    cursor: pointer;
  }

  input{
    background-color: transparent;
    border: 2px solid #C9FFEB;
    color: #C9FFEB;
    font-family: 'Spectral SC';
    font-size: 15px;
    border-radius: 10px; 
    margin: 15px 0;
  }

  .left{
    margin-right: 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-direction: column;
  }
  
  .right{
    margin-left: 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-direction: column;

    textarea{
      resize: none;
      background-color: transparent;
      border: 3px solid #C9FFEB;
      color: #C9FFEB;
      font-family: 'Spectral SC';
      font-size: 15px;
    }

    #points{
      width: 5vw;
    }

  }

  .divider{
    height: 70vh;
    min-width: 3px;
    background-color: #C9FFEB;
  }
`;

export const Center = styled.div`
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;

  button{
    background-color: transparent;
    border: 2px solid #C9FFEB;
    color: #C9FFEB;
    font-family: 'Spectral SC';
    font-size: 15px;
    border-radius: 10px; 
    min-height: 30px;
    min-width: 100px;
    height: 5%;
    width: 8%;
    cursor: pointer;
  }
`;
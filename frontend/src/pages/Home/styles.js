import styled from 'styled-components';

export const Container = styled.div`
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  img{
    height: 200px;
    margin-bottom: 20px;
  }

  h1{
    font-size: 40px;
  }

  h3{
    font-size: 20px;
    font-weight: normal;
    margin-bottom: 20px;
  }

  button{
    margin-bottom: 20px;
  }

  span{
    display: flex;
    align-items: center;

    svg{
      margin-right: 10px;
    }

  }

`;

import styled from 'styled-components';

export const Container = styled.div`
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  img{
    height: 150px;
    margin-bottom: 20px;
  }

  h1{
    font-size: 30px;
  }

  h3{
    font-size: 15px;
    font-weight: normal;
    margin-bottom: 20px;
  }

  a{
    button{
      margin-bottom: 20px;
      width: 15vw;
    }

  }
`;

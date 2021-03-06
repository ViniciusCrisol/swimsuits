import styled from 'styled-components'

export const Container = styled.header`
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 72px;

  font-size: 16px;
  padding: 0 32px;
  background: ${({ theme }) => theme.colors.background};
  box-shadow: ${({ theme }) => theme.boxShadow};

  display: flex;
  align-items: center;

  z-index: 1001;
  transition: background 160ms;

  .main {
    width: 100%;
    max-width: ${({ theme }) => theme.containerSize};

    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: space-between;

    h1 {
      line-height: 1;
      font-weight: 400;
      font-family: 'Yellowtail', cursive;

      display: flex;
      align-items: center;

      svg {
        margin-right: 4px;
        fill: ${({ theme }) => theme.colors.primary};
      }
    }

    ul {
      list-style: none;
      margin-left: 24px;

      display: flex;
      align-items: center;
      justify-content: center;

      li + li {
        margin-left: 12px;
      }
    }
  }
`

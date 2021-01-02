import styled from 'styled-components'
import theme from '../../styles/theme'

export const Container = styled.header`
  position: fixed;
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
    h1 {
      font-weight: 400;
      font-family: 'Yellowtail', cursive;

      display: flex;
      align-items: center;

      svg {
        margin-right: 4px;
        fill: ${({ theme }) => theme.colors.primary};
      }
    }
  }
`

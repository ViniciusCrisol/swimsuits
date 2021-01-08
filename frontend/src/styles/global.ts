import { createGlobalStyle } from 'styled-components'

export default createGlobalStyle`
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  html {
    scroll-behavior: smooth;
  }

  body {
    font-size: 16px;
    -webkit-font-smoothing: antialiased !important;
    overflow-x: hidden;
    background-color: ${({ theme }) => theme.colors.background};
  }


  *, input, button {
    font-family: Roboto, sans-serif;
    color: ${({ theme }) => theme.colors.text};
  }
`

import { darken } from 'polished'
import styled from 'styled-components'

const backgrounds = {
  home:
    'https://res.cloudinary.com/dfhay5bfg/image/upload/c_crop,g_west,h_840,q_auto:best,w_1920,x_595/v1609611437/Swimsuits/home_udzpip.jpg'
}

export const Container = styled.div`
  width: 100vw;
  overflow: hidden;

  .main {
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    width: 100vw;
    height: 100vh;

    padding: 64px 32px;
    background: url(${backgrounds.home});
    background-position: center;

    a {
      cursor: pointer;
      transition: background 160ms;
    }

    .header {
      h1 {
        width: 100%;
        max-width: 280px;

        color: #fff;
        font-size: 40px;
      }

      a {
        height: 48px;
        width: 100%;
        max-width: 280px;

        background: #fff;
        margin-top: 8px;
        border-radius: 4px;

        display: flex;
        align-items: center;
        justify-content: center;

        &:hover {
          background: ${({ theme }) => darken(0.06, theme.colors.background)};
        }
      }
    }

    .footer {
      display: flex;
      align-items: center;
      justify-content: center;

      a {
        border-radius: 4px;
        border: 2px solid #fff;

        display: flex;
        align-items: center;
        justify-content: center;

        svg {
          stroke: #fff;
        }

        &:hover {
          background: rgba(255, 255, 255, 0.3);
        }
      }
    }
  }

  .pages-container {
    div {
      width: 100vw;
      height: 100%;
      min-height: 100vh;

      padding: 64px 32px;
    }

    div:nth-child(1) {
      background: lightcoral;
    }

    div:nth-child(2) {
      background: lightblue;
    }

    div:nth-child(3) {
      background: lightseagreen;
    }

    div:nth-child(4) {
      background: lightslategray;
    }
  }
`
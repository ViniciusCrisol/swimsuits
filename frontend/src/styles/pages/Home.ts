import { darken } from 'polished'
import styled from 'styled-components'

const backgrounds = {
  home:
    'https://res.cloudinary.com/dfhay5bfg/image/upload/c_crop,g_west,h_840,q_auto:best,w_1920,x_595/v1609611437/Swimsuits/home_udzpip.jpg'
}

export const Container = styled.div`
  width: 100vw;
  overflow: hidden;

  position: relative;

  > .main {
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    width: 100vw;
    height: 100vh;

    padding: 128px 64px 48px;
    background: url(${backgrounds.home}) no-repeat center;
    background-size: cover;

    a {
      cursor: pointer;
      transition: background 160ms;
    }

    .header {
      margin: 0 auto;
      width: 100%;
      max-width: ${({ theme }) => theme.containerSize};

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
      width: 100%;

      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;

      span {
        margin-top: 8px;
        color: #fff;
        font-weight: bold;
      }

      a {
        max-width: 200px;
        width: 100%;

        border-radius: 4px;
        border: 2px solid #fff;
        backdrop-filter: blur(10px);
        background: rgba(255, 255, 255, 0.25);

        display: flex;
        align-items: center;
        justify-content: center;

        svg {
          stroke: #fff;
        }

        &:hover {
          background: rgba(255, 255, 255, 0.35);
        }
      }
    }
  }

  .pages-container {
    > div {
      width: 100vw;
      height: 100%;
      min-height: 100vh;

      padding: 64px;
    }

    > div:nth-child(1) {
      h1 {
        line-height: 1;
        font-weight: 400;
        text-align: center;
        font-family: 'Yellowtail', cursive;
      }
    }

    > div:nth-child(2) {
      background: lightblue;
    }

    > div:nth-child(3) {
      background: lightseagreen;
    }

    > div:nth-child(4) {
      background: lightslategray;
    }
  }
`

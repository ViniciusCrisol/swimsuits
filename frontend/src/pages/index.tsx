import { FiChevronDown } from 'react-icons/fi'
import Head from 'next/head'

import Header from '../components/Header'
import { Container, BestSellers } from '../styles/pages/Home'

const Home: React.FC = () => {
  return (
    <Container>
      <Head>
        <title>Home</title>
      </Head>

      <Header />
      <div className="main">
        <div className="header">
          <h1>Choise your best swimsuite!</h1>
          <a>Go shopping</a>
        </div>
        <div className="footer">
          <a>
            <FiChevronDown size={48} />
          </a>
        </div>
      </div>
      <section className="pages-container">
        <div>
          <h1>Shop Best Sellers</h1>

          <BestSellers>
            <li>
              <div className="image-container">
                <img
                  src="https://images.unsplash.com/photo-1609778890036-04f69308b474?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80"
                  alt=""
                />
              </div>
              <div className="footer">
                <h5>Biquíni Branco...</h5>
                <span>R$ 120.00</span>
                <strong className="available-quantity">
                  Available: 5 peaces
                </strong>
              </div>
            </li>
            <li></li>
            <li></li>
            <li></li>
          </BestSellers>
        </div>
        <div></div>
        <div></div>
        <div></div>
      </section>
    </Container>
  )
}

export default Home

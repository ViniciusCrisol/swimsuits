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

      <div className="main">
        <Header />
        <div className="header">
          <h1>Choise your best swimsuite!</h1>
          <a>Go shopping</a>
        </div>
        <div className="footer">
          <a href="#main-container">
            <FiChevronDown size={48} />
          </a>
        </div>
      </div>
      <section className="pages-container">
        <div id="main-container">
          <h1>Shop Best Sellers</h1>
          <BestSellers>
            {[1, 2, 3, 4].map(item => (
              <li key={item}>
                <div className="image-container">
                  <img
                    src="https://images.unsplash.com/photo-1609778890036-04f69308b474?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80"
                    alt=""
                  />
                </div>
                <div className="footer">
                  <div className="header">
                    <h4>Biquíni Branco...</h4>
                    <span>R$ 120.00</span>
                  </div>
                  <span className="available-quantity">Two units in stock</span>
                </div>
              </li>
            ))}
          </BestSellers>
        </div>
      </section>
    </Container>
  )
}

export default Home

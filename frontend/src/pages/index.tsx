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
            <li></li>
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

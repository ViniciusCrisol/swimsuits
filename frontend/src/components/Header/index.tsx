import { GiStripedSun } from 'react-icons/gi'
import { Container } from './styles'

const Header: React.FC = () => (
  <Container>
    <div className="main">
      <h1>
        <GiStripedSun />
        Swimsuits
      </h1>
      <ul>
        <li>
          <a>Shop</a>
        </li>
        <li>
          <a>About</a>
        </li>
      </ul>
    </div>
  </Container>
)

export default Header

import { GiStripedSun } from 'react-icons/gi'

import { Container } from './styles'

const Header: React.FC = () => {
  return (
    <Container>
      <div className="main">
        <h1>
          <GiStripedSun />
          Swimsuits
        </h1>
      </div>
    </Container>
  )
}

export default Header

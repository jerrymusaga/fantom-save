import './Fantom.css';
import { ethers } from "ethers";

import { Header } from './Header';
import { Body } from './Body';



import { NoWalletDetected } from '../NoWalletDetected';

const Home = () => {
    // Ethereum wallets inject the window.ethereum object. If it hasn't been
    // injected, we instruct the user to install MetaMask.
    if (window.ethereum === undefined) {
        return <NoWalletDetected />;
    }
    return (
        <div className="App">
            <Header />

            <Body />
            
        </div>
    )
}

export default Home;
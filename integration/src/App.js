import GDrive from "./components/abi/GDrive.json";
import { useState, useEffect } from 'react';
import Upload from './components/Upload';
import Display from './components/Display';
import AccessList from './components/AccessList';
const ethers = require('ethers');

function App() {
  const [state, setState] = useState({
    provider: null,
    signer: null,
    contract: null
  });
  const [account, setAccount] = useState("None");
  useEffect(() => {
    const connectWallet = async () => {
      const contractAddress = "0x3192554A56f00798228F14a667024d31D941207D";
      const contractABI = GDrive.abi;
      try {
        const { ethereum } = window;
        if (ethereum) {
          const account = await ethereum.request({
            method: "eth_requestAccounts",
          });

          window.ethereum.on("chainChanged", () => {
            window.location.reload();
          });

          window.ethereum.on("accountChanged", () => {
            window.location.reload();
          })

          const provider = new ethers.BrowserProvider(window.ethereum);
          const signer = await provider.getSigner();
          const contract = new ethers.Contract(contractAddress, contractABI, signer);
          setAccount(account);
          setState({ provider, signer, contract });
        } else {
          alert("Please install Metamask");
        }
      } catch (error) {
        console.log(error);
      }
    }
    connectWallet();
  }, []);
  // console.log(state);
  return (
    <div>
      
      <div className="App">
        <AccessList 
          contract={state.contract} />

        <h1>G-drive 3.0</h1>
        <br />
        <p>Account: {account}</p>
        <div>
          <Upload
            account={account}
            provider={state.provider}
            contract={state.contract} />
          <br />
          <br />
          <Display
            contract={state.contract}
            account={account}
          />
        </div>
      </div>
    </div>
  )
}
export default App;

"use client"

import Upload from "../components/abi/Upload.json";

import { useState,useEffect } from "react";
import FileUpload from "../components/FileUpload";
import Display from "../components/Display";
import Model from "../components/Model";
import { useDispatch, useSelector } from "react-redux";
import {setVariable1,setVariable2} from '@/redux/store'
const ethers = require("ethers");


function App() {
  
 
  const [st, setState] = useState({
    provider: null,
    signer: null,
    contract: null
  });
  const [openModel, setOpenModel] = useState(false);
  const [account, setAccount] = useState("None");
  useEffect(() => {
    const connectWallet = async () => {
      const contractAddress = "0x610178dA211FEF7D417bC0e6FeD39F05609AD788";
      const contractABI = Upload.abi;
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
  var API_KEY,SECRET_API_KEY;
  const [d1,setd1]=useState("");
  const [d2,setd2]=useState("");
  const handleAPI=(event: React.ChangeEvent<HTMLInputElement>)=>{
    event.preventDefault();
      console.log(d1)
      console.log(d2)
      API_KEY=d1;
      SECRET_API_KEY=d2;
      // handleVariableChange(d1,d2)
      

  }

 
  return (
    <div className="flex flex-col  mt-10  w-full ">
      {!openModel && (
        <button className="share h-10 w-32 bg-slate-400 rounded-full text-white self-end "
          onClick={() => setOpenModel(true)}>Share</button>
      )}{" "}
      {openModel && (
        <Model setOpenModel={setOpenModel}
          contract={st.contract} />
      )}
      <div className="App">
        <h1 className="mt-5 text-center text-[3rem] text-[#b26af6]">G-drive 3.0</h1>
        <br />
        <div className="">
        <p className="text-xl mb-5">Account: {account}</p>
        <form action="" className="flex flex-col gap-3" onSubmit={(e)=>handleAPI}>
          <input type="text" name="API_KEY" className="w-56 px-2 h-8 rounded-lg text-slate-500 border border-slate-800" value={d1} onChange={(e)=>{let a=e.target.value; setd1(a);}} placeholder="Enter your pinata_api_key"/>
          <input type="text" name="SECRET_API" className="w-64 px-2 h-8 rounded-lg text-slate-500 border border-slate-800" value={d2} onChange={(e)=>{let b=e.target.value; setd2(b)}} placeholder="Enter your pinata_secret_api_key"/>
          <input type="submit" value="Submit" className="w-24 rounded-lg h-8 bg-slate-400" />
        </form>
        <div>
          <FileUpload
            account={account}
            provider={st.provider}
            contract={st.contract} />
          <br />
          <br />
          <Display
            contract={st.contract}
            account={account}
          />
        </div>
        </div>
      </div>
    </div>
  )
}
export default App;








"use client"
import { gethash } from "../api/route";;
import { useEffect, useState } from "react";
 function Display({ contract, account }) {
    const [data, setData] = useState("");
    const [Hash,setHash]=useState([" "]);
    
    const handlehash=async()=>{
        var list=await gethash();
        setHash(list);
        console.log(list)
    }
    
   
    const getlist=(elem,i)=>{
        return <ul key={i} className="mx-3 ">
            <li>{elem}</li>
        </ul>
    }
    const getData = async () => {
        try {
            let dataArray;
            const otherAddress = document.querySelector(".address").value;
            if (otherAddress) {
                dataArray = await contract.display(otherAddress);
                // console.log(dataArray);
            } else {
                // console.log(await contract.display(account[0]));
                dataArray = await contract.display(account[0]);
                // console.log(dataArray);
            }
            const isEmpty = Object.keys(dataArray).length === 0;
            // console.log(Object.keys(dataArray));
            if (!isEmpty) {
                const str = dataArray.toString();
                const str_array = str.split(",");
                // console.log(str);
                // console.log(str_array);
                const images = str_array.map((item, i) => {
                    return(
                        <a href={`https://ipfs.io/ipfs/${item.substring(7)}`} key={i} target="_blank">
                            {/* <img key={i} 
                            src={`https://ipfs.io/ipfs/${item.substring(7)}`}
                                alt="new"
                                className="image-list" /> */}
                                Get File
                        </a>
                    )
                });
                setData(images)
            }
        } catch (e) {
            console.log(e);
        }
    };
    return (
        <>
            <div>{data}</div>
            <div className="gap-5">
            <input type="button" value={"get hashes"}  onClick={handlehash} className="w-20 text-[0.7rem] mb-3 h-10 rounded-full bg-slate-500 text-white"/>
            <div className="mb-3">
            {Hash.map(getlist)}
            </div>
            
            <div className="flex gap-3" >
            <input type='text' placeholder="Enter Address" className="h-10 rounded-xl border border-slate-700 text-center" />
            <button onClick={()=>{getData}} className="bg-green-400 border border-green-700  w-28 rounded-full text-white " >Get Data</button>
            </div>
            </div>
            
        </>
    )
}

export default Display;
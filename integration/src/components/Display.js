import { useState } from "react";
function Display ({ contract, account}) {
    const [data, setData] = useState("");
    const getData = async() => {
        try {
            let dataArray;
            const otherAddress = document.querySelector('.address').value;
            if (otherAddress) {
                dataArray = await contract.display(otherAddress);
            } else {
                dataArray = await contract.display(account[0]);
            }
            const isEmpty = Object.keys(dataArray).length === 0;
            if (isEmpty) {
                const str = dataArray.toString();
                const str_array = str.split(",");
                const images = str_array.map((item, i) =>{
                    return (
                        <a href = {`https://ipfs.io/ipfs/${item.substring(7)}`} key = {i} target="_blank">
                            Get File
                        </a>
                    )
                });
                setData(images);
            }
        }catch (e) {
            console.log(e);
        }
    };
    return (
        <>
            <div>{data}</div>
            <br />
            <br />
            <input type = 'text' placeholder='Enter Address' className="address" />
            
        </>
    )

}
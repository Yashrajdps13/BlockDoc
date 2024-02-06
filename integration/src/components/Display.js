import { useState } from "react";
function Display ({ contract, account}) {
    const [data, setData] = useState("");
    const getData = async() => {
        try {
            let dataArray;
            const otherAddress = document.querySelector('.address').value;
            console.log(otherAddress);
            if (otherAddress) {
                dataArray = await contract.display(otherAddress);
                
            } else {
                dataArray = await contract.display(account[0]);
            }
            console.log(dataArray);
            const isEmpty = Object.keys(dataArray).length === 0;
            console.log(isEmpty);
            if (!isEmpty) {
                const str = dataArray.toString();
                const str_array = str.split(",");
                console.log(str_array);
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
        <div>
            <div>{data}</div>
            <br />
            <br />
            <input type = 'text' placeholder='Enter Address' className="address" />
            <br />
            <br />
            <button onClick={getData}>Get Data</button>
        </div>
    );

}

export default Display;
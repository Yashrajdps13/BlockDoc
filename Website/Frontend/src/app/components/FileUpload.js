"use client"

import { useState } from "react";
import axios from "axios";
import { posthash } from "../api/route";
const FormData = require('form-data');


function FileUpload({contract, account, provider}) {
    const [file, setFile] = useState(null);


    const [fileName, setFileName] = useState("No Image selected");
    const sendHash=async(ImgHash)=>{
        await posthash(ImgHash);
    }
    const handleSubmit = async (e) => {
        e.preventDefault();
        if (file) {
            try {
                const formData = new FormData();
                formData.append("file", file);
                // console.log(formData);
                const resFile = await axios({
                    method: "post",
                    url: "https://api.pinata.cloud/pinning/pinFileToIPFS",
                    data: formData,
                    headers: {
                      pinata_api_key: `9dff9aba748c7b789f71`,
                      pinata_secret_api_key: `1c6a015db6b68c63720bd2dd7c0da99d9773117e676eba438c79bacde290a8bc`,

                      "Content-Type": "multipart/form-data",
                    },
                  });
                const ImgHash = `ipfs://${resFile.data.IpfsHash}`;
                // const signer = contract.connect(provide.getSigner());
                console.log(ImgHash);
                console.log(account[0]);
                await contract.add(account[0], ImgHash);
                sendHash(ImgHash);
                alert("Successfully Image Uploaded");
                setFileName("No image selected");
                setFile(null);
            } catch (e) {
                alert("Unable to upload");
                console.log(e);
            }
        }
    }

    const retrieveFile = (e) => {
        const data = e.target.files[0];
        console.log(data);
        const reader = new window.FileReader();
        reader.readAsArrayBuffer(data);
        reader.onloadend = () => {
            setFile(e.target.files[0]);
        };
        setFileName(e.target.files[0].name);
        e.preventDefault();
    };
    return (
        <>
            <form onSubmit={handleSubmit}>
                <label htmlFor="file-upload" className="mr-2">Choose Image: </label>
                <input disabled={!account} type='file' id='file-upload' name='data' onChange={retrieveFile} />
                <br />
                <br />
                <br />
                <span>Image: {fileName}</span>
                <br />
                <br />
                <button type="submit" disabled={!file} className="h-10  bg-[#FFF7AD] border border-[#f7e53e] rounded-full w-24"> Upload</button>
            </form>
        </>
    )
}

export default FileUpload;
import {useState} from 'react';
import axios from 'axios';
const FormData = require('form-data');

function Upload({contract, account}) {
    const [file, setFile] = useState(null);
    const [fileName, setFileName] = useState("No Image Selected");
    const handleSubmit = async (e) => {
        e.preventDefault();
        if (file) {
            try {
                const formData = new FormData();
                formData.append("file", file);
                const api_key = document.querySelector(".api-key").value;
                const api_secret_key = document.querySelector(".secret-api-key").value;
                const resFile = await axios({
                    method: "post",
                    url: "https://api.pinata.cloud/pinning/pinFileToIPFS",
                    data: formData,
                    headers: {
                        pinata_api_key: api_key,
                        pinata_secret_api_key: api_secret_key,
                        "Content-Type": "multipart/form-data",
                    },
                });
                const ImgHash = `ipfs://${resFile.data.IpfsHash}`;
                await contract.add(account[0], ImgHash);
                alert("Successfully Image Uploaded");
                setFileName("No image selected");
                setFile(null);
            } catch(e){
                alert("Unable to upload");
                console.log(e);
            }
        }
    };

    const retrieveFile = (e) => {
        try {const data = e.target.files[0];
        const reader = new window.FileReader();
        reader.readAsArrayBuffer(data);
        reader.onload = () => {
            setFile(data);
        }
        setFileName(data.name);
        e.preventDefault();}
        catch(e){
            console.log(e)
        }
    };
    return (
        <div>
            <form onSubmit={handleSubmit}>
                <label htmlFor='api_key'>Enter API Key</label>
                <input disabled = {!account} type = 'text' className='api-key'/>
                <br />
                <br />
                <label htmlFor='secret_api_key'>Enter Secret API key</label>
                <input disabled = {!account} type = 'text' className='secret-api-key' />
                <br />
                <br />
                <label htmlFor='file-upload'>Choose Image</label>
                <input disabled = {!account} type = 'file' id = 'file-upload' name = 'data' onChange={retrieveFile} />
                <br />
                <br />
                <text>Image: {fileName}</text>
                <br />
                <br />
                <button type='submit' disabled = {!file}>Upload</button>
            </form>
        </div>
    );
}

export default Upload;
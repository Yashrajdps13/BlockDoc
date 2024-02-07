import axios from "axios";
import { NextRequest,NextResponse } from "next/server";


export async function getStaticProps(){
    const res=await axios.get("http://localhost:3001/data")
    const repo = await res.data;
    console.log(repo);
  return { props: { repo } }
    
}
export async function gethash(){
    const res=await axios.get("http://localhost:3001/allhash");
    const repo=await res.data;
    console.log(repo);
    return repo;
}
export async function getdoctor(){
    const res=await axios.get("http://localhost:3001/doctor");
    const repo=await res.data;
    // console.log(repo);
    return repo;
}
export async function posthash(imghash:NextRequest){
    console.log("HI")
    let packet={hash:`${imghash}`}
    const send=await axios.post("http://localhost:3001/hash",{
       hash:imghash},{
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        }
       
    });
    const repo=await send.data;
    console.log(repo);
    return {props:"success"};
}

"use client"
import Image from "next/image";
import { useEffect, useState } from "react";
import Profile from "../../public/assets/conor.jpg"
import Feature from "./components/feature"
import style from './style.module.css'
import {getStaticProps, getdoctor, gethash, posthash} from "./api/route"
import { useSelector } from "react-redux";

export default function Home() {

  const [doclist,setdoclist]=useState([]);
  useEffect(()=>{
     getdoctor().then((e)=>{setdoclist(e);console.log(doclist)});
      
    
  },[]);
  const handleDoctor=(e)=>{
    return (
      <li className="flex items-center gap-2"> <div className="h-2 w-2 rounded-full bg-black"></div>{e}</li>
    )
  }
 
 
  return (
      
        <>
          <div className="flex justify-between  pt-16 items-center">
            <h1 className="text-4xl ">WELCOME TO <div className="text-[#DFBDFE]">BLOCDOC</div></h1>
            <div className="bg-[#DFBDFE] rounded-full h-[5rem] w-[5rem] flex justify-center items-center">
              <Image src={Profile} alt="" className="rounded-full h-[4.5rem] w-[4.5rem]"/>
            </div>
          </div>
          <div className="my-10 flex justify-between">
            <div className="h-[40vh] w-[35vw] rounded-2xl bg-[url('/assets/11.jpg')] bg-contain flex items-center justify-center text-3xl "></div>
            <div className="h-[40vh] w-[16vw] bg-[#DFBDFE]  rounded-2xl flex flex-col items-start  p-8 ">
              <h1 className="text-2xl mx-auto">Records</h1>
              <ul className="mt-5 overflow-auto" >
                <li className="flex items-center gap-2"> <div className="h-2 w-2 rounded-full bg-black"></div>Blood Report</li>
                <li className="flex items-center gap-2"> <div className="h-2 w-2 rounded-full bg-black"></div>Diabetes Report</li>
                <li className="flex items-center gap-2"> <div className="h-2 w-2 rounded-full bg-black"></div>Dengue Report</li>
                
                
              </ul>
            </div>

            
            <div className="h-[40vh] w-[16vw] bg-[#8CF8B7]  rounded-2xl flex flex-col items-start  p-8 ">
              <h1 className="text-2xl mx-auto">Doctors</h1>
              <ul className="mt-5 overflow-auto w-inherit" >
              {doclist.map(handleDoctor)}
                
                
                
              </ul>
            </div>
            <div className="h-[40vh] w-[16vw] bg-[#FFF7AD]  rounded-2xl flex flex-col items-start  p-8 ">
              <h1 className="text-2xl mx-auto">Hospitals</h1>
              <ul className="mt-5 overflow-auto" >
                
                <li className="flex items-center gap-2"> <div className="h-2 w-2 rounded-full bg-black"></div>Medanta Hospital</li>
                <li className="flex items-center gap-2"> <div className="h-2 w-2 rounded-full bg-black"></div>Artemis Hospital</li>
                <li className="flex items-center gap-2"> <div className="h-2 w-2 rounded-full bg-black"></div>Fortis Hospitals</li>
                
                
              </ul>
            </div>
            
          </div>
          {/* <button className="" onClick={()=>{test()}} >check</button> */}
          <Feature send="https://diseasepredictionml-dl.onrender.com/" heading="Prediction" btntext="TEST" imgurl="/assets/prediimg.svg" rev={false} btnclr="[#8CF8B7]" content="Explore our predictive healthcare models for liver, kidney, heart, diabetes, breast cancer, malaria, and pneumonia. Leverage data-driven insights to anticipate, prevent, and manage various health conditions effectively. Transforming healthcare through innovation." />
          <Feature send="https://textsummarybitnbuild-vpunyga6dgutxmdzuqkcca.streamlit.app/" heading="Summarizer" btntext="TEST" imgurl="/assets/summ.svg" rev={true} btnclr="[#DFBDFE]" content="Introducing our PDF Summarizer for Medical Reports! Upload documents effortlessly and receive concise, insightful summaries. Our tool extracts key information from medical reports, providing valuable insights for efficient analysis and decision-making. Elevate your document comprehension with our innovative summarization solution." />
          <Feature send="/files" heading="File Security" btntext="TEST" imgurl="/assets/fileimg.svg" rev={false} btnclr="[#FFF7AD]" content=" Safeguard your medical reports with our cutting-edge platform. Upload documents to the blockchain for unparalleled security. Protect your sensitive health data while embracing the future of confidential and tamper-proof medical record management. Your health information, your control." />

      </>
  );
}

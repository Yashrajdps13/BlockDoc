import React from 'react'
import Link from 'next/link';
function Feature(props) {
  return (
    <div className={props.rev?'flex justify-between items-center flex-row-reverse':`flex justify-between items-center `}>
            <div className="flex flex-col mx-10">
              <div className={`text-3xl ml-${props.rev?'auto':'0'}`}>{`${props.heading}`}</div>
               <p className={`w-[45vw] mt-10  text-${props.rev? 'right':'left'}`} >{`${props.content}`}</p>
               <div className={`flex gap-5 items-center  justify-${props.rev?'end':'start'}`}>
               <Link href={`${props.send}`}><div className={`w-32 h-10 flex justify-center items-center mt-5 rounded-xl  bg-${props.btnclr}`}>{`${props.btntext}`}</div></Link>

               <svg xmlns="http://www.w3.org/2000/svg" fill="none"  strokeWidth={1.5} stroke="currentColor" className="w-6 h-6 mt-3">
                <path strokeLinecap="round" strokeLinejoin="round" d="M17.25 8.25 21 12m0 0-3.75 3.75M21 12H3" />
                </svg>

                  
               </div>
               </div>
            <img src={`${props.imgurl}`} alt="" />
          </div>
  );
}

export default Feature
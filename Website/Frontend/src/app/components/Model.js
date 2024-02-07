import { useEffect } from "react";

function Model({setOpenModel, contract}) {
    const sharing = async() => {
        const address = document.querySelector(".address").value;
        await contract.allow(address);
        alert("Shared");
    }
    useEffect(() => {
        const accessList = async() => {
            const addressList = await contract.accesssShare();
            let select = document.querySelector(".selectNumber");
            const options = addressList;
            // console.log(options.length);
            for (let i = 0;i < options.length;i++){
                let opt = options[i];
                // console.log(opt);
                let e1 = document.createElement("option");
                e1.textContent = opt;
                // e1.value = opt;
                select.appendChild(e1);
            }
        }
        contract && accessList();
    }, [contract]);
    return (
        <div className="flex flex-col items-end"> 
            <div className="flex gap-5 ">
            <h3 className="text-xl">Share with:</h3>
            <input type='text' className="border-b-2 border-slate-700 focus:border-none mb-5" />
            </div>
            <form>
                <select className="selectNumber">
                    <option className="address">People with Access</option>
                </select>
            </form>
            <div className="flex gap-2 mt-5">
            <button onClick={() => {setOpenModel(false)}} id = 'cancelbtn' className="border w-24 h-8 border-slate-800 rounded-3xl ">Cancel</button>
            <button onClick={sharing} className=" w-24 h-8 bg-slate-500 text-white  rounded-3xl ">Share</button>
            </div>
        </div>
    )
}

export default Model;
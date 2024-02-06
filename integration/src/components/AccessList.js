import { useEffect } from "react";

function AccessList ({setOpenModel, contract}) {
    const sharing = async() => {
        const address = document.querySelector('.address').value;
        await contract.allow(address);
        alert("Shared");
    }
    useEffect(() => {
        const accessList = async() => {
            const addressList = await contract.accessShare();
            let select = document.querySelector('.selectNumber');
            const options = addressList;
            for (let i = 0;i < options.length;i++){
                let opt = options[i];
                let e1 = document.createElement('option');
                e1.textContent =opt;
                select.appendChild(e1);
            }
        }
        contract && accessList();
    }, [contract]);
    return(
        <>
            <h3>Share with</h3>
            <input type = 'text' className="address" />
            <br />
            <br />
            <form>
                <select className="selectNumber">
                    <option className="address">People with Access</option>
                </select>
            </form>
            <br />
            <button onClick={() => {setOpenModel(false)}} id = 'cancelbtn'>Cancel</button>
            <br />
            <button onClick={sharing}>Share</button>
        </>
    )
}

export default AccessList;
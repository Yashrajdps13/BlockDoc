import mongoose from "mongoose";

const URI="mongodb+srv://Divyansh:Divyansh@cluster0.n8u9pu6.mongodb.net/test?retryWrites=true&w=majority";

let connectDB=()=>{
    mongoose.connect(URI).then(()=>{
        console.log("Connected to mongodb successfully")
        
    }).catch((err)=>{
        console.log(err);
    })

}

export default connectDB;
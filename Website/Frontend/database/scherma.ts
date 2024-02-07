import mongoose from "mongoose"

const userSchema=new mongoose.Schema({
    patient_name:String,
    patient_email:String,
    id:Number,
    doctor_name:String
})

export default userSchema;
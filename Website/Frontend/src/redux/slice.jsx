
import { createSlice } from "@reduxjs/toolkit";
const initialState = "";
export const cartSlice=createSlice({
    name : 'cart',
    initialState,
    reducers : {
        addToCart1(state,action) {
            state.push(action.payload)

        },
        addToCart2(state,action) {
            state.push(action.payload)

        }
    }

})

export const {addToCart1,addToCart2}= cartSlice.actions;
export default cartSlice.reducer;
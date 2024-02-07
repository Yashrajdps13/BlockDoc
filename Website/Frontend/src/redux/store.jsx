"use client"
import { configureStore, createSlice } from '@reduxjs/toolkit';

// Define initial state
const initialState = {
  variable1: '0',
  variable2: '0',
};

// Create a slice for each variable
const variable1Slice = createSlice({
  name: 'variable1',
  initialState,
  reducers: {
    setVariable1(state, action) {
      state.variable1 = action.payload;
    },
  },
});

const variable2Slice = createSlice({
  name: 'variable2',
  initialState,
  reducers: {
    setVariable2(state, action) {
      state.variable2 = action.payload;
    },
  },
});

// Combine slices into a single reducer
const rootReducer = {
  variable1: variable1Slice.reducer,
  variable2: variable2Slice.reducer,
};

// Create the Redux store
export const store = configureStore({
  reducer: rootReducer,
});

// Export action creators
export const { setVariable1 } = variable1Slice.actions;
export const { setVariable2 } = variable2Slice.actions;
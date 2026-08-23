import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'

import './style/index.css'

import App from './view/App.tsx'

import pool from "./script/db/database_connection.tsx"



createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <App />
  </StrictMode> );

console.log("Hello");

console.log(pool);
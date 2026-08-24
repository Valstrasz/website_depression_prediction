import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'

import App from './react_part/App.tsx'

import './style/main.css'



createRoot(document.getElementById('root')!).render(
    <StrictMode>
        <App />
    </StrictMode>
);
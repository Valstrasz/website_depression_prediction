import { useState } from "react";

import reactLogo from "../asset/react.svg";
import viteLogo from "../asset/vite.svg";
import heroImg from "../asset/hero.png";

import "../style/App.css";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <section id="center" className="_TEMP">
        <div>
          <h1>Get started</h1>
          <p>
            Edit <code>src/App.tsx</code> and save to test <code>HMR</code>
          </p>
        </div>
        <button
          type="button"
          className="counter"
          onClick={() => setCount((count) => count + 1)}
        >
          Count is {count}
        </button>
      </section>
    </>
  );
}

export default App;
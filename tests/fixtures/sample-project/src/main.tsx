import { createRoot } from "react-dom/client";

function App() {
  return <main>Claude OS test fixture</main>;
}

const el = document.getElementById("root");
if (el) createRoot(el).render(<App />);

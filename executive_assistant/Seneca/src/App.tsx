
import "./App.css";
import "./modules/task";
import TodoComponent from "./modules/task";

function App() {
  return (
    <TodoComponent title="Testing" description="test test test" isCompleted={false} />
  )
}

export default App;

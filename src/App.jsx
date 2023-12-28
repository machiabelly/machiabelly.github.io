import './App.css';
import './components/Info';
import Info from './components/Info';
import {Scene01} from './polygonjs/scenes/Scene01';

function App() {
	return (
		<div className="App">
			<Scene01 />
			<Info />
		</div>
	);
}

export default App;

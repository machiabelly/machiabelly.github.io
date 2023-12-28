import {defineConfig} from 'vite';
import react from '@vitejs/plugin-react';
import {visualizer} from 'rollup-plugin-visualizer';

// https://vitejs.dev/config/
export default defineConfig({
	base: '/landing_page',
	plugins: [
		react(),
		visualizer({
			template: 'treemap', // treemap or sunburst
			open: false,
			gzipSize: true,
			brotliSize: true,
			filename: 'analyse.html', // will be saved in project's root
		}),
	],
});

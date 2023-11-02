#!/bin/bash
read -p "Enter the name of the project: " projectName
echo "#######################################"
echo "########### Starting Script ###########"
echo "#######################################"
#Change the directory according to wherever you store your development file
# startupFolder='/home/brownie/Desktop/Development/react-startup-files'
yarn create vite $projectName
cd $projectName
echo "This is the $projectName directory"
yarn
# yarn dev
ls -la

# tailwind section
read -p "Do you want to install Tailwind?(y/n) " tailwindChoice
if [[ "$tailwindChoice" == "y" ]]
then
    yarn add -D tailwindcss postcss autoprefixer
    npx tailwindcss init -p

    echo '/** @type {import('tailwindcss').Config} */' > tailwind.config.js
    echo 'export default {' >> tailwind.config.js
    echo '  content: [' >> tailwind.config.js
    echo '    "./index.html",' >> tailwind.config.js
    echo '    "./src/**/*.{js,ts,jsx,tsx}",' >> tailwind.config.js
    echo '  ],' >> tailwind.config.js
    echo '  theme: {' >> tailwind.config.js
    echo '    extend: {' >> tailwind.config.js
    echo '      colors: {' >> tailwind.config.js
    echo "        'deep-sky': '#0E7DE8'," >> tailwind.config.js
    echo "        'hadopelagic': '#04041F'," >> tailwind.config.js
    echo "        'galactic': '#3E238B'," >> tailwind.config.js
    echo "        'mars-red': '#BB252D'," >> tailwind.config.js
    echo "        'mars-red': '#BB252D'," >> tailwind.config.js
    echo '      },' >> tailwind.config.js
    echo '    },' >> tailwind.config.js
    echo '  },' >> tailwind.config.js
    echo '  plugins: [],' >> tailwind.config.js
    echo '}' >> tailwind.config.js

    cd src
    echo "@import 'https://js.arcgis.com/4.28/@arcgis/core/assets/esri/themes/dark/main.css'" > index.css
    echo "@tailwind base;" >> index.css
    echo "@tailwind components;" >> index.css
    echo "@tailwind utilities;" >> index.css
    cd ..
    echo "tailwind css installed and initialized"
fi

# daisyui section
read -p "Do you want to install DasiyUI?(y/n) " daisyChoice
if [[ "$daisyChoice" == "y" ]]
then
    yarn add -D daisyui@latest
    echo '/** @type {import('tailwindcss').Config} */' > tailwind.config.js
    echo 'export default {' >> tailwind.config.js
    echo '  content: [' >> tailwind.config.js
    echo '    "./index.html",' >> tailwind.config.js
    echo '    "./src/**/*.{js,ts,jsx,tsx}",' >> tailwind.config.js
    echo '  ],' >> tailwind.config.js
    echo '  theme: {' >> tailwind.config.js
    echo '    extend: {' >> tailwind.config.js
    echo '      colors: {' >> tailwind.config.js
    echo "        'deep-sky': '#0E7DE8'," >> tailwind.config.js
    echo "        'hadopelagic': '#04041F'," >> tailwind.config.js
    echo "        'galactic': '#3E238B'," >> tailwind.config.js
    echo "        'mars-red': '#BB252D'," >> tailwind.config.js
    echo "        'mars-red': '#BB252D'," >> tailwind.config.js
    echo '      },' >> tailwind.config.js
    echo '    },' >> tailwind.config.js
    echo '  },' >> tailwind.config.js
    echo '  plugins: [require("daisyui")],' >> tailwind.config.js
    echo '}' >> tailwind.config.js
    echo "daisyUI installed"
fi

# arcgis section
read -p "Do you want to install @arcgis/core?(y/n) " arcgisChoice
if [[ "$arcgisChoice" == "y" ]]
then
    yarn add @arcgis/core
    cd src
    echo ".mapDiv {" > App.css
    echo "    padding: 0;" >> App.css
    echo "    margin: 0;" >> App.css
    echo "    height: 100%;" >> App.css
    echo "    width: 100%;" >> App.css
    echo "}" >> App.css

    echo "@import 'https://js.arcgis.com/4.28/@arcgis/core/assets/esri/themes/dark/main.css';" > index.css
    echo "html," >> index.css
    echo "body," >> index.css
    echo "#root {" >> index.css
    echo "  padding: 0;" >> index.css
    echo "  margin: 0;" >> index.css
    echo "  height: 100%;" >> index.css
    echo "  width: 100%;" >> index.css
    echo "}" >> index.css
    echo "arcgis core installed"
fi

read -p "Simple Map Component Test?(y/n) " mapChoice
if [[ "$mapChoice" == "y" ]]
then
    echo "import './App.css'" > App.tsx
    echo "import SceneMap from './SceneMap'" >> App.tsx
    echo "function App() {" >> App.tsx
    echo "  return (" >> App.tsx
    echo "    <>" >> App.tsx
    echo "      <SceneMap />" >> App.tsx
    echo "    </>" >> App.tsx
    echo "  )" >> App.tsx
    echo "}" >> App.tsx
    echo "export default App" >> App.tsx
    
    echo 'import { useEffect, useRef} from "react";' > SceneMap.tsx
    echo 'import WebScene from "@arcgis/core/WebScene";' >> SceneMap.tsx
    echo 'import SceneView from "@arcgis/core/views/SceneView";' >> SceneMap.tsx
    echo 'export const SceneMap = ({ children }: {children: any}) => {' >> SceneMap.tsx
    echo '    const mapDiv = useRef(null);' >> SceneMap.tsx
    echo '    useEffect(function createMap() {' >> SceneMap.tsx
    echo '    if (mapDiv.current) {' >> SceneMap.tsx
    echo '        const scene = new WebScene({ ' >> SceneMap.tsx
    echo '            basemap: "dark-gray-vector",' >> SceneMap.tsx
    echo '            ground: "world-elevation",' >> SceneMap.tsx
    echo '        });' >> SceneMap.tsx
    echo '        const view = new SceneView({' >> SceneMap.tsx
    echo '                map: scene,' >> SceneMap.tsx
    echo '                container: mapDiv.current,' >> SceneMap.tsx
    echo '                padding: {top: 40},' >> SceneMap.tsx
    echo '                camera: { position: {x: -83.113, y: 42.268, z: 4754}, heading: 33.511, tilt: 65.004 },' >> SceneMap.tsx
    echo '                spatialReference: { wkid: 4326 },' >> SceneMap.tsx
    echo '                qualityProfile: "high",' >> SceneMap.tsx
    echo '                environment: {' >> SceneMap.tsx
    echo '                    lighting: { directShadowsEnabled: true,  date: new Date("Sun Jun 4 2023 22:00:00 GMT+0100 (CET)") }' >> SceneMap.tsx
    echo '                }' >> SceneMap.tsx
    echo '        });' >> SceneMap.tsx
    echo '        return () => { view && view.destroy() };' >> SceneMap.tsx
    echo '        }' >> SceneMap.tsx
    echo '    }, []);' >> SceneMap.tsx
    echo '  return (' >> SceneMap.tsx
    echo '      <>' >> SceneMap.tsx
    echo '        <div className="mapDiv" ref={mapDiv} ></div>' >> SceneMap.tsx
    echo '        {children}' >> SceneMap.tsx
    echo '      </>' >> SceneMap.tsx
    echo '  );' >> SceneMap.tsx
    echo '}' >> SceneMap.tsx
    echo 'export default SceneMap;' >> SceneMap.tsx

    echo 'Map Component Created'
fi
  
echo "#######################################"
echo "##########INSTALL COMPLETED!###########"
echo "  ###################################"
echo "    ###############################"
echo "      ###########################"
echo "        #######################"
echo "          ###################"

yarn dev


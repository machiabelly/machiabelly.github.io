import { SceneDataManifestImporter } from "@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData";
const manifest = {
  properties: "1703738544873",
  root: "1703447067824",
  nodes: {
    eyes: "1703738544873",
    "eyes/actor1": "1703714295886",
    "eyes/MAT": "1703440069839",
    "eyes/MAT/meshStandardBuilder1": "1703717698965",
    glass: "1703714295886",
    "glass/MAT": "1703440069839",
    "glass/MAT/meshPhysicalBuilder1": "1703738544873",
    Text: "1703705051596",
    "Text/MAT": "1703448598887",
    bg: "1703440069839",
    "bg/MAT": "1703440069839",
    postProcessNetwork1: "1703725993427",
  },
  shaders: {
    "/eyes/MAT/meshStandardBuilder1": {
      vertex: "1703440069839",
      fragment: "1703440069839",
      "customDepthMaterial.vertex": "1703440069839",
      "customDepthMaterial.fragment": "1703440069839",
      "customDistanceMaterial.vertex": "1703440069839",
      "customDistanceMaterial.fragment": "1703440069839",
      "customDepthDOFMaterial.vertex": "1703440069839",
      "customDepthDOFMaterial.fragment": "1703440069839",
    },
    "/glass/MAT/meshPhysicalBuilder1": {
      vertex: "1703440069839",
      fragment: "1703440069839",
      "customDepthMaterial.vertex": "1703440069839",
      "customDepthMaterial.fragment": "1703440069839",
      "customDistanceMaterial.vertex": "1703440069839",
      "customDistanceMaterial.fragment": "1703440069839",
      "customDepthDOFMaterial.vertex": "1703440069839",
      "customDepthDOFMaterial.fragment": "1703440069839",
    },
  },
  jsFunctionBodies: { "/eyes/actor1": "1703714295886" },
};

export const loadSceneData_scene_01 = async (options = {}) => {
  const sceneDataRoot = options.sceneDataRoot || "./polygonjs/scenes";
  return await SceneDataManifestImporter.importSceneData({
    sceneName: "scene_01",
    urlPrefix: sceneDataRoot + "/scene_01",
    manifest: manifest,
    onProgress: options.onProgress,
  });
};

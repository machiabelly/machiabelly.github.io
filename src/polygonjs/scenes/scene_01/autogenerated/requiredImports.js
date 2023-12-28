// mat
import { MeshPhysicalBuilderMatNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/mat/MeshPhysicalBuilder";
import { MeshStandardMatNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/mat/MeshStandard";
import { MeshStandardBuilderMatNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/mat/MeshStandardBuilder";
// obj
import { CopNetworkObjNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/obj/CopNetwork";
import { GeoObjNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/obj/Geo";
import { OrthographicCameraObjNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/obj/OrthographicCamera";
import { PostProcessNetworkObjNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/obj/PostProcessNetwork";
// post
import { BlurPostNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/post/Blur";
import { NoisePostNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/post/Noise";
// sop
import { ActorSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Actor";
import { AttribIdSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/AttribId";
import { BoxSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Box";
import { CopySopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Copy";
import { MaterialSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Material";
import { MaterialsNetworkSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/MaterialsNetwork";
import { PlaneSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Plane";
import { SphereSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Sphere";
import { TextSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Text";
import { TransformSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Transform";

// named functions
import { addVector } from "@polygonjs/polygonjs/dist/src/engine/functions/addVector";
import { globalsRayFromCursor } from "@polygonjs/polygonjs/dist/src/engine/functions/globalsRayFromCursor";
import { globalsTime } from "@polygonjs/polygonjs/dist/src/engine/functions/globalsTime";
import { globalsTimeDelta } from "@polygonjs/polygonjs/dist/src/engine/functions/globalsTimeDelta";
import { planeSet } from "@polygonjs/polygonjs/dist/src/engine/functions/planeSet";
import { rayIntersectPlane } from "@polygonjs/polygonjs/dist/src/engine/functions/rayIntersectPlane";
import { setObjectLookAt } from "@polygonjs/polygonjs/dist/src/engine/functions/setObjectLookAt";

export const requiredImports_scene_01 = {
  nodes: [
    MeshPhysicalBuilderMatNode,
    MeshStandardMatNode,
    MeshStandardBuilderMatNode,
    CopNetworkObjNode,
    GeoObjNode,
    OrthographicCameraObjNode,
    PostProcessNetworkObjNode,
    BlurPostNode,
    NoisePostNode,
    ActorSopNode,
    AttribIdSopNode,
    BoxSopNode,
    CopySopNode,
    MaterialSopNode,
    MaterialsNetworkSopNode,
    PlaneSopNode,
    SphereSopNode,
    TextSopNode,
    TransformSopNode,
  ],
  operations: [],
  jsFunctions: [
    addVector,
    globalsRayFromCursor,
    globalsTime,
    globalsTimeDelta,
    planeSet,
    rayIntersectPlane,
    setObjectLookAt,
  ],
};

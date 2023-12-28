
// INSERT DEFINES


#if DEPTH_PACKING == 3200

	uniform float opacity;

#endif

#include <common>



// /eyes/MAT/meshStandardBuilder1/fit1
//
//
// FIT
//
//
float fit(float val, float srcMin, float srcMax, float destMin, float destMax){
	float src_range = srcMax - srcMin;
	float dest_range = destMax - destMin;

	float r = (val - srcMin) / src_range;
	return (r * dest_range) + destMin;
}
vec2 fit(vec2 val, vec2 srcMin, vec2 srcMax, vec2 destMin, vec2 destMax){
	return vec2(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y)
	);
}
vec3 fit(vec3 val, vec3 srcMin, vec3 srcMax, vec3 destMin, vec3 destMax){
	return vec3(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y),
		fit(val.z, srcMin.z, srcMax.z, destMin.z, destMax.z)
	);
}
vec4 fit(vec4 val, vec4 srcMin, vec4 srcMax, vec4 destMin, vec4 destMax){
	return vec4(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y),
		fit(val.z, srcMin.z, srcMax.z, destMin.z, destMax.z),
		fit(val.w, srcMin.w, srcMax.w, destMin.w, destMax.w)
	);
}

//
//
// FIT TO 01
// fits the range [srcMin, srcMax] to [0, 1]
//
float fitTo01(float val, float srcMin, float srcMax){
	float size = srcMax - srcMin;
	return (val - srcMin) / size;
}
vec2 fitTo01(vec2 val, vec2 srcMin, vec2 srcMax){
	return vec2(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y)
	);
}
vec3 fitTo01(vec3 val, vec3 srcMin, vec3 srcMax){
	return vec3(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y),
		fitTo01(val.z, srcMin.z, srcMax.z)
	);
}
vec4 fitTo01(vec4 val, vec4 srcMin, vec4 srcMax){
	return vec4(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y),
		fitTo01(val.z, srcMin.z, srcMax.z),
		fitTo01(val.w, srcMin.w, srcMax.w)
	);
}

//
//
// FIT FROM 01
// fits the range [0, 1] to [destMin, destMax]
//
float fitFrom01(float val, float destMin, float destMax){
	return fit(val, 0.0, 1.0, destMin, destMax);
}
vec2 fitFrom01(vec2 val, vec2 srcMin, vec2 srcMax){
	return vec2(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y)
	);
}
vec3 fitFrom01(vec3 val, vec3 srcMin, vec3 srcMax){
	return vec3(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y),
		fitFrom01(val.z, srcMin.z, srcMax.z)
	);
}
vec4 fitFrom01(vec4 val, vec4 srcMin, vec4 srcMax){
	return vec4(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y),
		fitFrom01(val.z, srcMin.z, srcMax.z),
		fitFrom01(val.w, srcMin.w, srcMax.w)
	);
}

//
//
// FIT FROM 01 TO VARIANCE
// fits the range [0, 1] to [center - variance, center + variance]
//
float fitFrom01ToVariance(float val, float center, float variance){
	return fitFrom01(val, center - variance, center + variance);
}
vec2 fitFrom01ToVariance(vec2 val, vec2 center, vec2 variance){
	return vec2(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y)
	);
}
vec3 fitFrom01ToVariance(vec3 val, vec3 center, vec3 variance){
	return vec3(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y),
		fitFrom01ToVariance(val.z, center.z, variance.z)
	);
}
vec4 fitFrom01ToVariance(vec4 val, vec4 center, vec4 variance){
	return vec4(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y),
		fitFrom01ToVariance(val.z, center.z, variance.z),
		fitFrom01ToVariance(val.w, center.w, variance.w)
	);
}







// /eyes/MAT/meshStandardBuilder1/globals1
uniform float time;

// /eyes/MAT/meshStandardBuilder1/ramp1
uniform sampler2D v_POLY_ramp_ramp1;

// /eyes/MAT/meshStandardBuilder1/globals1
varying vec2 v_POLY_globals1_uv;




#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>

varying vec2 vHighPrecisionZW;

struct SSSModel {
	bool isActive;
	vec3 color;
	float thickness;
	float power;
	float scale;
	float distortion;
	float ambient;
	float attenuation;
};

void RE_Direct_Scattering(
	const in IncidentLight directLight,
	const in vec3 geometryNormal,
	const in vec3 geometryViewDir,
	const in SSSModel sssModel,
	inout ReflectedLight reflectedLight
	){
	vec3 scatteringHalf = normalize(directLight.direction + (geometryNormal * sssModel.distortion));
	float scatteringDot = pow(saturate(dot(geometryViewDir, -scatteringHalf)), sssModel.power) * sssModel.scale;
	vec3 scatteringIllu = (scatteringDot + sssModel.ambient) * (sssModel.color * (1.0-sssModel.thickness));
	reflectedLight.directDiffuse += scatteringIllu * sssModel.attenuation * directLight.color;
}

void main() {

	#include <clipping_planes_fragment>

	vec4 diffuseColor = vec4( 1.0 );

	#if DEPTH_PACKING == 3200

		diffuseColor.a = opacity;

	#endif


	#include <map_fragment>
	#include <alphamap_fragment>



	// /eyes/MAT/meshStandardBuilder1/globals1
	float v_POLY_globals1_time = time;
	
	// /eyes/MAT/meshStandardBuilder1/null2
	vec2 v_POLY_null2_val = v_POLY_globals1_uv;
	
	// /eyes/MAT/meshStandardBuilder1/null1
	float v_POLY_null1_val = v_POLY_globals1_time;
	
	// /eyes/MAT/meshStandardBuilder1/vec2ToFloat1
	float v_POLY_vec2ToFloat1_y = v_POLY_null2_val.y;
	
	// /eyes/MAT/meshStandardBuilder1/multAdd3
	float v_POLY_multAdd3_val = (0.4*(v_POLY_null1_val + 0.0)) + 0.0;
	
	// /eyes/MAT/meshStandardBuilder1/multAdd4
	float v_POLY_multAdd4_val = (0.5*(v_POLY_null1_val + 0.0)) + 0.0;
	
	// /eyes/MAT/meshStandardBuilder1/multAdd5
	float v_POLY_multAdd5_val = (0.6*(v_POLY_null1_val + 0.0)) + 0.0;
	
	// /eyes/MAT/meshStandardBuilder1/multAdd2
	float v_POLY_multAdd2_val = (4.5*(v_POLY_vec2ToFloat1_y + 0.0)) + 0.0;
	
	// /eyes/MAT/meshStandardBuilder1/sin1
	float v_POLY_sin1_val = sin(v_POLY_multAdd3_val);
	
	// /eyes/MAT/meshStandardBuilder1/sin2
	float v_POLY_sin2_val = sin(v_POLY_multAdd4_val);
	
	// /eyes/MAT/meshStandardBuilder1/sin3
	float v_POLY_sin3_val = sin(v_POLY_multAdd5_val);
	
	// /eyes/MAT/meshStandardBuilder1/multAdd1
	float v_POLY_multAdd1_val = (1.0*(v_POLY_sin1_val + 1.0)) + 1.0;
	
	// /eyes/MAT/meshStandardBuilder1/multAdd6
	float v_POLY_multAdd6_val = (1.0*(v_POLY_sin2_val + 1.0)) + 1.0;
	
	// /eyes/MAT/meshStandardBuilder1/multAdd7
	float v_POLY_multAdd7_val = (1.0*(v_POLY_sin3_val + 1.0)) + 1.0;
	
	// /eyes/MAT/meshStandardBuilder1/fit1
	float v_POLY_fit1_val = fit(v_POLY_multAdd2_val, v_POLY_sin1_val, v_POLY_multAdd1_val, 1.0, 0.0);
	
	// /eyes/MAT/meshStandardBuilder1/fit2
	float v_POLY_fit2_val = fit(v_POLY_multAdd2_val, v_POLY_sin2_val, v_POLY_multAdd6_val, 1.0, 0.0);
	
	// /eyes/MAT/meshStandardBuilder1/fit3
	float v_POLY_fit3_val = fit(v_POLY_multAdd2_val, v_POLY_sin3_val, v_POLY_multAdd7_val, 1.0, 0.0);
	
	// /eyes/MAT/meshStandardBuilder1/ramp1
	float v_POLY_ramp1_val = texture2D(v_POLY_ramp_ramp1, vec2(v_POLY_fit1_val, 0.0)).x;
	
	// /eyes/MAT/meshStandardBuilder1/ramp2
	float v_POLY_ramp2_val = texture2D(v_POLY_ramp_ramp1, vec2(v_POLY_fit2_val, 0.0)).x;
	
	// /eyes/MAT/meshStandardBuilder1/ramp3
	float v_POLY_ramp3_val = texture2D(v_POLY_ramp_ramp1, vec2(v_POLY_fit3_val, 0.0)).x;
	
	// /eyes/MAT/meshStandardBuilder1/floatToVec3_1
	vec3 v_POLY_floatToVec3_1_vec3 = vec3(v_POLY_ramp1_val, v_POLY_ramp2_val, v_POLY_ramp3_val);
	
	// /eyes/MAT/meshStandardBuilder1/output1
	float POLY_metalness = 1.0;
	float POLY_roughness = 1.0;
	vec3 POLY_emissive = v_POLY_floatToVec3_1_vec3;
	SSSModel POLY_SSSModel = SSSModel(/*isActive*/false,/*color*/vec3(1.0, 1.0, 1.0), /*thickness*/0.1, /*power*/2.0, /*scale*/16.0, /*distortion*/0.1,/*ambient*/0.4,/*attenuation*/0.8 );




	// INSERT BODY
	// the new body lines should be added before the alphatest_fragment
	// so that alpha is set before (which is really how it would be set if the alphamap_fragment above was used by the material node parameters)

	#include <alphatest_fragment>

	#include <logdepthbuf_fragment>


	// Higher precision equivalent of gl_FragCoord.z. This assumes depthRange has been left to its default values.
	float fragCoordZ = 0.5 * vHighPrecisionZW[0] / vHighPrecisionZW[1] + 0.5;

	#if DEPTH_PACKING == 3200

		gl_FragColor = vec4( vec3( 1.0 - fragCoordZ ), diffuseColor.a );

	#elif DEPTH_PACKING == 3201

		gl_FragColor = packDepthToRGBA( fragCoordZ );

	#endif

}

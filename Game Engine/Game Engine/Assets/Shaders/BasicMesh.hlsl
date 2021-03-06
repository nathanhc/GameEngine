#include "Constants.hlsl"

// Input structs for vertex and pixel shader
struct VS_INPUT
{
	float3 mPos : POSITION;
	float3 mNorm : NORMAL;
	float2 mTex : TEXCOORD0;
};

struct PS_INPUT
{
	float4 mPos : SV_POSITION;
	float2 mTex: TEXCOORD0;
};

//--------------------------------------------------------------------------------------
// Vertex Shader
//--------------------------------------------------------------------------------------
PS_INPUT VS(VS_INPUT input)
{
	PS_INPUT output;

	// TODO: Lab 2
	// (For now, just directly copy position/tex coord)
	output.mPos = float4(input.mPos, 1.0f);
	output.mPos = mul(output.mPos, worldMatrix);
	output.mPos = mul(output.mPos, viewMatrix);
	output.mTex = input.mTex;

	return output;
}


//--------------------------------------------------------------------------------------
// Pixel Shader
//--------------------------------------------------------------------------------------
float4 PS(PS_INPUT input) : SV_Target
{
	// TODO: Lab 2
	return DiffuseTexture.Sample(DefaultSampler, input.mTex);    // Yellow, with Alpha = 1
}

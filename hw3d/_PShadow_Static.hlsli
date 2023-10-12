TextureCube smap : register(t3);
SamplerComparisonState ssam : register(s1);

static const float zf = 100.0f;
static const float zn = 0.5f;
static const float c1 = zf / (zf - zn);
static const float c0 = -zn * zf / (zf - zn);

float CalculateShadowDepth(const in float4 shadowPos)
{
    // get magnitudes for each basis component
    const float3 m = abs(shadowPos).xyz;
    // get the length in the dominant axis
    // (this correlates with shadow map face and derives comparison depth)
    const float major = max(m.x, max(m.y, m.z));
    // converting from distance in shadow light space to projected depth
    return (c1 * major + c0) / major;
}

float Shadow(const in float4 shadowPos)
{
<<<<<<< HEAD
    return smap.SampleCmpLevelZero(ssam, shadowPos.xyz, CalculateShadowDepth(shadowPos));
=======
    return 1.0f;
    //smap.SampleCmpLevelZero(ssam, normalize(shadowPos.xyz), length(shadowPos.xyz) / 100.0f);
>>>>>>> parent of 7eab495 (trying slope scale cartesian trick)
}
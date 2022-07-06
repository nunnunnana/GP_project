Shader "Custom/Blur"
{
	Properties
	{
		_Blur("Blur", float) = 10
	}
		SubShader
	{
		Tags{ "Queue" = "Transparent" }
		GrabPass{}
	Pass
	{
	CGPROGRAM
	#pragma vertex vert
	#pragma fragment frag
	#include "UnityCG.cginc"

	struct v2f
	{
		float4 uv : TEXCOORD0;
		float4 pos : SV_POSITION;
	};

	v2f vert(float4 vertex : POSITION, float4 uv : TEXCOORD0)
	{
		v2f o;
		o.pos = UnityObjectToClipPos(vertex);
		o.uv = ComputeGrabScreenPos(o.pos);
		return o;
	}

	sampler2D _GrabTexture;
	fixed4 _GrabTexture_TexelSize;
	fixed4 color;
	float _Blur;

	fixed4 frag(v2f i) : SV_Target
	{
		// 가로방향 블러처리
		float blur = _Blur;
		blur = max(1, blur);
		float average = 0;
		// 현재 위치를 중심으로 왼쪽에서 오른쪽 방향으로 픽셀을 흐리게하는 반복문
		for (float width = -blur; width <= blur; width += 1)
		{
			// 블러의 반경이 변화해도 똑같이 처리하기 위해 거리계산
			float distance = abs(width / blur);
			// 가우시안 블러 알고리즘 계산
			float x = exp(-0.5 * pow(distance, 2) * 5.0);
			average += x;
			// _GrabTexture_TexelSize.x에 GrabPass에서 화면 텍스쳐 사이즈를 얻는다.
			// 원래의 _Grab Texture를 참조해 가중치를 실어 덧셈
			color += tex2Dproj(_GrabTexture, i.uv + float4(width * _GrabTexture_TexelSize.x, 0, 0, 0)) * x;
		}
		// 색상을 가중치의 합계로 나눠 평균값 계산후 반환
		color /= average;
		return color;
	}
	ENDCG
	}
	GrabPass{}
	Pass
	{
	CGPROGRAM
	#pragma vertex vert
	#pragma fragment frag
	#include "UnityCG.cginc"

	struct v2f
	{
		float4 uv : TEXCOORD0;
		float4 pos : SV_POSITION;
	};

	v2f vert(float4 vertex : POSITION, float4 uv : TEXCOORD0)
	{
		v2f o;
		o.pos = UnityObjectToClipPos(vertex);
		o.uv = ComputeGrabScreenPos(o.pos);
		return o;
	}

	sampler2D _GrabTexture;
	fixed4 _GrabTexture_TexelSize;
	fixed4 color;
	float _Blur;

	fixed4 frag(v2f i) : SV_Target
	{
		// 세로방향 블러처리
		float blur = _Blur;
		blur = max(1, blur);
		float average = 0;
		// 현재 위치를 중심으로 아래에서 위로 픽셀을 흐리게하는 반복문
		for (float height = -blur; height <= blur; height += 1)
		{
			float distance = abs(height / blur);
			float x = exp(-0.5 * pow(distance, 2) * 5.0);
			average += x;
			// _GrabTexture_TexelSize.y에 GrabPass에서 화면 텍스쳐 사이즈를 얻는다.
			color += tex2Dproj(_GrabTexture, i.uv + float4(0, height * _GrabTexture_TexelSize.y, 0, 0)) * x;
		}
		color /= average;
		return color;
		}
	ENDCG
	}
  }
}

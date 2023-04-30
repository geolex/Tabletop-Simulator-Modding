// Upgrade NOTE: upgraded instancing buffer 'VertexColorMask' to new syntax.

// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VertexColorMask"
{
	Properties
	{
		_Primary("Primary", Color) = (1,0,0,1)
		_Secondary("Secondary", Color) = (0,1,0,1)
		_Details("Details", Color) = (0,0,1,1)
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		Blend SrcAlpha OneMinusSrcAlpha
		
		CGPROGRAM
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 vertexColor : COLOR;
		};

		UNITY_INSTANCING_BUFFER_START(VertexColorMask)
			UNITY_DEFINE_INSTANCED_PROP(float4, _Primary)
#define _Primary_arr VertexColorMask
			UNITY_DEFINE_INSTANCED_PROP(float4, _Secondary)
#define _Secondary_arr VertexColorMask
			UNITY_DEFINE_INSTANCED_PROP(float4, _Details)
#define _Details_arr VertexColorMask
		UNITY_INSTANCING_BUFFER_END(VertexColorMask)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 _Primary_Instance = UNITY_ACCESS_INSTANCED_PROP(_Primary_arr, _Primary);
			float4 _Secondary_Instance = UNITY_ACCESS_INSTANCED_PROP(_Secondary_arr, _Secondary);
			float4 _Details_Instance = UNITY_ACCESS_INSTANCED_PROP(_Details_arr, _Details);
			o.Albedo = ( ( i.vertexColor.r * _Primary_Instance ) + ( i.vertexColor.g * _Secondary_Instance ) + ( i.vertexColor.b * _Details_Instance ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.VertexColorNode;5;-1109.366,-41.93002;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-400.0892,-20.80237;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-411.2893,180.7977;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-390.4893,391.9976;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;9;-171.2889,135.9978;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;2;-668.4136,226.5942;Inherit;False;InstancedProperty;_Secondary;Secondary;1;0;Create;True;0;0;0;False;0;False;0,1,0,1;0,1,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;4;-663.8616,396.261;Inherit;False;InstancedProperty;_Details;Details;2;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1;-668.7802,58.25058;Inherit;False;InstancedProperty;_Primary;Primary;0;0;Create;True;0;0;0;False;0;False;1,0,0,1;1,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;VertexColorMask;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;2;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;0;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;5;1
WireConnection;6;1;1;0
WireConnection;7;0;5;2
WireConnection;7;1;2;0
WireConnection;8;0;5;3
WireConnection;8;1;4;0
WireConnection;9;0;6;0
WireConnection;9;1;7;0
WireConnection;9;2;8;0
WireConnection;0;0;9;0
WireConnection;0;10;5;4
ASEEND*/
//CHKSM=6C0849028C7BE0D8A2A852CB39C2D14C4681E28A
// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VertexColorMask"
{
	Properties
	{
		_Color0("Color 0", Color) = (0.9098039,0,0,1)
		_ColorPalette("ColorPalette", 2D) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		Blend SrcAlpha OneMinusSrcAlpha
		
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 vertexColor : COLOR;
		};

		uniform sampler2D _ColorPalette;
		uniform float4 _Color0;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float temp_output_1_0_g7 = ( _Color0.r * 16.0 );
			float temp_output_4_0_g7 = floor( temp_output_1_0_g7 );
			float2 appendResult5_g7 = (float2(( temp_output_1_0_g7 - temp_output_4_0_g7 ) , ( temp_output_4_0_g7 / 16.0 )));
			float temp_output_1_0_g8 = ( _Color0.g * 16.0 );
			float temp_output_4_0_g8 = floor( temp_output_1_0_g8 );
			float2 appendResult5_g8 = (float2(( temp_output_1_0_g8 - temp_output_4_0_g8 ) , ( temp_output_4_0_g8 / 16.0 )));
			float temp_output_1_0_g6 = ( _Color0.b * 16.0 );
			float temp_output_4_0_g6 = floor( temp_output_1_0_g6 );
			float2 appendResult5_g6 = (float2(( temp_output_1_0_g6 - temp_output_4_0_g6 ) , ( temp_output_4_0_g6 / 16.0 )));
			o.Albedo = ( ( i.vertexColor.r * tex2D( _ColorPalette, appendResult5_g7 ) ) + ( i.vertexColor.g * tex2D( _ColorPalette, appendResult5_g8 ) ) + ( i.vertexColor.b * tex2D( _ColorPalette, appendResult5_g6 ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-400.0892,-20.80237;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-411.2893,180.7977;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-390.4893,391.9976;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;9;-171.2889,135.9978;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;5;-1289.366,-48.93002;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;VertexColorMask;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;2;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.ColorNode;10;-1329.542,129.59;Inherit;False;Property;_Color0;Color 0;0;0;Create;True;0;0;0;False;0;False;0.9098039,0,0,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;37;-856.1742,305.537;Inherit;False;SamplePalette;1;;6;66e7057c4d8dfb548a5bca487bf59ff4;0;1;8;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;38;-860.2571,66.25655;Inherit;False;SamplePalette;1;;7;66e7057c4d8dfb548a5bca487bf59ff4;0;1;8;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;39;-863.1742,192.7122;Inherit;False;SamplePalette;1;;8;66e7057c4d8dfb548a5bca487bf59ff4;0;1;8;FLOAT;0;False;1;COLOR;0
WireConnection;6;0;5;1
WireConnection;6;1;38;0
WireConnection;7;0;5;2
WireConnection;7;1;39;0
WireConnection;8;0;5;3
WireConnection;8;1;37;0
WireConnection;9;0;6;0
WireConnection;9;1;7;0
WireConnection;9;2;8;0
WireConnection;0;0;9;0
WireConnection;37;8;10;3
WireConnection;38;8;10;1
WireConnection;39;8;10;2
ASEEND*/
//CHKSM=EE4EBDDB78578A50995BD8BE99C2B8B258F5FE14
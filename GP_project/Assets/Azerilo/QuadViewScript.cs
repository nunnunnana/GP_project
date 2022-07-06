using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class QuadViewScript : MonoBehaviour
{
    Car motor;
    Renderer rend;
    float i = 0.0f;
    float min = 0;
    float max = 1;

    void Awake()
    {
        motor=GameObject.Find("car 1203 yellow").GetComponent<Car>();
        rend = GetComponent<Renderer>();
        rend.material.shader = Shader.Find("Custom/QuadView");
    }
    
    void FixedUpdate()
    {
        i = Mathf.Clamp(i, min, max);

        if (motor.speed > 1){
            i += 0.00003f;
            if(i > 0.12f){
                i = 0.12f;
            }
        }
        else{
            i -= 0.001f;
            if(i <= 0.001f){
                i = 0.0f;
            }
        }
        rend.material.SetFloat("_RefStrength", i);
    }
}

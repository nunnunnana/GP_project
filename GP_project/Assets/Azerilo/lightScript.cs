using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class lightScript : MonoBehaviour
{
    public Material basic;
    public Material back;
    public Material brake;
    public Renderer rend;

    void Awake()
    {
        rend = GetComponent<Renderer>();
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        if (Input.GetKey(KeyCode.W))
        {
            rend.sharedMaterial = basic;
        }
        else if (Input.GetKey(KeyCode.S))
        {
            rend.sharedMaterial = back;
        }
        else if (Input.GetKey(KeyCode.Space))
        {
            rend.sharedMaterial = brake;
        }
        else
        {
            rend.sharedMaterial = basic;
        }
    }
}

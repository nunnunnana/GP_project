using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HandleRoll : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        if (Input.GetKey(KeyCode.A)){
            transform.localRotation = Quaternion.Slerp(transform.localRotation, 
                Quaternion.Euler(0.0f, 0.0f, 40.0f), 2 * Time.deltaTime);
        }
        else if (Input.GetKey(KeyCode.D)){
            transform.localRotation = Quaternion.Slerp(transform.localRotation,
                Quaternion.Euler(0.0f, 0.0f, -40.0f), 2 * Time.deltaTime);
        }
        else{
            transform.localRotation = Quaternion.Slerp(transform.localRotation,
                Quaternion.Euler(0.0f, 0.0f, 0.0f), 2 * Time.deltaTime);
        }
    }
}

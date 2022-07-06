using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cm_Script : MonoBehaviour
{

    public GameObject[] cameras;
    public GameObject QuadView;
    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown("z")){
            cameras[0].SetActive(true);
            cameras[1].SetActive(false);
            cameras[2].SetActive(false);
            QuadView.SetActive(true);
        }
        else if(Input.GetKeyDown("x")){
            cameras[0].SetActive(false);
            cameras[1].SetActive(true);
            cameras[2].SetActive(false);
            }
        else if(Input.GetKeyDown("c")){
            cameras[0].SetActive(false);
            cameras[1].SetActive(false);
            cameras[2].SetActive(true);
            QuadView.SetActive(false);
        }
    }
}

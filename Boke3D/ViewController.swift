//
//  ViewController.swift
//  Boke3D
//
//  Created by mahmoud on 11/28/18.
//  Copyright © 2018 mahmoud. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //sceneView.showsStatistics = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        if let imageTracked = ARReferenceImage.referenceImages(inGroupNamed: "test-card", bundle: Bundle.main){
            configuration.trackingImages = imageTracked
            configuration.maximumNumberOfTrackedImages = 1
        }
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
 
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        if let imageAnchor = anchor as? ARImageAnchor{

//            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
//            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
//            let planeNode = SCNNode(geometry: plane)
//            planeNode.eulerAngles.x = -.pi/2
//            node.addChildNode(planeNode)
            
            if let pokeScene = SCNScene(named: "art.scnassets/eevee.scn"){
                if let pokeNode = pokeScene.rootNode.childNodes.first{
                   // pokeNode.eulerAngles.x = .pi/2
                    node.addChildNode(pokeNode)
                }
            }
            
            
        }
        return node
    }
    
    
    
    
}

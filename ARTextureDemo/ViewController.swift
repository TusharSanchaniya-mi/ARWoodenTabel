//
//  ViewController.swift
//  ARTextureDemo
//
//  Created by Mindinventory on 16/12/24.
//

import UIKit
import SceneKit
import ARKit

enum CollectionSection {
    case glass
    case table
}

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var colorGlassCollectionView: UICollectionView!
    private let configuration = ARWorldTrackingConfiguration()
    private let arcCoachingOverlay = ARCoachingOverlayView()
    private var isSurfaceDetected = false
    private var isNodeAdded = false
    private var currentYPos: Float = 0
    private let NODE_NAME = "chair"
    private let arrCollection = [CollectionSection.table, CollectionSection.glass]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.session.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = []
        sceneView.preferredFramesPerSecond = 30
        sceneView.automaticallyUpdatesLighting = true
        
        let sceneView = SCNScene()
        
        self.sceneView.scene = sceneView
        
        self.addRightNavButton()
        self.configureCollectionView()
    }
    
    func addRightNavButton() {
        self.navigationController?.isNavigationBarHidden = false
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: "repeat.circle")?.withTintColor(.white, renderingMode: .alwaysTemplate)
        button.setImage(image, for: .normal)
        button.setImage(image, for: .selected)
        button.transform = CGAffineTransform(rotationAngle: .pi / 2)
        button.addTarget(self, action: #selector(arResetClick), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: button)]
    }
    
    @objc private func arResetClick() {
        self.sceneView.scene.rootNode.childNodes.filter({$0.name == NODE_NAME}).forEach({$0.removeFromParentNode()})
        self.isNodeAdded = false
        self.hideShowCollectionView(show: false)
        self.colorCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
        self.colorGlassCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
    }
    
    
    private func configureCollectionView() {
        self.colorCollectionView.delegate = self
        self.colorCollectionView.dataSource = self
        let nib = UINib(nibName: "ColorViewCell", bundle: nil)
        self.colorCollectionView.register(nib, forCellWithReuseIdentifier: "ColorViewCell")
        self.colorCollectionView.reloadData()
        
        self.colorGlassCollectionView.delegate = self
        self.colorGlassCollectionView.dataSource = self
        self.colorGlassCollectionView.register(nib, forCellWithReuseIdentifier: "ColorViewCell")
        self.colorGlassCollectionView.reloadData()
        self.hideShowCollectionView(show: false)
    }
    
    
    private func hideShowCollectionView(show: Bool) {
        if show == false {
            self.colorCollectionView.alpha = 0
            self.colorGlassCollectionView.alpha = 0
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.6, execute: { [weak self] in
                UIView.animate(withDuration: 0.5) {
                    self?.colorCollectionView.alpha = 1
                    self?.colorGlassCollectionView.alpha = 1
                }
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configuration.planeDetection = .horizontal
        
        arcCoachingOverlay.frame = CGRect(
            x: (self.view.bounds.width - arcCoachingOverlay.bounds.width) / 2,
            y: (self.view.bounds.height - arcCoachingOverlay.bounds.height) / 2,
            width: arcCoachingOverlay.bounds.width,
            height: arcCoachingOverlay.bounds.height
        )
        arcCoachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        arcCoachingOverlay.session = sceneView.session
        arcCoachingOverlay.delegate = self
        arcCoachingOverlay.goal = .horizontalPlane
        
        self.view.addSubview(arcCoachingOverlay)
        
        self.recognizeGesture()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    func recognizeGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.sceneView.addGestureRecognizer(gesture)
        
        // Create a pan gesture recognizer
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        self.sceneView.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        sceneView.addGestureRecognizer(pinchGesture)
    }
    
    @objc func handlePinch(_ recognizer: UIPinchGestureRecognizer) {
        guard let sceneView = recognizer.view as? ARSCNView,
              self.isNodeAdded,
        let selectedNode = self.sceneView.scene.rootNode.childNode(withName: NODE_NAME, recursively: true) else {
            return
        }
        
        let scale = Float(recognizer.scale)
        selectedNode.scale = SCNVector3(selectedNode.scale.x * scale, selectedNode.scale.y * scale, selectedNode.scale.z * scale)
        
        // Reset scale to prevent exponential growth
        recognizer.scale = 1.0
    }
    
    @objc func tapped(recognizer: UITapGestureRecognizer) {
        guard let sceneView = recognizer.view as? ARSCNView, !self.isNodeAdded else {
               return
           }
           let touch = recognizer.location(in: sceneView)
           let hitTestResult =  sceneView.hitTest(touch,types: .existingPlane)
           if let hitTest = hitTestResult.first {
               let chairScene = SCNScene(named: "Wood_Table.dae")
               guard let chairNode = chairScene?.rootNode.childNode(withName: "Wood_Table", recursively: true) else {
                   return
               }
               chairNode.name = NODE_NAME
               chairNode.position = SCNVector3(hitTest.worldTransform.columns.3.x,
                                                hitTest.worldTransform.columns.3.y,
                                                hitTest.worldTransform.columns.3.z)
               self.sceneView.scene.rootNode.addChildNode(chairNode)
               self.isNodeAdded = true
               self.hideShowCollectionView(show: true)
           }
       }
    
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        
        guard let sceneView = recognizer.view as? ARSCNView,
              self.isNodeAdded,
        let selectedNode = self.sceneView.scene.rootNode.childNode(withName: NODE_NAME, recursively: true) else {
            return
        }
        
        // Get the translation in the X direction (horizontal swipe)
        let translation = recognizer.translation(in: sceneView)
        
        // Convert the translation to an angular change (in radians)
        let rotationSpeed: CGFloat = 0.005 // Adjust speed if needed
        let rotationAmount = translation.x * rotationSpeed
        
        // Apply the rotation to the node (adjusting only the Y-axis)
        selectedNode.eulerAngles.y += Float(rotationAmount)
        
        // Reset the translation to prevent continuous rotation
        recognizer.setTranslation(CGPoint.zero, in: sceneView)
    }
    
}


extension ViewController: ARSessionDelegate {
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

extension ViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {

    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate camera: ARCamera) {

    }
}

extension ViewController: ARCoachingOverlayViewDelegate {
    
    
    func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
        print("coachingOverlayViewWillActivate: View Will Appear")
        self.hideShowCollectionView(show: false)
    }
    
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        print("coachingOverlayViewDidDeactivate: View Did Disappear")
        if self.isNodeAdded {
            self.hideShowCollectionView(show: true)
        }
    }
    
    func coachingOverlayViewDidRequestSessionReset(_ coachingOverlayView: ARCoachingOverlayView) {
        print("Coaching overlay requested session reset")
        resetARSession()
    }
    
    // Reset AR Session
    func resetARSession() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        self.isNodeAdded = false
        self.hideShowCollectionView(show: false)
    }
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == colorCollectionView {
            return FurnitureColor.shared.tableColors.count
        }
        else {
            return FurnitureColor.shared.glassColors.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == colorCollectionView {
            CGSize(width: 100.0, height: 100.0)
        }
        else {
            CGSize(width: 65.0, height: 65.0)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorViewCell", for: indexPath) as! ColorViewCell
        if collectionView == colorCollectionView {
            cell.configureView(color: FurnitureColor.shared.tableColors[indexPath.item])
        }
        else {
            cell.configureViewForGlass(color: FurnitureColor.shared.glassColors[indexPath.item])
        }
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedNode = self.sceneView.scene.rootNode.childNode(withName: NODE_NAME, recursively: true) else {
            return
        }
        if collectionView == colorCollectionView {
            let tableMaterial = selectedNode.geometry?.material(named: "Wood_Table")
            tableMaterial?.diffuse.contents = UIImage(named: FurnitureColor.shared.tableColors[indexPath.item])
        }
        else {
            let tableMaterial = selectedNode.geometry?.material(named: "Wood_Table_Glass")
            tableMaterial?.diffuse.contents = FurnitureColor.shared.glassColors[indexPath.item]
        }
        
    }
    
}

//
//  ObjectDetectionViewController.swift
//  practice
//
//  Created by GD Seo on 2018. 3. 30..
//  Copyright © 2018년 GD Seo. All rights reserved.
//

import UIKit
import Vision

class ObjectDetectionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var selectedImageView: UIImageView!

    var selectedImage: UIImage? {
        didSet {
            self.selectedImageView.image = selectedImage
        }
    }
    
    var selectedciImage: CIImage? {
        get {
            if let selectedImage = self.selectedImage {
                return CIImage(image: selectedImage)
            } else {
                return nil
            }
        }
    }
    
    @IBAction func AddPhoto(_ sender: UIBarButtonItem) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let importFromAlbum = UIAlertAction(title: "앨범에서 가져오기", style: .default) { _ in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .savedPhotosAlbum
            picker.allowsEditing = true
            
            self.present(picker, animated: true, completion: nil)
        }
        
        let takePhoto = UIAlertAction(title: "카메라로 찍기", style: .default) { _ in
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.cameraCaptureMode = .photo
            
            self.present(picker, animated: true, completion: nil)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in
            
        }
        
        actionSheet.addAction(importFromAlbum)
        actionSheet.addAction(takePhoto)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true)
        if let uiImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.selectedImage = uiImage
            self.detectObject()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func detectObject() {
        if let ciImage = self.selectedciImage {
            do {
                let vnCoreMLModel = try VNCoreMLModel(for: Inceptionv3().model)
                let request = VNCoreMLRequest(model: vnCoreMLModel, completionHandler: self.handleObjectDetection)
                request.imageCropAndScaleOption = .centerCrop
                let requestHandler = VNImageRequestHandler(ciImage: ciImage, options: [:])
                try requestHandler.perform([request])
            } catch {
                print(error)
            }
        }
    }
    
    func handleObjectDetection(request: VNRequest, error: Error?) {
        if let results = request.results as? [VNClassificationObservation] {
            for result in results {
                print("\(result.identifier) : \(result.confidence)")
            }
        }
        
    }

}

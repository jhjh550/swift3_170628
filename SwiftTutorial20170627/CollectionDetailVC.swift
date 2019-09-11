//
//  CollectionDetailVC.swift
//  SwiftTutorial20170627
//
//  Created by ParkD on 2017. 7. 21..
//  Copyright © 2017년 ParkD. All rights reserved.
//

import UIKit
import Photos

class CollectionDetailVC: UIViewController {

    var asset:PHAsset?
    
    
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        showImage()
    }
    
    func showImage(){
        let scale = UIScreen.main.scale
        let size = CGSize(width: self.imageView.bounds.width * scale, height: self.imageView.bounds.height * scale)
        let imageManager = PHImageManager.default().requestImage(for: self.asset!, targetSize: size, contentMode: PHImageContentMode.aspectFit, options: nil) { (result, info) in
            self.imageView.image = result 
        }
    }
    
    func applyFilter(_ filterName:String){
        self.asset?.requestContentEditingInput(with: nil, completionHandler: { (contentInput, _) in
            DispatchQueue.global().async(execute: { 
                let url = contentInput?.fullSizeImageURL
                let orientation = contentInput?.fullSizeImageOrientation
                var inputImg = CIImage(contentsOf: url!, options:nil)
                inputImg = inputImg?.oriented(forExifOrientation: orientation!)
                
                let filter = CIFilter(name: filterName)
                filter?.setDefaults()
                filter?.setValue(inputImg, forKey: kCIInputImageKey)
                let outputImg = filter?.outputImage
                
                let context = CIContext()
                let image = context.createCGImage(outputImg!, from: outputImg!.extent)
                let uiImage = UIImage(cgImage: image!)
                
                let contentOutput = PHContentEditingOutput(contentEditingInput: contentInput!)
                let renderedData = uiImage.jpegData(compressionQuality: 0.9)
            
                if (try? renderedData?.write(to: contentOutput.renderedContentURL) != nil) != nil {
                    let archivedData = NSKeyedArchiver.archivedData(withRootObject: filterName)
                    let adjData = PHAdjustmentData(formatIdentifier: "com.gbustudio.photo", formatVersion: "1.0", data: archivedData)
                    contentOutput.adjustmentData = adjData
                    
                    PHPhotoLibrary.shared().performChanges({ 
                        let request = PHAssetChangeRequest(for: self.asset!)
                        request.contentEditingOutput = contentOutput
                    }, completionHandler: { (success, error) in
                        if success {
                            self.showImage()
                        }
                    })
                }
            })
        })
        
    }
    
    @IBAction func applyEffect(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Mono", style: .default, handler: { (action) in
            self.applyFilter("CIPhotoEffectMono")
        }))
        alertController.addAction(UIAlertAction(title: "Instant", style: .default, handler: { (action) in
            self.applyFilter("CIPhotoEffectInstant")
        }))
        alertController.modalPresentationStyle = .popover
        self.present(alertController, animated: true, completion: nil)
    }

    
    


}

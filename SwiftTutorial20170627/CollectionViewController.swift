//
//  CollectionViewController.swift
//  SwiftTutorial20170627
//
//  Created by ParkD on 2017. 7. 21..
//  Copyright © 2017년 ParkD. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier = "ImageCell"

class CollectionViewController: UICollectionViewController {
    var assetsFetchResults:PHFetchResult<PHAsset> = PHFetchResult<PHAsset>()
    var imageManager:PHCachingImageManager!
    
    override func viewDidLoad() {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status{
            case .authorized:
                self.imageManager = PHCachingImageManager()
                let options = PHFetchOptions()
                options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
                self.assetsFetchResults = PHAsset.fetchAssets(with: options)
                self.collectionView?.reloadData()
            default:
                print("Cannot access photos")
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.assetsFetchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let asset:PHAsset = self.assetsFetchResults[indexPath.item]
        self.imageManager.requestImage(for: asset, targetSize: cell.frame.size, contentMode: PHImageContentMode.aspectFit, options: nil) { (result, info) in
            cell.imageView.image = result
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.collectionView?.indexPath(for: sender as! CollectionViewCell)
        (segue.destination as! CollectionDetailVC).asset = self.assetsFetchResults[indexPath!.item]
    }
}

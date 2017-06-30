//
//  MapViewController.swift
//  SwiftTutorial20170627
//
//  Created by ParkD on 2017. 6. 30..
//  Copyright © 2017년 ParkD. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let geoCoder = CLGeocoder()
        let newLocation = CLLocation(latitude: 40.7485, longitude: -73.984911)
        
        geoCoder.reverseGeocodeLocation(newLocation) { (placemarks, error) in
            if error != nil {
                print("GeoCoder failed : \(error?.localizedDescription)")
            }else{
                if placemarks!.count > 0 {
                   let placemark = placemarks![0]
                    let dic = placemark.addressDictionary!
                    let address = dic["Street"]
                    let city = dic["City"]
                    let state   = dic["State"]
                    let zip = dic["ZIP"]
                    print("\(address) \(city) \(state) \(zip)")
                    
                    let place = MKPlacemark(placemark: placemark)
                    let mapItem = MKMapItem(placemark: place)
                    mapItem.openInMaps(launchOptions: nil)
                }else{
                    print("no match data")
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

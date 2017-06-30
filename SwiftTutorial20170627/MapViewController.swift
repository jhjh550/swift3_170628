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

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManger:CLLocationManager = CLLocationManager()
    
    var matchingItems = [MKMapItem]()
    
    @IBOutlet var mapView: MKMapView!
    @IBAction func searchLocal(_ sender: Any) {
        mapView.removeAnnotations(mapView.annotations)
        matchingItems.removeAll()
        
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchTextField.text!
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if error != nil{
                print("Error : \(error?.localizedDescription)")
            }else{
                for item in response!.mapItems{
                    print("name : \(item.name) phone : \(item.phoneNumber)")
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name!
                    
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
    }
    
    @IBOutlet var searchTextField: UITextField!
    
    @IBAction func zoomIn(_ sender: Any) {
        let userLocation = mapView.userLocation
        
        let region = MKCoordinateRegionMakeWithDistance(userLocation.location!.coordinate, 2000, 2000)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func changeType(_ sender: Any) {
        if mapView.mapType == .standard{
            mapView.mapType = .satellite
        }else{
            mapView.mapType = .standard
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.coordinate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.startUpdatingLocation()
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        
    }
    
    func testGeoCoder(){
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
                    //mapItem.openInMaps(launchOptions: nil)
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

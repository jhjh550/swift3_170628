//
//  AlamofireViewController.swift
//  SwiftTutorial20170627
//
//  Created by ParkD on 2017. 7. 20..
//  Copyright © 2017년 ParkD. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireViewController: UIViewController {

    struct Country:Decodable{
        let name:String
        let capital:String
        let region:String
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        jsonParsing2()
        
        

//        Alamofire.request("https://httpbin.org/get").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
//
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
//        }
    }
    
    func jsonParsing2(){
        Alamofire.request("https://restcountries.eu/rest/v2/all").responseJSON { (response) in
            do{
                let coutries = try JSONDecoder().decode([Country].self, from: response.data!)
                print(coutries)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func jsonParsing(){
        let address = "https://restcountries.eu/rest/v2/all"
        let url = URL(string: address)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                let coutries = try JSONDecoder().decode([Country].self, from: data!)
                
                for country in coutries{
                    print(country.name+" : "+country.capital)
                }
            }catch {
                print(error.localizedDescription)
            }
            }.resume()
    }

    
}

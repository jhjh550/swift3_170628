//
//  XmlViewController.swift
//  SwiftTutorial20170627
//
//  Created by ParkD on 2017. 6. 29..
//  Copyright © 2017년 ParkD. All rights reserved.
//

import UIKit

class XmlViewController: UIViewController, XMLParserDelegate {

    var parser:XMLParser!
    
    class PizzaData{
        var name:String = ""
        var cost:Int = 0
        var desc:String = ""
    }
    
    var pizza = PizzaData()
    var dataList = [PizzaData]()
    var bName = false
    var bCost = false
    var bDesc = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let address = "http://api.androidhive.info/pizza/?format=xml"
        let url = URL(string: address)
        parser = XMLParser(contentsOf: url!)
        parser.delegate = self
        parser.parse()
        
        for data in dataList{
            print(data.desc)
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        switch elementName {
            case "item":
                pizza = PizzaData()
                dataList.append(pizza)
            case "name":
                bName = true
            case "cost":
                bCost = true
            case "description":
                bDesc = true
            default:
                break
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if(bName){
            pizza.name = string
            bName = false
        }else if(bCost){
            pizza.cost = Int(string)!
            bCost = false
        }else if(bDesc){
            pizza.desc = string
            bDesc = false
        }
    }
}








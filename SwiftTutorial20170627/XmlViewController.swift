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
    var bRead = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let address = "http://api.androidhive.info/pizza/?format=xml"
        let url = URL(string: address)
        parser = XMLParser(contentsOf: url!)
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "name"{
            bRead = true
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if bRead {
            print(string)
            bRead = false
        }
    }


}








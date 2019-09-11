//
//  PodcastTableViewController.swift
//  Swift20170717
//
//  Created by imac on 2017. 7. 18..
//  Copyright © 2017년 imac. All rights reserved.
//

import UIKit

class PodcastTableViewController: UITableViewController, XMLParserDelegate {

    
    
    
    var list = [PodData]()
    var podData = PodData()
    var lastElementName :String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://pod.ssenhosting.com/rss/programmer.xml"
        let parser = XMLParser(contentsOf: URL(string: url)!)
        parser?.delegate = self
        parser?.parse()
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "item"{
            podData = PodData()
            list.append(podData)
        }
        if elementName == "title" ||
            elementName == "guid" ||
            elementName == "pubDate" ||
            elementName == "itunes:duration" {
            lastElementName = elementName
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if let name = lastElementName{
            
            switch name {
            case "title":
                podData.title = string
            case "guid":
                podData.url = string
            case "pubDate":
                podData.podDate = string
            case "itunes:duration":
                podData.duration = string
            default:
                break
            }
            
            lastElementName = nil
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PodcastPlayViewController
        if let indexPath = self.tableView.indexPathForSelectedRow{
            var data = list[indexPath.row]
            vc.data = data
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PodListCell", for: indexPath)
        let data = list[indexPath.row]
        cell.textLabel?.text = data.title
        return cell
    }

}

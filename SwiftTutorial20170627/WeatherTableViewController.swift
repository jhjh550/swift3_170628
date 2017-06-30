//
//  WeatherTableViewController.swift
//  SwiftTutorial20170627
//
//  Created by ParkD on 2017. 6. 29..
//  Copyright © 2017년 ParkD. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController, XMLParserDelegate {
    
    class WeatherData{
        var day = 0
        var hour = 0
        var temp = 0.0
        var wfKor = ""
    }
    
    var dataList = [WeatherData]()
    var weather = WeatherData()
    
    var bDay = false
    var bHour = false
    var bTemp = false
    var bWfKor = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let address = "http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1159068000"
        let url = URL(string: address)
        let parser = XMLParser(contentsOf: url!)!
        parser.delegate = self
        parser.parse()
        
        for w in dataList{
            print(w.wfKor)
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        switch elementName {
        case "data":
            weather = WeatherData()
            dataList.append(weather)
        case "day":
            bDay = true
        case "hour":
            bHour = true
        case "temp":
            bTemp = true
        case "wfKor":
            bWfKor = true
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if bDay {
            weather.day = Int(string)!
            bDay = false
        }else if bHour {
            weather.hour = Int(string)!
            bHour = false
        }else if bTemp {
            weather.temp = Double(string)!
            bTemp = false
        }else if bWfKor{
            weather.wfKor = string
            bWfKor = false
        }
        
    }
    
    
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherTableViewCell

        // Configure the cell...
        let row = dataList[indexPath.row]
        var d = Date()
        d.addTimeInterval(TimeInterval(60*60*24*row.day))
        
        let f = DateFormatter()
        f.dateFormat = "yyyy년 MM월 dd일"
        
        cell.labelDay.text = f.string(from: d)
        
        cell.labelHour.text = "\(row.hour)시"
        cell.labelTemp.text = "\(row.temp)도"
        cell.labelWfKor.text = row.wfKor

        return cell
    }
 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! WeatherDetailViewController
        
        let indexPath = self.tableView.indexPathForSelectedRow!
        let row = dataList[indexPath.row]
        
    }

}








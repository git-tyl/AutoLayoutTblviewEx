//
//  ViewController.swift
//  AutoLayoutTblviewEx
//
//  Created by Atmakury Harish on 5/7/18.
//  Copyright © 2018 Atmakury Harini. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private var customTblView :UITableView!
    private var titlelbl = UILabel()
    let fontName  = "AvenirNext-DemiBold"
    private var dictTblData =  [[String :[String]]]()
    //-----------------------------------------------------------

    override func viewDidLoad() {
        
        super.viewDidLoad()
        SetupView()     //view setup
        LayoutSubView() //auto layout
        
        //tableview data
        dictTblData = [["title":["Vegetarian"],"rows":["Butter","yogurt","milk"],"type":["Plant and Dairy"],"price":["$7","$9","$3"]],
            ["title":["Vegan"],"rows":["orange","Apple","Vegeatables"],"type":["Plant Based"],"price":["$20","$25","$34"]],
            ["title":["Non-Vegetarian"],"rows":["Chicken","Lamb","Pork"],"type":["Animal Based"],"price":["$500","$340","$303"]]]
        customTblView.reloadData()
    }
    //------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    //------------------------------------------------------------
    //MARK: CUSTOM FUNCTIONS
    //------------------------------------------------------------
    
    func SetupView()
    {
    //tableView
    customTblView = UITableView(frame: CGRect(x:0,y:150,width:100,height:100))
    customTblView.register(UINib(nibName: "viewControllerCell", bundle: nil), forCellReuseIdentifier: "customCell")
    customTblView.dataSource = self
    customTblView.delegate = self
    self.view.addSubview(customTblView)
    customTblView.separatorStyle = UITableViewCellSeparatorStyle.none //remove lines
    
    //Title Label
    self.view.addSubview(titlelbl)
    titlelbl.text = "TYPES OF FOOD"
    titlelbl.font = UIFont(name: fontName, size: 20.0)
    titlelbl.textAlignment = NSTextAlignment.center
    titlelbl.textColor =  UIColor.black
    }
    
    func LayoutSubView()
    {
    //tableview
    customTblView.translatesAutoresizingMaskIntoConstraints = false
        customTblView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true //top
    customTblView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true //bottom
        
    customTblView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true//width
    customTblView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true //height
        
   customTblView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true //leading
    customTblView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant: 0).isActive = true //trailing
        
    //Title Lable
    titlelbl.translatesAutoresizingMaskIntoConstraints = false
    titlelbl.topAnchor.constraint(equalTo: self.view.topAnchor, constant:80).isActive = true //top
    titlelbl.bottomAnchor.constraint(equalTo:customTblView.topAnchor, constant:0).isActive = true //bottom
        
    titlelbl.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true //width
    titlelbl.heightAnchor.constraint(equalToConstant:20).isActive = true //bottom
    
    titlelbl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true //trailing
    titlelbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true //leading
    }
    //------------------------------------------------------------
    //MARK: TABLEVIEW DATA SOURCE AND DELEGATE
    //------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard dictTblData[section]["rows"]?.count != nil else {
        return 0
        }
        return (dictTblData[section]["rows"]?.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? viewControllerCell
    guard (dictTblData[indexPath.section]["rows"]?[indexPath.row]) != nil || (dictTblData[indexPath.section]["price"]?[indexPath.row]) != nil || (dictTblData[indexPath.section]["type"]?[0]) != nil else {
    cell?.cellLabel1.text = "Label1"
    cell?.cellLabel2.text = "Label2"
    cell?.cellLabel3.text = "Label3"
    return cell!
     }
        
   cell?.cellLabel1.text = (dictTblData[indexPath.section]["rows"]?[indexPath.row])!;
   cell?.cellLabel2.text = (dictTblData[indexPath.section]["type"]![0])
   cell?.cellLabel3.text = (dictTblData[indexPath.section]["price"]?[indexPath.row])!;
   return cell!
   }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 40
    }
    //-----------------------------------------------------------
    //MARK: TABLEVIEW SECTION
    //------------------------------------------------------------
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
    return dictTblData.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
    return dictTblData.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55;
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        //headerview
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
            headerView.backgroundColor =  UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 1.0)
        
        //header label
        let headerlbl = UILabel()
        headerlbl.textColor = UIColor.white
        headerlbl.font = UIFont(name: fontName, size: 20.0)
        headerlbl.frame = CGRect(x: 0, y: 10, width: customTblView.bounds.size.width, height: 30)
        headerlbl.textAlignment = NSTextAlignment.center
        headerlbl.text = dictTblData[section]["title"]?[0]
        headerView.addSubview(headerlbl)
        
        //layout
        headerlbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerlbl.topAnchor.constraint(equalTo:headerView.topAnchor),
            headerlbl.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            headerlbl.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerlbl.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            ])
        return headerView
    }

    //-----------------------------------------------------------
}


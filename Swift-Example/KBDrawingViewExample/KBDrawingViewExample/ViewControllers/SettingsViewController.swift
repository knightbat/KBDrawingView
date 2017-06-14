//
//  SettingsViewController.swift
//  KBDrawingViewExample
//
//  Created by Bindu on 13/06/17.
//  Copyright © 2017 Xminds. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setLineColor(color:UIColor)
    func setLineWidth(width:NSNumber)
}
class SettingsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    @IBOutlet var listTableView: UITableView!
    @IBOutlet var popupView: UIView!
    var delegate :SettingsViewControllerDelegate!
    var isFromColor = Bool()
    var colorArray = NSMutableArray()
    var widthArray = NSMutableArray()
    var backGndColor = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        popupView.isHidden = true
        listTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        colorArray = [["color_name":"ERASE","color":self.backGndColor],
                      ["color_name":"RED","color":UIColor.red],
                      ["color_name":"BLUE","color":UIColor.blue],
                      ["color_name":"GREEN","color":UIColor.green],
                      ["color_name":"GRAY","color":UIColor.gray],
                      ["color_name":"BLACK","color":UIColor.black],
                      ["color_name":"BROWN","color":UIColor.brown],
                      ["color_name":"CYAN","color":UIColor.cyan],
                      ["color_name":"MAGENTA","color":UIColor.magenta],
                      ["color_name":"ORANGE","color":UIColor.orange],
                      ["color_name":"PURPLE","color":UIColor.purple],
                      ["color_name":"YELLOW","color":UIColor.yellow]]
        
        widthArray = ["1","2","3","4","5","6","7","8","9","10"]
        
       
    }
    // MARK: - TableView Delegates and Datasources
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (isFromColor) {
            return colorArray.count
        } else {
            return widthArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dict : [String:Any] = colorArray[indexPath.row] as! [String : Any]
        let cell : listTableViewCell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! listTableViewCell
        
        if isFromColor {
            cell.listLabel.text = dict["color_name"] as? String
        } else {
            cell.listLabel.text = widthArray[indexPath.row] as? String
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict : [String:Any] = colorArray[indexPath.row] as! [String : Any]
        if isFromColor {
            if indexPath.row == 0 {
                delegate.setLineWidth(width: 10)
            }
            print(dict["color"] as Any)
            delegate.setLineColor(color: dict["color"] as Any as! UIColor)
        } else {
            let width = Int(widthArray[indexPath.row] as! String)
            
            delegate.setLineWidth(width:NSNumber(value:width!))
        }
        popupView.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UIButton Actions
    
    @IBAction func closeBtnClicked(_ sender: UIButton) {
        
        popupView.isHidden = true
    }
    @IBAction func widthBtnClicked(_ sender: UIButton) {
        isFromColor = false
        popupView.isHidden = false
        listTableView.reloadData()
    }
    @IBAction func colorBtnClicked(_ sender: UIButton) {
        
        isFromColor = true
        popupView.isHidden = false
        listTableView.reloadData()
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

//
//  ViewVC.swift
//  T6SolutionDemo
//
//  Created by Niid tech on 01/08/18.
//  Copyright © 2018 T6SolutionDemo. All rights reserved.
//

import UIKit
import Alamofire


class ViewVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var registrationObj : [RegistrationObject] = []
    
    var dataArr:[String] = ["subMenu->1","subMenu->2","subMenu->3"]

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.callGetAPI()
//        self.requestWith(endUrl: "", parameters: [:], parameter: "")
        // Do any additional setup after loading the view.
        
        let registration1 = RegistrationObject.init(member_name: "hello", Event_Type: "", Event_Venue: "", Title: "", Description: "", Event_Date: "", Event_timing: "", Event_Schedule: "")
        self.registrationObj.append(registration1)
        
        let registration2 = RegistrationObject.init(member_name: "hiii", Event_Type: "", Event_Venue: "", Title: "", Description: "", Event_Date: "", Event_timing: "", Event_Schedule: "")
        self.registrationObj.append(registration2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.registrationObj.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let object : RegistrationObject = self.registrationObj[indexPath.row]
        cell.nameLabel.text = object.Title
        cell.venueLabel.text = object.Event_Venue
        cell.typeLabel.text = object.Event_Type
        cell.timeLabel.text = object.Event_timing
        if object.Title.isEmpty {
             cell.nameLabel.text = "-"
        }
        if object.Event_Venue.isEmpty {
            cell.venueLabel.text = "-"
        }
        if object.Event_Type.isEmpty {
            cell.typeLabel.text = "-"
        }
        if object.Event_timing.isEmpty {
            cell.timeLabel.text = "-"
        }
        if object.Event_Date.isEmpty {
            cell.dateLabel.text = "-"
            cell.monthLabel.text = "-"

        }
        cell.monthLabel.text = CommenMethods.dateToDateFormate(inputFormatterStr: "dd-MM-yyyy", outputFormatterStr: "MMM", dateStr:"15-10-1994" ) as String //object.Event_Date
        cell.dateLabel.text = CommenMethods.dateToDateFormate(inputFormatterStr: "dd-MM-yyyy", outputFormatterStr: "dd", dateStr: "15-10-1994") as String
        cell.dataArr = dataArr
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(188 + (dataArr.count * 47));//188 //450 for subtableview height
    }
     func requestWith(endUrl: String, parameters: [String : Any],parameter: String) {
        //        Society_logo
        
        
        DispatchQueue.main.async { // Correct
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            ViewControllerUtils.shared.showProgressView(appDelegate.window!)
        }
        let urlStr = "http://testmyportal.com/sms/webservices/event_report.php?Society_No=1276E-HB"
     
        Alamofire.request(urlStr)
            .responseString { response in
                DispatchQueue.main.async {
                    ViewControllerUtils.shared.hideProgressView()
                };
                // print response as string for debugging, testing, etc.
                print(response.result.value)
                print(response.result.error)
                if response.result.error == nil {
                    
                    if let result = response.result.value {
                        self.registrationObj = []
                        let data = result.data(using: .utf8)!
                        do {
                            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
                            {
                             print(jsonArray)
                                for object : [String : Any] in jsonArray{
                                    let registration = RegistrationObject.init(member_name: object["member_name"] as! String, Event_Type: object["Event_Type"] as! String, Event_Venue: object["Event_Venue"] as! String, Title: object["Title"] as! String, Description: object["Description"] as! String, Event_Date: object["Event_Date"] as! String, Event_timing: object["Event_timing"] as! String, Event_Schedule: object["Event_Schedule"] as! String)
                                    self.registrationObj.append(registration)
                                    
                                }
                                self.tableView.reloadData()
                                
                            } else {
                                print("bad json")
                            }
                        } catch let error as NSError {
                            print(error)
                        }
                    }
                    if let err = response.error{
                        
                        DispatchQueue.main.async {
                            ViewControllerUtils.shared.hideProgressView()
                        };
                        self.showAlertOKWithTitle(title: "Alert", message: "\(err)")
                        return
                    }
                    
                }else{
                    self .showAlertOKWithTitle(title: "", message: "Something Went wrong. Please try again later")

                }
        }


    }
    
    func showAlertOKWithTitle(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message as String?, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { action in
            self.dismiss(animated: true, completion: nil)
            
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
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

class CommenMethods: NSObject {
    
    class func dateToDateFormate(inputFormatterStr : String,outputFormatterStr : String ,dateStr : String) -> NSString {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date
        formatter.dateFormat = inputFormatterStr
        let dateTime = formatter.date(from: dateStr)
        
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = outputFormatterStr
        if dateTime == nil {
            return ""
        }
        let dateTimeStr2 = formatter.string(from: dateTime!)
        return dateTimeStr2 as NSString
        
    }
}

//
//  PopUpVC.swift
//  T6SolutionDemo
//
//  Created by Niid tech on 28/07/18.
//  Copyright © 2018 T6SolutionDemo. All rights reserved.
//

import UIKit

protocol PopUpDelegate: class {
    func selectedEventTypeOption(text : String)
    func selectedEventVenueOption(text : String)
    func selectedTimeOption(text : String)
    func selectedMemberOption(text : String)

}

class PopUpVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: PopUpDelegate?
    var isCameFrom: String = String()

    var typeArray : [String ] = []
    var venueArray : [String ] = []
    var timeArray : [String ] = []
    var memberArray : [String ] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        typeArray = ["Personal","Common"];
        venueArray = ["In Own House","Other"];
        timeArray = ["16:30","17:00","17:30","18:00","18:30","19:00","19:30","12:00"];
        memberArray = ["A-204","B-205","A-206","A-207","A-208","A-209"];
        // Do any additional setup after loading the view.
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isCameFrom == "Type"{
            return typeArray.count;
        }else if isCameFrom == "Venue"{
            return venueArray.count;

        }else if isCameFrom == "Time"{
            return timeArray.count;

        }else if isCameFrom == "Member"{
            return memberArray.count;

        }
        return 0;
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if isCameFrom == "Type"{
            cell.textLabel?.text =  typeArray[indexPath.row];
        }else if isCameFrom == "Venue"{
            cell.textLabel?.text =  venueArray[indexPath.row];
        }else if isCameFrom == "Time"{
            cell.textLabel?.text =  timeArray[indexPath.row];
        }else if isCameFrom == "Member"{
            cell.textLabel?.text =  memberArray[indexPath.row];
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        if isCameFrom == "Type"{
            delegate?.selectedEventTypeOption(text: typeArray[indexPath.row])
        }else if isCameFrom == "Venue"{
            delegate?.selectedEventVenueOption(text: venueArray[indexPath.row])
            
        }else if isCameFrom == "Time"{
            delegate?.selectedTimeOption(text: timeArray[indexPath.row])

        }else if isCameFrom == "Member"{
            delegate?.selectedMemberOption(text: memberArray[indexPath.row])
            
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)

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

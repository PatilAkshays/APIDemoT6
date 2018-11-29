//
//  DatePickerVC.swift
//  T6SolutionDemo
//
//  Created by Niid tech on 28/07/18.
//  Copyright © 2018 T6SolutionDemo. All rights reserved.
//

import UIKit
protocol DatePickerDelegate: class {
    func selectedDateTime(date : String)
}

class DatePickerVC: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    var isCameFrom: String = String()
    weak var delegate: DatePickerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = NSDate() as Date
        
        // Do any additional setup after loading the view.
    }

    @IBAction func pressCancelB(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressDoneB(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateStr = formatter.string(from: datePicker.date)
        delegate?.selectedDateTime(date: dateStr)


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

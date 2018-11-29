//
//  ViewController.swift
//  T6SolutionDemo
//
//  Created by Niid tech on 28/07/18.
//  Copyright © 2018 T6SolutionDemo. All rights reserved.
//

import UIKit
import Photos
import Alamofire
import JTMaterialTransition
import DatePickerDialog
import ActionSheetPicker_3_0




class ViewController: UIViewController,UITextFieldDelegate,PopUpDelegate,DatePickerDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var reminderTxtField: UITextField!
    @IBOutlet weak var decriptionTxtField: UITextField!
    @IBOutlet weak var imagePathLabel: UILabel!
    @IBOutlet weak var memberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventVenueLabel: UILabel!
    @IBOutlet weak var eventTypeLabel: UILabel!
    @IBOutlet weak var selectedImage: UIImageView!
    
    @IBOutlet weak var sendB: UIBarButtonItem!
    
    let imagePicker = UIImagePickerController()
    var eventTypeModel = EventTypeModel()
    var eventVenueModel = EventVenueModel()
    var eventTimeModel = EventTimeModel()
    var eventMemberModel = EventMemberModel()

    var observers : [NSKeyValueObservation] = []
    var transition: JTMaterialTransition?
    
    let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))

    
    @IBOutlet weak var eventTypeB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePicker.delegate = self
//        dateLabel.text = "Select Schedule";
//        eventTypeLabel.text = "Common";
//        eventVenueLabel.text = "Other";
//        eventTimeLabel.text = "19:00";
        titleTxtField.text = "Test123";
        reminderTxtField.text = "Reminder123";
        decriptionTxtField.text = "Description123";

        self.observers = bindModel()
        self.transition = JTMaterialTransition(animatedView: self.eventTypeB!)
        self.eventTypeLabel.text = "Select event type"
        self.eventVenueLabel.text = "Select event venue"
        self.eventTimeLabel.text = "Select event time";
        self.memberLabel.text = "Select Member";
    
//        sendB.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    
    private func bindModel() -> [NSKeyValueObservation] {
        return [
            self.eventTypeModel.observe(\.eventType, options: .initial) { (model, _) in
                self.eventTypeLabel.text = String(describing: model.eventType)
            },
            self.eventVenueModel.observe(\.eventVenue, options: .initial) { (model, _) in
                self.eventVenueLabel.text = String(describing: model.eventVenue)
                
            },
            self.eventTimeModel.observe(\.eventTime, options: .initial) { (model, _) in
                self.eventTimeLabel.text = String(describing: model.eventTime)
                
            },
            self.eventMemberModel.observe(\.eventMember, options: .initial) { (model, _) in
                self.memberLabel.text = String(describing: model.eventMember)
                
            }
        ]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //PopUpDelegate Delgate Methods
    func selectedEventTypeOption(text: String) {
        self.eventTypeLabel.text = text
    }
    
    func selectedEventVenueOption(text: String) {
        self.eventVenueLabel.text = text

    }
    
    func selectedTimeOption(text: String) {
        self.eventTimeLabel.text = text

    }
    func selectedMemberOption(text: String) {
        self.memberLabel.text = text

    }
    
    func selectedDateTime(date: String) {
        self.dateLabel.text = date
    }
    
    
    
//Actions
    
    @IBAction func pressSendButton(_ sender: Any) {
//        let parameter : String = "Society_Registration_No=1276E-HB&Flat_No=12&member_name=Tester&Event_Type=\(eventTypeLabel.text ?? "")&Event_Venue=\(eventVenueLabel.text ?? "")&Title=\(titleTxtField.text ?? "")&Description=\(decriptionTxtField.text ?? "")&Event_Date=\(dateLabel.text ?? "")&other_venue=&Event_Schedule=\(eventTimeLabel.text ?? "")&Event_timing=&Number_Of_Days=&Invitation_To=&Society_logo=/event_image/profileimage.png"
//
//        let urlString = String.init(format: "http://testmyportal.com/sms/webservices/event_registration.php?%@",parameter)
//        let imageData: Data = UIImagePNGRepresentation(self.selectedImage.image!)!
//        self.requestWith(endUrl: urlString, imageData: imageData, parameters: ["Society_logo":imageData], parameter: urlString)
       // /*
        self.view.endEditing(true)
        if eventTypeLabel.text != "" && eventTypeLabel.text != "Select Event Type" {
            if eventVenueLabel.text != "" && eventVenueLabel.text != "Select Event Venue" {
                if eventTimeLabel.text != "" && eventTimeLabel.text != "Select Event Time" {
                    if titleTxtField.text != "" {
                        if reminderTxtField.text != "" {
                            if decriptionTxtField.text != "" {
                                if dateLabel.text != ""  && dateLabel.text != "Select Schedule" {
                                    if memberLabel.text != ""  && memberLabel.text != "Select Member" {
                                        if imagePathLabel.text != "" && imagePathLabel.text != "Image Path/"  {
                                            let parameter : String = "Society_Registration_No=1276E-HB&Flat_No=12&member_name=Tester&Event_Type=\(eventTypeLabel.text ?? "")&Event_Venue=\(eventVenueLabel.text ?? "")&Title=\(titleTxtField.text ?? "")&Description=\(decriptionTxtField.text ?? "")&Event_Date=\(dateLabel.text ?? "")&other_venue=&Event_Schedule=\(eventTimeLabel.text ?? "")&Event_timing=&Number_Of_Days=&Invitation_To=&Society_logo=/event_image/profileimage.png"

                                            let urlString = String.init(format: "http://testmyportal.com/sms/webservices/event_registration.php?%@",parameter)
                                            
                                            let imageData: Data = UIImagePNGRepresentation(self.selectedImage.image!)!
                                            self.requestWith(endUrl: urlString, imageData: imageData, parameters: [:], parameter: urlString)
//                                            callGetAPI(parameter: parameter)
                                        }else{
                                            self .showAlertOKWithTitle(title: "", message: "Please choose image to upload.")
                                        }
                                    }else{
                                        self .showAlertOKWithTitle(title: "", message: "Please Enter all fields")
                                    }
                                }else{
                                    self .showAlertOKWithTitle(title: "", message: "Please Enter all fields")
                                }
                            }else{
                                self .showAlertOKWithTitle(title: "", message: "Please Enter all fields")
                            }
                        }else{
                            self .showAlertOKWithTitle(title: "", message: "Please Enter all fields")
                        }
                    }else{
                        self .showAlertOKWithTitle(title: "", message: "Please Enter all fields")
                        
                    }
                }else{
                    self .showAlertOKWithTitle(title: "", message: "Please Enter all fields")
                    
                }
            }else{
                self .showAlertOKWithTitle(title: "", message: "Please Enter all fields")
            }
            
        }else{
            self .showAlertOKWithTitle(title: "", message: "Please Enter all fields")
        }
 //*/
    }
    
   
    
   
    
    
    @IBAction func pressEventTypeB(_ sender: UIButton) {
//        self.popUpViewAppeerWith(Type: "Type")
        let controller = ArrayChoiceTableViewController(EventType.allValues) { (event) in
            self.eventTypeModel.eventType = event
        }
        controller.preferredContentSize = CGSize(width: 300, height: 88)//200
        controller.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        showPopup(controller, sourceView: sender)
        
    }
   
    @IBAction func pressVenueButton(_ sender: UIButton) {
//        self.popUpViewAppeerWith(Type: "Venue")
        let controller = ArrayChoiceTableViewController(EventVenue.allValues) { (event) in
            self.eventVenueModel.eventVenue = event
        }
        controller.preferredContentSize = CGSize(width: 300, height: 88)//200
        controller.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        showPopup(controller, sourceView: sender)
    }
    @IBAction func pressTimeButton(_ sender: UIButton) {
//        self.popUpViewAppeerWith(Type: "Time")
        let controller = ArrayChoiceTableViewController(EventTime.allValues) { (event) in
            self.eventTimeModel.eventTime = event
        }
        controller.preferredContentSize = CGSize(width: 300, height: 180)//200
        controller.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        showPopup(controller, sourceView: sender)
    }
    @IBAction func pressSelectMemberB(_ sender: UIButton) {
//        self.popUpViewAppeerWith(Type: "Member")
        let controller = ArrayChoiceTableViewController(EventMember.allValues) { (event) in
            self.eventMemberModel.eventMember = event
        }
        controller.preferredContentSize = CGSize(width: 300, height: 180)//200
        controller.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        showPopup(controller, sourceView: sender)
    }
   
    func popUpViewAppeerWith(Type : String){
        self.view.endEditing(true)

        let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        presentedViewController.providesPresentationContextTransitionStyle = true
        presentedViewController.definesPresentationContext = true
        presentedViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        presentedViewController.modalTransitionStyle = .crossDissolve
        presentedViewController.delegate = (self as! PopUpDelegate)
        presentedViewController.isCameFrom = Type
        self.present(presentedViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func pressSelectDateB(_ sender: UIButton) {
        self.view.endEditing(true)
        
        let datePicker = ActionSheetDatePicker(title: "Select Sechedule:", datePickerMode: UIDatePickerMode.date, selectedDate: Date(), target: self, action: #selector(self.datePicked(_:)), origin: sender.superview!.superview)
        datePicker?.minimumDate = NSDate() as Date
        datePicker?.show()
        
        
//        ActionSheetMultipleStringPicker.show(withTitle: "Multiple String Picker", rows: [
//            ["One", "Two", "A lot"],
//            ["Many", "Many more", "Infinite"]
//            ], initialSelection: [2, 2], doneBlock: {
//                picker, indexes, values in
//
//                return
//        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
        
        
//        self.datePickerTapped()
//        let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "DatePickerVC") as! DatePickerVC
//        presentedViewController.providesPresentationContextTransitionStyle = true
//        presentedViewController.definesPresentationContext = true
//        presentedViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
//        presentedViewController.delegate = (self as! DatePickerDelegate)
//        presentedViewController.isCameFrom = "Date"
//        self.present(presentedViewController, animated: true, completion: nil)
        
    }
    
    @objc func datePicked(_ obj: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        self.dateLabel.text = formatter.string(from: obj)
    }
    func datePickerTapped() {
        
        DatePickerDialog().datePicker.minimumDate = NSDate() as Date
        DatePickerDialog().show("Select Sechedule", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                self.dateLabel.text = formatter.string(from: dt)
            }
        }
    }
    
    
    private func showPopup(_ controller: UIViewController, sourceView: UIView) {
        self.view.endEditing(true)

        let presentationController = AlwaysPresentAsPopover.configurePresentation(forController: controller)
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceView.bounds
        presentationController.permittedArrowDirections = [.down, .up, .left, .right]
        presentationController.backgroundColor = UIColor.gray
        //        presentationController.viewWillTransition(to: sourceView.frame.size, with:UIViewControllerTransitionCoordinator)
        //        presentationController.willTransition(to: controller.traitCollection, with: UIViewControllerTransitionCoordinator)
        //        controller.modalTransitionStyle = .partialCurl
        self.present(controller, animated: true)
    }
    
    
    func showAlertOKWithTitle(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message as String?, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { action in
            self.dismiss(animated: true, completion: nil)
            
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func chooseImageB(_ sender: Any) {
        self.view.endEditing(true)
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == .authorized || status == .notDetermined) {
            self.imagePicker.sourceType = .savedPhotosAlbum;
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.selectedImage.image = pickedImage;

        } else {
            let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.selectedImage.image = pickedImage;
        }
        
        let imageURL = info[UIImagePickerControllerReferenceURL] as! NSURL
        let imageName = imageURL.path!.last
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as! String
        
       
////        let localPath = documentDirectory.stringByAppendingPathComponent(imageName)
        self.imagePathLabel.text = imageURL .absoluteString
        
        print(documentDirectory)
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func callGetAPI(parameter : String,imageName : String) {
        if (currentReachabilityStatus != .notReachable) {
            DispatchQueue.main.async { // Correct
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                ViewControllerUtils.shared.showProgressView(appDelegate.window!)
            }
            
             let parameter1 : String = "Society_Registration_No=1276E-HB&Flat_No=12&member_name=Tester&Event_Type=\(eventTypeLabel.text ?? "")&Event_Venue=\(eventVenueLabel.text ?? "")&Title=\(titleTxtField.text ?? "")&Description=\(decriptionTxtField.text ?? "")&Event_Date=\(dateLabel.text ?? "")&other_venue=&Event_Schedule=\(dateLabel.text ?? "")&Event_timing=\(eventTimeLabel.text ?? "")&Number_Of_Days=&Invitation_To=&Society_logo=/event_image/\(imageName)"
            print(imageName)
            
            let urlString = String.init(format: "http://testmyportal.com/sms/webservices/event_registration.php?%@",parameter1)
            ServerAPIRequest() .httpPostConnectionWithURL(urlString: urlString as NSString, parameter: [:], methodType: "GET", completion: { response,data ,statusCode  in
                print(response)
                DispatchQueue.main.async {
                    ViewControllerUtils.shared.hideProgressView()
                };
                
                DispatchQueue.main.async {
                    if statusCode == 200{
                        do {
                            var dictonary:NSDictionary?
                            dictonary = try JSONSerialization.jsonObject(with: data as Data, options: []) as? [String:AnyObject] as NSDictionary?
                            
                            if let myDictionary = dictonary
                            {
                                
                                print(myDictionary)
                                   self .showAlertOKWithTitle(title: "Success", message: "Data Stored Successfully.")
                               
                                
                            }
                        } catch let error as NSError {
                            DispatchQueue.main.async {
                                ViewControllerUtils.shared.hideProgressView()
                            };
                            print(error)
                            
                        }
                        
                    }else{
                        self .showAlertOKWithTitle(title: "", message: "Something Went wrong. Please try again later")
                    }
                    
                }
                
            })
            
        }else{
            self.showAlertOKWithTitle(title: "", message: "You are not connected to the internet.")
        }
        
    }
    
    
    
    func requestWith(endUrl: String, imageData: Data?, parameters: [String : Any],parameter: String) {
        DispatchQueue.main.async { // Correct
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            ViewControllerUtils.shared.showProgressView(appDelegate.window!)
        }
        let urlStr = "http://testmyportal.com/sms/webservices/event_registration.php?Society_Registration_No=1276E-HB"
        let now = NSDate()
        let nowTimeStamp : String =  self.getCurrentTimeStampWOMiliseconds(dateToConvert: now)//"Society_logo5"//
        print(nowTimeStamp)

        let headers: HTTPHeaders = [
            "Content-type": "multipart/form-data"
        ]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            if let data = imageData{
                multipartFormData.append(data, withName: "Society_logo", fileName: "\(nowTimeStamp).png", mimeType: "image/png")
            }
            
        }, usingThreshold: UInt64.init(), to: urlStr, method: .post, headers: headers) { (result) in
            
            switch result{
                
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                        DispatchQueue.main.async {
                            ViewControllerUtils.shared.hideProgressView()
                        };
//                        self.callGetAPI(parameter: parameter, imageName: "\(nowTimeStamp).png")

                        let dict : [String: Any] = JSON as! [String : Any]
                        if  dict.count > 0 {
                           
                        }
                        
                    }
                    if let err = response.error{
                        
                        DispatchQueue.main.async {
                            ViewControllerUtils.shared.hideProgressView()
                        };
                        self.showAlertOKWithTitle(title: "Alert", message: "\(err)")
                        return
                    }
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    ViewControllerUtils.shared.hideProgressView()
                };
                print("Error in upload: \(error.localizedDescription)")
                
                self.showAlertOKWithTitle(title: "Alert", message: "\(error)")
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view .endEditing(true)
    }
    
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(Float((textField.superview?.frame.origin.y)!))
        addDoneButtonOnKeyboard(txtView: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(0.0)
    }
    
    
    
    
    func animateViewMoving (_ yValue: Float){
        
        UIView.animate(withDuration: 0.5, animations: {
            self.scrollView.contentOffset.y = CGFloat(yValue)
        })
    }
    
    func addDoneButtonOnKeyboard(txtView: UITextField) {
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        txtView.inputAccessoryView = doneToolbar
        
        
    }
    @objc func doneButtonAction() {
        
        self.view.endEditing(true)
    }
    
    //event_report.php?Society_No=1276E-HB
    func getCurrentTimeStampWOMiliseconds(dateToConvert: NSDate) -> String {
        let objDateformat: DateFormatter = DateFormatter()
        objDateformat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let strTime: String = objDateformat.string(from: dateToConvert as Date)
        let objUTCDate: NSDate = objDateformat.date(from: strTime)! as NSDate
        let milliseconds: Int64 = Int64(objUTCDate.timeIntervalSince1970)
        let strTimeStamp: String = "\(milliseconds)"
        return strTimeStamp
    }

}
extension UIViewController{
    func showViewAnimation(controller : UIViewController,animate:Bool) -> Void {
        if animate {
            controller.view.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: ({
                controller.view.transform = CGAffineTransform.identity
            }), completion: nil)
        }
    }
    
}

extension String {
    func stringByAddingPercentEncodingForRFC3986() -> String? {
        let unreserved = "-._~/?"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        return self.addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
    }
}

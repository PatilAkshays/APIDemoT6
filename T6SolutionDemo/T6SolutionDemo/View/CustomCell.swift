//
//  CustomCell.swift
//  T6SolutionDemo
//
//  Created by Niid tech on 01/08/18.
//  Copyright © 2018 T6SolutionDemo. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var dataArr:[String] = []

    func setUpTable(){
//        subMenuTable = UITableView(frame: .zero, style:UITableViewStyle.plain)
        tableView?.delegate = self
        tableView?.dataSource = self
//        self.addSubview(subMenuTable!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        subMenuTable?.frame = CGRect.init(x: 0.2, y: 0.3, width: self.bounds.size.width-5, height: self.bounds.size.height-5)//0.2, 0.3, self.bounds.size.width-5, self.bounds.size.height-5
    }
    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = dataArr[indexPath.row]
        
        return cell!
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension;//188
//    }
}


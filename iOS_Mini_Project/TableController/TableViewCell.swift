//
//  TableViewCell.swift
//  iOS_Mini_Project
//
//  Created by PVH_002 on 20/9/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postDesc: UILabel!
    @IBOutlet weak var profile: UILabel!
    @IBOutlet weak var postAt: UILabel!
    
//    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

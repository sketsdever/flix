//
//  movieCell.swift
//  flix
//
//  Created by Shea Ketsdever on 6/15/16.
//  Copyright © 2016 Shea Ketsdever. All rights reserved.
//

import UIKit

class movieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.selectionStyle = .None
        

        // Configure the view for the selected state
    }

}

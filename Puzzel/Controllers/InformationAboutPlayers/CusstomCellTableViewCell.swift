//
//  CusstomCellTableViewCell.swift
//  Puzzel
//
//  Created by Андрей on 08.01.2021.
//

import UIKit

class CusstomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var numberOutlet: UILabel!
    @IBOutlet weak var namePlayer: UILabel!
    @IBOutlet weak var timerOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

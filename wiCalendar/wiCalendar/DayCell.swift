//
//  DayCell.swift
//  wiCalendar
//
//  Created by 위대연 on 2020/01/30.
//  Copyright © 2020 위대연. All rights reserved.
//

import UIKit

class DayCell: UICollectionViewCell {
    static let cell_id = "cell_id_day"
    
    @IBOutlet weak var dayLabel: UILabel!
    
    override func prepareForReuse() {
        self.dayLabel.text = ""
    }
}

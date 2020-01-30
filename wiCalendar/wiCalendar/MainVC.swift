//
//  ViewController.swift
//  wiCalendar
//
//  Created by 위대연 on 2020/01/30.
//  Copyright © 2020 위대연. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var calView:UIView!
    
    var calVc:WiCalendar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calendarViewSet()
    }

    func calendarViewSet() {
        calVc = self.storyboard?.instantiateViewController(withIdentifier: WiCalendar.sb_id) as? WiCalendar
        guard calVc != nil else { return }
        self.addChild(calVc!)
        calVc!.view.frame = calView.bounds
        calView.addSubview(calVc!.view)
        calVc?.didMove(toParent: self) 
    }
}


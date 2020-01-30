//
//  WiCalendar.swift
//  wiCalendar
//
//  Created by 위대연 on 2020/01/30.
//  Copyright © 2020 위대연. All rights reserved.
//

import UIKit

class WiCalendar: UIViewController {
    struct CalendarCellValue {
        var index:Int
        var date:Date?
    }
    static let sb_id = "sb_id_cal"
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "DayCell", bundle: nil), forCellWithReuseIdentifier: DayCell.cell_id)
        }
    }
    @IBOutlet weak var calcTtitleLabel: UILabel!
    @IBOutlet weak var nextMonthButton: UIButton!
    @IBOutlet weak var previosButton: UIButton!
    
    var colDatas = [CalendarCellValue]() {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    var calendar = Calendar(identifier: .iso8601)
    var currentYear = 2019
    var currentMonth = 1 {
        didSet{
            let monthText:String
            if currentMonth < 10 {
                monthText = "0\(currentMonth)"
            } else {
                monthText = "\(currentMonth)"
            }
            calcTtitleLabel.text = "\(currentYear) - \(monthText)"
            colDatas = calcDays(startYear: currentYear, startMonth: currentMonth, startDay: 1)
        }
    }
    
    var comp:DateComponents?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.timeZone = TimeZone(abbreviation: "UTC")!
        todaySet()
    }
    
    func todaySet(){
        let today = Date()
        let month = Calendar.current.component(.month, from: today)
        let year = Calendar.current.component(.year, from: today)
        self.currentYear = year
        self.currentMonth = month
    }
    
    func calcDays(startYear y:Int, startMonth m:Int, startDay d:Int) -> [CalendarCellValue] {
        var result = [CalendarCellValue]()
        self.comp = DateComponents(calendar: calendar, year: y, month: m, day: d)
        if comp != nil, comp!.date != nil {
            let startWeek = Calendar.current.component(.weekday, from: comp!.date!)
            var index = startWeek - 1
            if index != 0 {
                for i in 0 ..< index {
                    result.append(CalendarCellValue(index: i, date: nil))
                }
            }
            
            let month = Calendar.current.component(.month, from: comp!.date!)
            guard month == currentMonth else {
                print("ERROR 날짜 변환 오류")
                return result
            }
            result.append(CalendarCellValue(index: index, date: comp!.date!))
            
            while(true){
                let date = calendar.date(byAdding: DateComponents(day:1), to: comp!.date!)
                let month = Calendar.current.component(.month, from: date!)
                if month != currentMonth {
                    break
                } else {
                    comp = DateComponents(calendar:calendar, year: currentYear, month:currentMonth, day: comp!.day! + 1)
                    index += 1
                    result.append(CalendarCellValue(index: index, date: date!))
                }
            }//while
        }//if comp
        return result
    }
    
    @IBAction func preivosButtonAction(_ sender: UIButton) {
        if currentMonth == 1 {
            if (currentYear - 1) < 2018 { return }
            else {
                currentYear -= 1
                currentMonth = 12
            }
        } else if currentMonth > 1{
            currentMonth -= 1
        }
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if currentMonth == 12 {
            currentYear += 1
            currentMonth = 1
        } else {
            currentMonth += 1
        }
    }

}

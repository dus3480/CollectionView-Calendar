//
//  WiCalendarExtesion.swift
//  wiCalendar
//
//  Created by 위대연 on 2020/01/30.
//  Copyright © 2020 위대연. All rights reserved.
//

import UIKit
extension WiCalendar: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.cell_id, for: indexPath) as! DayCell
        let item = colDatas[indexPath.item]
        if item.date == nil {
            cell.dayLabel.text = ""
        } else {
            let toDay = Calendar.current.component(.day, from: Date())
            let day = Calendar.current.component(.day, from: item.date!)
            let weekday = Calendar.current.component(.weekday, from: item.date!)
            var text = "\(day)"
            if text.count == 1 {
                text = " " + text
            }
            let textColor:UIColor
            if weekday == 1 {
                textColor = .red
            } else if weekday == 7 {
                textColor = .blue
            } else {
                textColor = .black
            }
            if toDay == day {
                cell.dayLabel.backgroundColor = UIColor.init(hex: 0xEC7063, alpha: 1)
            } else {
                cell.dayLabel.backgroundColor = UIColor.white
            }
            cell.dayLabel.textColor = textColor
            cell.dayLabel.text = text
            
        }
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let w = (collectionView.bounds.width/7 - 2)
        return CGSize(width: w, height: w)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = colDatas[indexPath.item]
        print("select - \(String(describing: item.date))")
    }
}

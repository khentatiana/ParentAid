//
//  CalendarViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/17/20.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate {

    @IBOutlet weak var calendar: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self

            }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
       // print("selected")
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        let dateConvertedToString = formatter.string(from: date)
        print("\(dateConvertedToString)")
        
    }


}

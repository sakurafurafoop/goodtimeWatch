//
//  ViewController.swift
//  SakuraWatch
//
//  Created by SAKU on 2018/05/19.
//  Copyright © 2018年 SAKU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var timeImage:UIImageView!//画像を表示するUIImageView
    let formatterTime = DateFormatter()//時間を表示する形を決めるクラス
    @IBOutlet var timeLabel:UILabel!//時刻を表示するUILabel
    let formatterDate = DateFormatter()//日付を表示する形を決めるクラス
    @IBOutlet var dateLabel:UILabel!//日付を表示するUILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1秒ごとにtime()メソッドを呼ぶタイマー
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.time), userInfo: nil, repeats: true)
    }
    
    //時間と背景を更新するためのメソッド
    @objc func time() {
        let now = NSDate()//日付と時間を管理するクラス
        let calendar = NSCalendar.current//時刻だけを取り出すクラス
        formatterTime.timeStyle = .short//styleを使って表示する
        let timeString = formatterTime.string(from: now as Date)//現在の時刻を代入
        timeLabel.text = timeString//timeLabelにtimeStringを表示する
        
        formatterDate.dateStyle = .short//styleを使って表示する
        let dateString = formatterDate.string(from: now as Date)//現在の日付を代入
        dateLabel.text = dateString//timeLabelにtimeStringを表示する
        
        let hour = calendar.component(.hour, from: now as Date)//カレンダーの時間だけを取り出す
        //時間によって背景画像が変わる
        if (hour >= 6 && hour < 11) {
            timeImage.image = #imageLiteral(resourceName: "SakuraWatch_moning.png")
        }else if (hour >= 11 && hour < 17){
            timeImage.image = #imageLiteral(resourceName: "SakuraWatch_afternoon.png")
        }else if (hour >= 17 && hour < 21){
            timeImage.image = #imageLiteral(resourceName: "SakuraWatch_evning.png")
        }else{
            timeImage.image = #imageLiteral(resourceName: "SakuraWatch_night.png")
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


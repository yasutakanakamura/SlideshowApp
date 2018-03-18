//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中村 泰貴 on 2018/02/26.
//  Copyright © 2018年 yasutaka.nakamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Image View をボタンに出来ない
    //@IBOutlet weak var images: UIImageView!
    
    //遷移先から戻るボタンを押した時に呼ばれる
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    // ButtonにImageを表示する
    @IBOutlet weak var images: UIButton!
    
    //イメージ名の配列
    var imageLists = [
    "Abstract.jpg",
    "Abstract_Shapes.jpg",
    "Antelope_Canyon.jpg",
    "Bahamas_Aerial.jpg",
    "Beach.jpg",
    "Blue_Pond.jpg",
    "Bristle_Grass.jpg",
    "Brushes.jpg",
    "Circles.jpg",
    "Color_Burst_1.jpg",
    "Color_Burst_2.jpg",
    "Color_Burst_3.jpg",
    "Death_Valley.jpg",
    "Desert.jpg"
    ]

    //画像の初期化
    var counter = 0
    lazy var imageName:UIImage = UIImage(named : imageLists[counter])!
    //再生 or 一時停止を判定するBool値の初期化
    var boolValue = true
    //タイマー
    var timer : Timer!
    
    //Timerのインターバル時間ごとにカウンターに応じたイメージを表示するメソッド
    @objc func ShowImageAsCounter(timer :Timer) {
        //配列の長さの取得
        let countArray = imageLists.count
        //カウンターが最後尾の場合はカウンターを初期化して画像を表示、それ以外の場合はカウンターを1多くしての画像を表示。
        if counter == countArray - 1 {
            //カウンターを0に戻す
            counter = 0
            print(counter)
            //カウンターに応じた画像の取得
            imageName = UIImage(named : imageLists[counter])!
            //画像を表示
            images.setImage(UIImage(named:imageLists[counter]), for: .normal) //Buttonをイメージした時にイメージを変える方法
        }
        else {
            //カウンターを1進める
            counter += 1
            print(counter)
            //カウンターに応じた画像の取得
            imageName = UIImage(named : imageLists[counter])!
            //画像を表示
            images.setImage(UIImage(named:imageLists[counter]), for: .normal) //Buttonをイメージした時にイメージを変える方法
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        images.setImage(UIImage(named:imageLists[0]), for: .normal) //Buttonをイメージした時にイメージを変える方法
        print(imageLists[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        //配列の長さの取得
        let countArray = imageLists.count

        //カウンターが0の時配列の最後尾へ、それ以外はカウンターを1少なくして画像を表示
        if counter == 0 && boolValue == true {
            //カウンターを配列の最後尾へ
            counter = countArray - 1
            print(counter)
            //カウンターに応じた画像の取得
            //imageName = UIImage(named : imageLists[counter])!
            //画像を表示
            //images.image = imageName //Image View をボタンに出来ないため不採用
            images.setImage(UIImage(named:imageLists[counter]), for: .normal) //Buttonをイメージした時にイメージを変える方法
        }
        else if counter > 0 && boolValue == true {
            //カウンターを1少なくする
            counter -= 1
            //カウンターに応じた画像の取得
            imageName = UIImage(named : imageLists[counter])!
            //画像を表示
            images.setImage(UIImage(named:imageLists[counter]), for: .normal)
        }
    }
    @IBAction func play_stop(_ sender: Any) {

        if boolValue == true {
            //Bool値にFalseを代入
            boolValue = false
            //2秒毎に画像をスライド
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ShowImageAsCounter), userInfo: nil, repeats: true)
            
        }
        else {
            //Bool値にTrueを代入
            boolValue = true
            //画像のスライドをストップ
            self.timer.invalidate();
        }
        
    }
    @IBAction func forward(_ sender: Any) {
        //配列の長さの取得
        let countArray = imageLists.count

        //カウンターが配列の最後尾の場合はカウンターを1多くしての画像を表示、それ以外はカウンターを初期化して画像を表示
        if counter == countArray - 1 && boolValue == true {
            //カウンターを0に戻す
            counter = 0
            //カウンターに応じた画像の取得
            imageName = UIImage(named : imageLists[counter])!
            //画像を表示
            images.setImage(UIImage(named:imageLists[counter]), for: .normal)
        }
        else if counter <= countArray && boolValue == true {
            //カウンターを1進める
            counter += 1
            //カウンターに応じた画像の取得
            imageName = UIImage(named : imageLists[counter])!
            //画像を表示
            images.setImage(UIImage(named:imageLists[counter]), for: .normal)
        }
    }
    
    //遷移先へ現在の画像情報を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のResultViewControllerを取得する
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        //現在表示されている画像
        var cutrrentImage: UIImage = UIImage(named : imageLists[counter])!
        print(counter)
        print("DEBUG_PRINT:" + imageLists[counter])
        resultViewController.currentImage = cutrrentImage
    }
}


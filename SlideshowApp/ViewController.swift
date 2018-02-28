//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中村 泰貴 on 2018/02/26.
//  Copyright © 2018年 yasutaka.nakamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var images: UIImageView!
    
    //イメージ名の配列
    var imageLists = [
    "Abstract Shapes.jpg",
    "Abstract.jpg",
    "Antelope Canyon.jpg",
    "Bahamas Aerial.jpg",
    "Beach.jpg",
    "Blue Pond.jpg",
    "Bristle Grass.jpg",
    "Brushes.jpg",
    "Circles.jpg",
    "Color Burst 1.jpg",
    "Color Burst 2.jpg",
    "Color Burst 3.jpg",
    "Death Valley.jpg",
    "Desert.jpg"
    ]

    //画像の初期化
    var counter = 0
    lazy var imageName:UIImage = UIImage(named : imageLists[counter])!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        images.image = UIImage(named : imageLists[counter])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func back(_ sender: Any) {
        //配列の長さの取得
        let countArray = imageLists.count

        //カウンターが0の時配列の最後尾へ、それ以外はカウンターを1少なくして画像を表示
        if counter == 0 {
            //カウンターを配列の最後尾へ
            counter = countArray - 1
            print(counter)
            //カウンターに応じた画像の取得
            imageName = UIImage(named : imageLists[counter])!
            //画像を表示
            images.image = imageName
        }
        else {
            //カウンターを1少なくする
            counter -= 1
            //カウンターに応じた画像の取得
            imageName = UIImage(named : imageLists[counter])!
            //画像を表示
            images.image = imageName
        }
    }
    @IBAction func play_stop(_ sender: Any) {
    }
    @IBAction func forward(_ sender: Any) {
        //配列の長さの取得
        let countArray = imageLists.count

        //カウンターが配列の最後尾の場合はカウンターを1多くしての画像を表示、それ以外はカウンターを初期化して画像を表示
        if counter == countArray - 1 {
            //カウンターを0に戻す
            counter = 0
            //カウンターに応じた画像の取得
            imageName = UIImage(named : imageLists[counter])!
            //画像を表示
            images.image = imageName
        }
        else {
            //カウンターを1進める
            counter += 1
            //カウンターに応じた画像の取得
            imageName = UIImage(named : imageLists[counter])!
            //画像を表示
            images.image = imageName
        }
        
        
    }
    
}


//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 中村 泰貴 on 2018/03/03.
//  Copyright © 2018年 yasutaka.nakamura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var expandedImage: UIImageView!
    
    var currentImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //遷移元のイメージを拡大表示
        
        expandedImage.image = currentImage
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

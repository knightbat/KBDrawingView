//
//  RenderViewController.swift
//  KBDrawingViewExample
//
//  Created by Bindu on 13/06/17.
//  Copyright © 2017 Xminds. All rights reserved.
//

import UIKit
class RenderViewController: UIViewController {
   
    var rendredImage = UIImage ()

    @IBOutlet var showImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showImage.image = rendredImage;

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

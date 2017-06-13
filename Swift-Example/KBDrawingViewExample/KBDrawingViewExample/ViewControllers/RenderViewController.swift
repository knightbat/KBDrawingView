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
  // MARK: - UIButton actions
    
    @IBAction func saveBtnClicked(_ sender: UIBarButtonItem) {
        
        UIImageWriteToSavedPhotosAlbum(showImage.image!, self,#selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Add image to Library
    func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            }))
            present(ac, animated: true)
        }
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

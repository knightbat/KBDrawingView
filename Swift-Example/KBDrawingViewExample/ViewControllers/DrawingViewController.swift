//
//  DrawingViewController.swift
//  KBDrawingViewExample
//
//  Created by Bindu on 13/06/17.
//  Copyright © 2017 Xminds. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController,SettingsViewControllerDelegate,KBDrawingViewDelegate {
    @IBOutlet var renderButton: XMButton!
    
    @IBOutlet var drawingView: KBDrawingView!
    var rendredImage = UIImage ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.tintColor = UIColor.black
        setRenderButtonDisabled()
        self.drawingView.delegate = self
        self.drawingView.minimumDrawLength = NSNumber(floatLiteral: 10.10)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - SettingsViewControllerDelegates
    func setLineColor(color: UIColor) {
        self.drawingView.lineColor = color
        
    }
    
    func setLineWidth(width: NSNumber) {
        self.drawingView.lineWidth = width
        
    }
    // MARK: - IBActios
    
    @IBAction func renderButtonPressed(_ sender: UIButton) {
        rendredImage = self.drawingView.renderImage()
        self.performSegue(withIdentifier: "show", sender: self)
    }
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        self.drawingView.clear()
        setRenderButtonDisabled()
        self.drawingView.lineColor = UIColor.black
        self.drawingView.lineWidth = 1
    }
    // MARK: - KBDrawingViewDelegate
    func finishedDrawingMinimumLength() {
        setRenderButtonEnabled()
        
    }
    
    // MARK: - Other Methods
    
    func setRenderButtonEnabled() {
        renderButton.isEnabled = true
        renderButton.isHidden = false
    }
    
    func setRenderButtonDisabled() {
        
        renderButton.isEnabled = false
        renderButton.isHidden = true
        
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "show" {
            let vc :RenderViewController = segue.destination as! RenderViewController
            vc.rendredImage = rendredImage
        } else if segue.identifier == "settings" {
            let vc :SettingsViewController = segue.destination as! SettingsViewController
            vc.backGndColor = self.view.backgroundColor!
            vc.delegate = self
        }
    }
    
    
    
}

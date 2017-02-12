//
//  ViewController.swift
//  ImageRiddle

import UIKit

class ViewController: UIViewController {

    var targetView: TargetView?
    
    @IBOutlet weak var riddleImageView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageView = self.riddleImageView{
            imageView.image = #imageLiteral(resourceName: "Seasame-St-Characters.png")
            
            let targetViewFrame = CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height)
            self.targetView = TargetView(frame: targetViewFrame)
            
            if let targetView = self.targetView {
                imageView.addSubview(targetView)
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  SecondViewController.swift
//  VMG Demo
//
//  Created by Tim Wachter on 13/10/2017.
//  Copyright © 2017 Video Media Group. All rights reserved.
//

import UIKit
import VMGSDK

class SecondViewController: UIViewController, UIScrollViewDelegate, VMGAdViewDelegate {

    var adView: VMGAdView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var adViewContainer: UIView!
    @IBOutlet weak var adViewContainerHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.delegate = self
        
        adView = VMGAdView(withPlacementId: 6370, placeHolderView:adViewContainer, heightConstraint:adViewContainerHeightConstraint, delegate:self)
        adView.autoPlay = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        adView.viewDidAppear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        adView.viewDidDisappear()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        adView.containerDidScroll(withScrollview: scrollView)
    }

}


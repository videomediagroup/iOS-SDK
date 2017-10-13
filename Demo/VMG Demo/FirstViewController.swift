//
//  FirstViewController.swift
//  VMG Demo
//
//  Created by Tim Wachter on 13/10/2017.
//  Copyright © 2017 Video Media Group. All rights reserved.
//

import UIKit
import VMGSDK

class FirstViewController: UIViewController, VMGAdViewDelegate {

    var adView: VMGAdView!
    @IBOutlet weak var adViewContainer: UIView!
    @IBOutlet weak var adViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize our VMGAdView instance and add it as a subview
        adView = VMGAdView(withPlacementId: 6370, placeHolderView: adViewContainer, heightConstraint: adViewHeightConstraint, delegate: self)
        
        loadingIndicator.hidesWhenStopped = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Communicate view controller events to the VMGAdView
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        adView.viewDidAppear()
        loadingIndicator.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        adView.viewDidDisappear()
        loadingIndicator.startAnimating()
    }
    
    // VMGAdViewDelegate function
    func adViewWillOpen(adView: VMGAdView) {
        loadingIndicator.stopAnimating()
    }

    @IBAction func refreshAction(_ sender: Any) {
        loadingIndicator.startAnimating()
        adView.close()
        
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.adView.loadAd()
        }
    }
}


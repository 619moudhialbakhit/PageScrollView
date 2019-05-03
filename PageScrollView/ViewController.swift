//
//  ViewController.swift
//  PageScrollView
//
//  Created by Michael Miles on 5/2/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pages : [View] {
        get {
            let page1: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page1.view.backgroundColor = UIColor.blue
            page1.colorLabel.text = "Blue"
            
            let page2: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page2.view.backgroundColor = UIColor.green
            page2.colorLabel.text = "Green"
            
            let page3: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page3.view.backgroundColor = UIColor.gray
            page3.colorLabel.text = "Gray"
            
            let page4: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page4.view.backgroundColor = UIColor.yellow
            page4.colorLabel.text = "Yellow"
            
            let page5: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page5.view.backgroundColor = UIColor.purple
            page5.colorLabel.text = "Purple"
            
            return [page1, page2, page3, page4, page5]
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bringSubviewToFront(pageControl)
        
        setupScrollView(pages: pages)
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
    }

    func setupScrollView(pages: [View]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< pages.count {
            pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(pages[i])
        }
    }

}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

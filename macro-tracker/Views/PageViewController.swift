//
//  PageViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-08.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    internal var pages = [UIViewController]()
    
    init(pages: [UIViewController]) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pages = pages
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        view.backgroundColor = .white
    
        setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = pages.firstIndex(of: viewController) {
            if viewControllerIndex == 0 { return nil }
            return pages[viewControllerIndex - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = pages.firstIndex(of: viewController) {
            if viewControllerIndex == pages.count - 1 { return nil }
            return pages[viewControllerIndex + 1]
        }
        return nil
    }
    
    
}

extension PageViewController: UIPageViewControllerDelegate { }

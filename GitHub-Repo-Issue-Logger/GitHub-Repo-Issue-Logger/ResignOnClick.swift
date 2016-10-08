//
//  ResignOnClick.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/8/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import Foundation
import UIKit

protocol ResginOnClick {
    func resignOnClick(viewController: UIViewController)
}

extension ResginOnClick{
    func resignOnClick(viewController: UIViewController){
        let tapSelector = #selector(viewController.resignFirstResponder)
        let tapGesture = UITapGestureRecognizer(target: viewController, action:tapSelector)
        viewController.view.addGestureRecognizer(tapGesture)
    }
}
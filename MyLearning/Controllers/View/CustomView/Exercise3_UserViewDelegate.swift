//
//  Exercise3_UserViewDelegate.swift
//  MyLearning
//
//  Created by Hien Nguyen on 4/13/18.
//  Copyright © 2018 Quang Dang N.K. All rights reserved.
//
import UIKit
import Foundation
protocol Exercise3_UserViewDelegate {

    func view(_ view: Exercise2_DemoUserView, needsPerformAction action: Exercise2_DemoUserView.Action)
}

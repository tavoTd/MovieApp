//
//  HomeProtocol.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject{
    func notifyOptionSelected(option: Int)
    func notifyGetCategoriesList() -> [CategoryOption]
    func notifyGetParentView() -> UIViewController
    func notifyGetPagerView() -> UIPageViewController
}

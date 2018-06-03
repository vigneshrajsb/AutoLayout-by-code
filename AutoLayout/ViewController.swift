//
//  ViewController.swift
//  AutoLayout
//
//  Created by Vigneshraj Sekar Babu on 5/31/18.
//  Copyright © 2018 Vigneshraj Sekar Babu. All rights reserved.
//

import UIKit


extension UIColor {
    static var myPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    static var lightPink = UIColor(red: 249/255, green: 207/255, blue: 244/255, alpha: 1)
}

class ViewController: UIViewController {
    
    let topContainer : UIView = {
       let container = UIView()
       // container.backgroundColor = UIColor.blue
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let image : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        image.contentMode = .scaleAspectFit
                //this enables autolayout for our imageview
        image.translatesAutoresizingMaskIntoConstraints = false
        return image }()
    
    let heading : UITextView = {
        let heading =  UITextView()
        var attributedText = NSMutableAttributedString()
        attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16.0)])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see your in our stores soon.", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12.0)]))
        heading.attributedText = attributedText
        heading.textAlignment = .center
        heading.isEditable = false
        heading.isScrollEnabled = false
        //this enables autolayout for our textView
        heading.translatesAutoresizingMaskIntoConstraints = false
        return heading
    }()
    
    let previousButton  : UIButton = {
        let button = UIButton(type: .system)
      //    button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14.0)
        button.setTitleColor(UIColor.gray, for: .normal)
      //  button.backgroundColor = UIColor.green
        return button
    }()
    
    let nextButton : UIButton = {
        let button = UIButton(type: .system)
       // button.translatesAutoresizingMaskIntoConstraints = false
       // button.backgroundColor = UIColor.blue
        button.titleLabel?.font = .boldSystemFont(ofSize: 14.0)
             button.setTitle("NEXT", for: .normal)
        button.setTitleColor(UIColor.myPink, for: .normal)
        
        return button
    }()
    
    
    let pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .myPink
        pc.pageIndicatorTintColor = .lightPink
      //  pc.backgroundColor = UIColor.yellow
        return pc
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topContainer)
        topContainer.addSubview(image)
        view.addSubview(heading)
        setupLayout()
        bottomScreenLayout()
    }
    
    func setupLayout(){
        
    topContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        topContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
    //for the image
    image.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive = true
    image.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true
    image.heightAnchor.constraint(equalToConstant: 150).isActive = true
    image.widthAnchor.constraint(equalToConstant: 150).isActive = true
    
    //for the text View
    heading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    heading.topAnchor.constraint(equalTo: topContainer.bottomAnchor).isActive = true
    heading.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
    heading.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
    heading.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
    }

    func bottomScreenLayout() {
        let bottomControlsStack : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
            //stackView.backgroundColor = UIColor.blue
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.distribution = .fillEqually
            return stackView
        }()

        view.addSubview(bottomControlsStack)
        
        NSLayoutConstraint.activate([bottomControlsStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), bottomControlsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), bottomControlsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), bottomControlsStack.heightAnchor.constraint(equalToConstant: 60
            )])
        
        
    }
 

}


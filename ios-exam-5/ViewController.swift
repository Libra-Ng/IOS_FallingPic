//
//  ViewController.swift
//  ios-exam-5
//
//  Created by liushangwei on 2019/11/18.
//  Copyright © 2019 zhouhaijian. All rights reserved.
//

import UIKit


class Shape:UIView{
    
    override func draw(_ rect: CGRect) {
        
        
        
        let path = UIBezierPath(arcCenter: CGPoint(x: 207,y: 207), radius: 207, startAngle: CGFloat(Double.pi), endAngle: CGFloat(Double.pi)*2, clockwise: true)
        
        UIColor.green.setFill()
        
        path.close()
        path.fill()
    }
}

class Tra:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 414))
        path.addLine(to: CGPoint(x: 414, y: 414))
        path.addLine(to: CGPoint(x: 207, y: 0))
        
        path.close()
        
        UIColor.red.setFill()
        path.fill()
        
    }
}

class ViewController: UIViewController {
    var nh:CGFloat = 0
    var viewHeight:CGFloat = 0
    var viewWidth:CGFloat = 0
    var scrollView:UIScrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewHeight = view.bounds.height
        viewWidth = view.bounds.width
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 414, height: 800)) // Frame属性
        
        scrollView.contentSize = CGSize(width: 414, height: 800*9) // ContentSize属性
        
        scrollView.backgroundColor = UIColor.clear
        
       view.addSubview(scrollView)
        
    }

    @IBAction func addY(_ sender: Any) {
        
       
        
        let xj = self.nh
        
        let s = Shape(frame: CGRect(x: 0, y: xj, width: viewWidth, height:viewWidth/2))
        
        s.backgroundColor = UIColor.clear
        
        scrollView.insertSubview(s, at: 0)
        
        
        if nh > 800 {
            scrollView.scrollRectToVisible(CGRect(x: 0, y: nh-800, width: 414, height: 800), animated: true)
        }
        
        nh += 207
    }
    
    @IBAction func addS(_ sender: Any) {
        

        
        let xj = self.nh
        
        
        let t = Tra(frame: CGRect(x: 0, y: xj, width: viewWidth, height: viewWidth))
            
        t.backgroundColor = UIColor.clear
            
        scrollView.addSubview(t)
        
        if nh > 800 {
                  scrollView.scrollRectToVisible(CGRect(x: 0, y: nh-800, width: 414, height: 800), animated: true)
      }
              
        
        
         nh += viewWidth
        
    }
    @IBAction func clear(_ sender: Any) {
        
        for item in scrollView.subviews {
            
          
            if item is Shape{
                
                item.removeFromSuperview()
            }
            else if item is Tra{
                item.removeFromSuperview()
            }
            
            nh = 0
            
            scrollView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 414, height: 800), animated: true)
                      
            
        }
    }
}


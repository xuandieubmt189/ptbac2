//
//  ViewController.swift
//  GiaiPT_Bac2
//
//  Created by xuandieu on 4/9/17.
//  Copyright © 2017 xuandieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var tf_a: UITextField!
    @IBOutlet weak var tf_b: UITextField!
    @IBOutlet weak var tf_c: UITextField!

    @IBOutlet weak var lb_tb: UILabel!
    @IBOutlet weak var lb_kq: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lb_tb.isHidden = true
        lb_kq.isHidden = true
        
        tf_a.delegate = self
        tf_b.delegate = self
        tf_c.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bt_Giai(_ sender: Any) {
        lb_tb.text = ""
        lb_tb.isHidden = false
        lb_kq.isHidden = false
        
        if(tf_a.text! == "" || tf_b.text! == "" || tf_c.text! == ""){
            lb_tb.text = "Bạn phải nhập đủ 3 hệ số a, b và c !!"
            lb_kq.text = ""
        }else {
            
            let a:Double = Double(tf_a.text!)!
            let b:Double = Double(tf_b.text!)!
            let c:Double = Double(tf_c.text!)!
            
            if(a == 0){
                if(b == 0){
                    if(c == 0){
                        lb_tb.text = "Phương trình có nghiệm tuỳ ý !"
                        lb_kq.text = ""
                    }else{
                        lb_tb.text = "Phương trình vô nghiệm !"
                        lb_kq.text = ""
                    }
                }else{
                    if(c == 0){
                        lb_tb.text = "Phương trình có 1 nghiệm"
                        lb_kq.text = "x = 0"
                    }else{
                        lb_tb.text = "Phương trình có 1 nghiệm"
                        lb_kq.text = "x = " + String(-c/b)
                    }
                }
            }else
            {
                let d = (b*b) - (4*a*c)
                if(d<0){
                    lb_tb.text = "Phương trình vô nghiệm !"
                    lb_kq.text = ""
                }else if(d == 0){
                    lb_tb.text = "Phương trình có 1 nghiệm !"
                    lb_kq.text = "x = " + String(-b/(2*a))
                }else{
                    let x1 = (-b+sqrt(d))/(2*a)
                    let x2 = (-b-sqrt(d))/(2*a)
                    
                    lb_tb.text = "Phương trình có 2 nghiệm"
                    lb_kq.text = "x1 = " + String(x1) + "; x2 = " + String(x2)
                }
            }
        }
    }
    // ham chi cho phep nhap so
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        
        let components = string.components(separatedBy: inverseSet)
        
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                } else{
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            } else {
                if string == "-" {
                    if (textField.text!.isEmpty == true) {
                        return true
                    }
                    else {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
    }
}


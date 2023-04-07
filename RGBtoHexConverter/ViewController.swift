//
//  ViewController.swift
//  RGBtoHexConverter
//
//  Created by Salih Yusuf Göktaş on 7.04.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var txtRed: UITextField!
	@IBOutlet weak var txtGreen: UITextField!
	@IBOutlet weak var txtBlue: UITextField!
	@IBOutlet weak var lblResult: UILabel!
	@IBOutlet weak var btnConvert: UIButton!
	@IBOutlet weak var lblSelectedColor: UILabel!
	var secilenIndex : Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func segmentChanged(_ sender: Any) {
		
		secilenIndex = (sender as AnyObject).selectedSegmentIndex
		lblResult.text?.removeAll()
		txtRed.text?.removeAll()
		txtGreen.text?.removeAll()
		txtBlue.text?.removeAll()
		lblSelectedColor.backgroundColor = UIColor.white
		
		if secilenIndex == 0 {
			
			btnConvert.setTitle("RGB - HEX Convert", for: UIControl.State.normal)
		}else{
			btnConvert.setTitle("HEX - RGB Convert", for: UIControl.State.normal)
		}
		
	}
	
	@IBAction func btnConvertClicked(_ sender: Any) {
		
		if secilenIndex == 0 {
			// RGB'den HEX'e çevirme
			convertRGBtoHEX()
		}else{
			//HEX'den RGB'ye çevirme
			convertHEXtoRGB()
		}
	}
	
	func convertRGBtoHEX(){
		
		// if let karmaşıklığından kurtulmak için guard let yapısını kullanabiliriz
		
		// guard let redValue = UInt8(txtRed.text!) else {return}
		// guard let greenValue = UInt8 (txtGreen.text!) else {return}
		// guard let blueValue = UInt8(txtBlue.text!) else {return}
		
		
		if let redValue = UInt8(txtRed.text!) {           //UInt8 kullanmamızın sebebi 0 ile 256 arasındaki değerleri kapsıyor olması
			if let greenValue = UInt8(txtGreen.text!) {
				if let blueValue = UInt8(txtBlue.text!) {
					//kullanıcı buraya kadar gelirse değerleri düzgün bir şekilde girmiştir
					
					let redHex = String(format: "%2X", redValue)
					let greenHex = String(format: "%2X", greenValue)
					let blueHex = String(format: "%2X", blueValue)
					
					lblResult.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
					lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
				}
			}
		}
	}
	
	func convertHEXtoRGB(){
		if let redValue = UInt8(txtRed.text!, radix: 16) {
			if let greenValue = UInt8(txtGreen.text!, radix: 16) {
				if let blueValue = UInt8(txtBlue.text!, radix: 16) {
					
					lblResult.text = "RED : \(redValue) \n GREEN : \(greenValue) \n BLUE : \(blueValue)"
					lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
				}
			}
		}
	}
}


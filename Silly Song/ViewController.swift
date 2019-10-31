//
//  ViewController.swift
//  Silly Song
//
//  Created by Mehrdad on 8/15/18.
//  Copyright © 2018 Mehrdad. All rights reserved.
//
import Foundation
import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"
].joined(separator: "\n")


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


class ViewController: UIViewController {

    
    // MARK: Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
    
    @IBAction func reset(_ sender: Any) {
        self.textField.text = ""
        self.textView.text = ""
    }
    
    
    @IBAction func displayLyrics(_ sender: Any) {
        self.textView.text = lyricsForTemplate(lyricsTemplate: bananaFanaTemplate, fullName: textField.text ?? "")
    }
    
}


// MARK: Functions

func shortNameFromName(name: String) -> String {
    let lowerName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    let index = lowerName.rangeOfCharacter(from: vowelSet)!.lowerBound
    return String(lowerName[index...])
}

func lyricsForTemplate(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    var lyrics = lyricsTemplate.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    lyrics = lyrics.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    return lyrics
}

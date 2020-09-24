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


class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
    }
    
    
    // MARK: Actions
    
    @IBAction func reset(_ sender: Any) {
        self.nameField.text = ""
        self.lyricsView.text = ""
    }
    
    
    @IBAction func displayLyrics(_ sender: Any) {
        if let name = nameField.text {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name)
        }
        
    }
    
    
    // MARK: Helper Methods
    
    func shortNameFromName(name: String) -> String {
        let lowerName = name.lowercased()
        let vowelSet = CharacterSet(charactersIn: "aeiou")
        let index = lowerName.rangeOfCharacter(from: vowelSet)!.lowerBound
        return String(lowerName[index...])
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        let shortName = shortNameFromName(name: fullName)
        var lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        lyrics = lyrics.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        return lyrics
    }
    
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

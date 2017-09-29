//
//  DisplayMood.swift
//  Mood Tracker Mobile 1 Challenge
//
//  Created by Matthew Harrilal on 9/27/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import Foundation
import UIKit


class DisplayMood: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var mood: User?
    
    
    @IBOutlet weak var moodEmojiLabel: UILabel!
    let moodEmojis = ["Mad Face Grrr😡","Are you serious dude? 😑", "You're awesome!😁"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return moodEmojis[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moodEmojis.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        moodEmojiLabel.text = moodEmojis[row]
    }
    
    
    @IBOutlet weak var moodPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodPickerView.delegate = self
        moodPickerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        if let mood1 = mood {
            moodEmojiLabel.text = mood1.mood
        }
        else {
            moodEmojiLabel.text = "Choose your friend's mood"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let listFriendsMood = segue.destination as! FriendsTableViewController
        if let identifier = segue.identifier {
            if identifier == "save" {
                if let mood = mood {
                print("Save button has been tapped")
                //mood.name = moodEmojiLabel.text ?? "Sorry this friend does not have a name"
                mood.mood = moodEmojiLabel.text ?? "Sorry this friend does not have a mood"
                listFriendsMood.tableView.reloadData()
                 // listFriendsMood.user.append(mood)
                } else {
                    let newMood = User()
                    newMood.mood = moodEmojiLabel.text ?? "Sorry this person does not have a mood"
                    print("The user is saving a new note")
                  listFriendsMood.user.append(newMood)
                }
            }
        }
    }
}

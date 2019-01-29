//
//  FanView.swift
//  iGlance
//
//  Created by Dominik on 27.10.18.
//  Copyright © 2018 iGlance Corp. All rights reserved.
//

import Cocoa

class FanView: NSViewController {
    // define the outlet and the action to enable and disable the fan speed icon
    @IBOutlet var cbFanSpeed: NSButton! {
        didSet {
            cbFanSpeed.state = AppDelegate.UserSettings.userWantsFanSpeed ? NSButton.StateValue.on : NSButton.StateValue.off
        }
    }

    @IBOutlet var cbUnitFanSpeed: NSButton! {
        didSet {
            cbUnitFanSpeed.state = AppDelegate.UserSettings.userWantsUnitFanSpeed ? NSButton.StateValue.on : NSButton.StateValue.off
        }
    }

    @IBAction func cbFanSpeed_clicked(_: NSButton) {
        let checked = (cbFanSpeed.state == NSButton.StateValue.on)
        AppDelegate.UserSettings.userWantsFanSpeed = checked
        FanComponent.sItemFanSpeed.isVisible = checked
        UserDefaults.standard.set(checked, forKey: "userWantsFanSpeed")
        checked ? MyStatusItems.insertItem(item: MyStatusItems.StatusItems.fanSpeed) : MyStatusItems.removeItem(item: MyStatusItems.StatusItems.fanSpeed)
    }

    @IBAction func cbUnitFanSpeed_clicked(_: NSButton) {
        let checked = (cbUnitFanSpeed.state == NSButton.StateValue.on)
        AppDelegate.UserSettings.userWantsUnitFanSpeed = checked
        UserDefaults.standard.set(checked, forKey: "userWantsUnitFanSpeed")
    }
}

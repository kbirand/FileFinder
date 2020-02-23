//
//  ViewController.swift
//  enum
//
//  Created by Koray Birand on 12.06.2019.
//  Copyright © 2019 Koray Birand. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var myTextView: NSTextView!
    
    @IBOutlet weak var copyButton: NSButton!
    var myURL : URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        copyButton.isEnabled = false
        copyButton.title = "Select Folder to Proceed"
        myTextView.lnv_setUpLineNumberView()
       
        

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func lookFolder(_ sender: NSButton) {
        
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = false
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = false
        openPanel.title = "Select Folder"
        
        openPanel.beginSheetModal(for:self.view.window!) { (response) in
            if response.rawValue == NSApplication.ModalResponse.OK.rawValue {
                
                self.myURL = openPanel.url
                
                // do whatever you what with the file path
            }
            self.copyButton.isEnabled = true
            self.copyButton.title = "Copy"
            openPanel.close()
        }
    }
    

    @IBAction func copyTo(_ sender: NSButton) {
        
        let linecount = self.myTextView.textStorage?.string.components(separatedBy: "\n")
        print(linecount?.count as Any)
        
        for items in linecount! {
            print(items)
        }
        
        var myFiles : [URL] = []
        
        let aaa = FileManager.default.enumerator(atPath: myURL.path)
        
        while let element = aaa?.nextObject() as? String {
            if element.hasSuffix(".jpg") { // checks the extension
                myFiles.append(myURL.appendingPathComponent(element))
                
            }
        }
        
        print(myFiles.count)
        myFiles.removeAll()
    }
    
}


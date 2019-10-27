//
//  ContentView.swift
//  rusty-ios
//
//  Created by Roberto Huertas Muyo on 27/10/2019.
//  Copyright © 2019 robertohuertas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let s = getName()
    var body: some View {
        Text(s)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getName() -> String {
    let result = hello("Rob")
    let sr =  String(cString: result!)
    // IMPORTANT: once we get the result we have to release the pointer.
    hello_release(UnsafeMutablePointer(mutating: result))
    return sr
}

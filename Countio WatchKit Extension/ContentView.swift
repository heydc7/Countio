//
//  ContentView.swift
//  Countio WatchKit Extension
//
//  Created by Dhanraj Sudhir Chavan on 25/04/20.
//  Copyright © 2020 Dhanraj Chavan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDecrementOn = false
    
    @State private var currentCount = UserDefaults.standard.integer(forKey: "currentCount")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                HStack(alignment: .center, spacing: 20) {
                    Button(action: {
                        self.isDecrementOn.toggle()
                    }) {
                        Image(systemName: self.isDecrementOn ? "minus" : "plus")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    Button(action: {
                        self.currentCount = 0
                        UserDefaults.standard.set(0, forKey: "currentCount")
                    }) {
                        Image(systemName: "trash")
                            .font(.headline)
                            .foregroundColor(.red)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                
                Button(action: {
                    self.performMaths(isSubtract: self.isDecrementOn, number: 1)
                }) {
                    Text("\(currentCount)")
                        .font(.title)
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, number: 1)
                        }) {
                            Text(self.isDecrementOn ? "-1" : "+1")
                                .font(.headline)
                        }
                        
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, number: 2)
                        }) {
                            Text(self.isDecrementOn ? "-2" : "+2")
                                .font(.headline)
                        }
                        
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, number: 3)
                        }) {
                            Text(self.isDecrementOn ? "-3" : "+3")
                                .font(.headline)
                        }
                        
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, number: 4)
                        }) {
                            Text(self.isDecrementOn ? "-4" : "+4")
                                .font(.headline)
                        }
                        
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, number: 5)
                        }) {
                            Text(self.isDecrementOn ? "-5" : "+5")
                                .font(.headline)
                        }
                        
                        Button(action: {
                            self.performMaths(isSubtract: self.isDecrementOn, number: 10)
                        }) {
                            Text(self.isDecrementOn ? "-10" : "+10")
                                .font(.headline)
                                .frame(width: 50)
                        }
                    }
                }
            }.padding(.all)
        }
    }
    
    func performMaths(isSubtract : Bool, number : Int) {
        var result = self.currentCount
        if isSubtract == true {
            result -= number
        } else {
            result += number
            
        }
        if result >= 0 {
            currentCount = result
            UserDefaults.standard.set(currentCount, forKey: "currentCount")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

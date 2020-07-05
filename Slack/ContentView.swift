//
//  ContentView.swift
//  Slack
//
//  Created by Jordan Singer on 7/5/20.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Set<Int> = [0]
    
    var body: some View {
        NavigationView {
            List(selection: self.$selection) {
                Label("All unreads", systemImage: "line.horizontal.3")
                Label("Threads", systemImage: "text.bubble")
                Label("Mentions", systemImage: "at")
                
                Divider()
                
                Label("general", systemImage: "number")
                .tag(0)
                Label("random", systemImage: "number")
                Label("team", systemImage: "number")
                Label("updates", systemImage: "number")
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 100, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
            
            Home()
        }
    }
}

struct Home: View {
    var body: some View {
        Channel()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("#general")
        .navigationSubtitle("Company-wide announcements and work-based matters")
        .background(Color.white)
        .toolbar {
            
            ToolbarItem(placement: .status) {
                Button(action: {}) {
                    Image(systemName: "info.circle")
                }
            }
            
        }
    }
}

struct Channel: View {
    @State var messages = [
        "Here’s to the crazy ones",
        "the misfits, the rebels, the troublemakers",
        "the round pegs in the square holes…",
        "the ones who see things differently — they’re not fond of rules…",
        "You can quote them, disagree with them, glorify or vilify them",
        "but the only thing you can’t do is ignore them because they change things…",
        "they push the human race forward",
        "and while some may see them as the crazy ones",
        "we see genius",
        "because the ones who are crazy enough to think that they can change the world",
        "are the ones who do."
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(messages, id: \.self) { message in
                        Message(text: message)
                    }
                }
                .padding()
            }
            
            MessageBar()
        }
    }
}

struct Message: View {
    @State var text: String
    var names = [
        "Jordan Singer",
        "Leo Gill",
        "June Cha",
        "Britney Cooper",
        "Andrew Kumar"
    ]
    var colors = [
        Color.red,
        Color.orange,
        Color.yellow,
        Color.green,
        Color.blue,
        Color.purple
    ]
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.crop.square.fill")
                .foregroundColor(colors.randomElement())
                .opacity(0.4)
                .font(.system(size: 40))
            
            VStack(alignment: .leading, spacing: 2) {
                HStack(alignment: .firstTextBaseline) {
                    Text(names.randomElement()!)
                        .font(.headline)
                    
                    Text("9:41 AM")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
                
                Text(text)
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

struct MessageBar: View {
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Message #general")
                
                HStack(spacing: 16) {
                    Group {
                        Image(systemName: "bold")
                        Image(systemName: "italic")
                        Image(systemName: "underline")
                        Image(systemName: "strikethrough")
                        Image(systemName: "list.bullet")
                    }
                    
                    Spacer()
                    
                    Group {
                        Image(systemName: "face.smiling")
                        Image(systemName: "paperclip")
                        Image(systemName: "at")
                    }
                }
                .font(.title2)
            }
            .padding()
            
        }
        .foregroundColor(.secondary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

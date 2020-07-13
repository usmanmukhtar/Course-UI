//
//  ContentView.swift
//  CourseUI
//
//  Created by Usman Mukhtar on 12/07/2020.
//

import SwiftUI

struct ContentView : View {
    
    var row = Array(repeating: GridItem(.fixed(220), spacing: 20), count: 1)
    
    var body: some View {
        
        ZStack(alignment: Alignment.top) {
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("profile"))
                        .overlay(Image("user").resizable())
                    
                    Text("John Doe")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                    }
                }
                
                HStack {
                    Text("Your Course")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.top, 50)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: row, spacing: 14){
                        ForEach(cData){course in
                            VStack(alignment: .leading, spacing: 15) {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(Color(course.iconColor))
                                    .overlay(Image(course.icon).resizable().frame(width:30, height: 30))
                                    .frame(width: 40, height: 40)
                                
                                Text(course.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                HStack(spacing: 10){
                                    Image(systemName: "stopwatch")
                                        .foregroundColor(Color(course.iconColor))
                                    
                                    Text(course.date)
                                        .foregroundColor(.white)
                                }
                                ZStack{
                                    Image("profile-pic")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(8)
                                    
                                    Image("profile-pic")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(8)
                                        .offset(x:15)
                                    
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(.white)
                                        .overlay(Text("+9").foregroundColor(Color(course.cardColor)))
                                        .frame(width: 40, height: 40)
                                        .offset(x:30)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 20)
                            .frame(width: 160)
                            .background(Color(course.cardColor))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    }
                }
                
                HStack {
                    Text("Popular Course")
                        .fontWeight(.bold)
                        .font(.title3)
                    
                    Spacer()
                }
                .padding(.top, 20)
                
                //you can make this a paging carousel, i will link the tutorial in the description
                Image("pager")
                    .resizable()
                    .cornerRadius(20)
                    .frame(height: ((UIScreen.main.bounds.width - 60) * 9) / 16)
            }
            .padding(.top, 50)
            .padding(.horizontal, 30)
            
            DragView {
                VStack(alignment: .leading){
                    Text("Scedule")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                    
                    HStack {
                        Text("We have 5 course today")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 5)
                    .padding(.horizontal, 30)
                    
                    ScrollView {
                        LazyVStack (alignment: .leading, spacing: 30){
                            ForEach(lData) { list in
                                VStack(alignment: .leading, spacing: 10){
                                    HStack(spacing: 15){
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color(list.iconColor))
                                            .overlay(Image(list.icon).resizable().frame(width:30, height: 30))
                                            .frame(width: 50, height: 50)
                                        
                                        VStack (alignment: .leading, spacing: 10){
                                            Text(list.name)
                                                .font(.title3)
                                                .foregroundColor(.white)
                                            
                                            Text(list.timing)
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.horizontal, 30)
                                    
                                    Divider()
                                        .background(Color.white.opacity(0.7))
                                        .padding(.top, 10)
                                }
                            }
                        }
                    }.padding(.top, 20)
                    Spacer()
                }
                .padding(.vertical, 30)
            }
        }
        .edgesIgnoringSafeArea(.vertical)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Course: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
    var date: String
    var iconColor: String
    var cardColor: String
    
}

struct CList : Identifiable {
    var id = UUID()
    var name: String
    var timing: String
    var icon: String
    var iconColor: String
}

var cData = [

    Course(title: "UI/UX Design", icon: "vector", date: "10:00 am", iconColor: "green-icon", cardColor: "green-light"),
    Course(title: "UI/UX Design", icon: "code", date: "10:00 am", iconColor: "pink-icon", cardColor: "pink-light"),
    Course(title: "UI/UX Design", icon: "vector", date: "10:00 am", iconColor: "green-icon", cardColor: "green-light"),
    Course(title: "UI/UX Design", icon: "code", date: "10:00 am", iconColor: "pink-icon", cardColor: "pink-light"),
    Course(title: "UI/UX Design", icon: "vector", date: "10:00 am", iconColor: "green-icon", cardColor: "green-light"),
    Course(title: "UI/UX Design", icon: "code", date: "10:00 am", iconColor: "pink-icon", cardColor: "pink-light"),
]

var lData = [

    CList(name: "Lecture 1", timing: "26 july 2020 . 10:00 am", icon: "vector", iconColor: "green-icon"),
    CList(name: "Lecture 2", timing: "26 july 2020 . 10:00 am", icon: "code", iconColor: "pink-icon"),
    CList(name: "Lecture 3", timing: "26 july 2020 . 10:00 am", icon: "vector", iconColor: "green-icon"),
    CList(name: "Lecture 4", timing: "26 july 2020 . 10:00 am", icon: "code", iconColor: "pink-icon"),
    CList(name: "Lecture 5", timing: "26 july 2020 . 10:00 am", icon: "vector", iconColor: "green-icon"),
    CList(name: "Lecture 6", timing: "26 july 2020 . 10:00 am", icon: "code", iconColor: "pink-icon"),
]

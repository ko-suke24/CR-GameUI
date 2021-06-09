//
//  ContentView.swift
//  CR GameUI
//
//  Created by 佐藤航輔 on 2021/06/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                .navigationBarTitle("",displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    var body: some View {
        VStack {
            HStack {
                Text("Your Player")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                
                Button(action: {
                    
                }){
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundColor(.white)
                }
                            }
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.vertical,showsIndicators: false){
                VStack(spacing: 10){
                    ForEach(data){i in
                        Card(data: i)
                    }
                }
                .padding(.bottom)
            }
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.bottom)
    }
}

class Host: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}
struct Card : View{
    var data : Player
    var body: some View {
        HStack {
            Image(self.data.image)
            .resizable()
            .frame(width : UIScreen.main.bounds.width / 1.8)
            Spacer()
            
            VStack(spacing: 20){
                
                Spacer(minLength: 0)
                
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            ZStack {
                                self.data.color
                                Circle()
                                    .stroke(Color.black.opacity(0.1),lineWidth: 5)
                                Circle()
                                    .trim(from: 0, to: self.data.powers[0])
                                    .stroke(Color.white,lineWidth: 5)
                                
                            })
                .clipShape(Circle())
                
                Image(systemName: "suit.heart.fill")
                                       .foregroundColor(.white)
                                       .padding()
                                       .background(
                                           ZStack {
                                               self.data.color
                                               Circle()
                                                   .stroke(Color.black.opacity(0.1),lineWidth: 5)
                                               Circle()
                                                    .trim(from: 0, to: self.data.powers[1])
                                                   .stroke(Color.white,lineWidth: 5)
                                            
                                               
                                           }.rotationEffect(.init(degrees: -90))
                )
                               .clipShape(Circle())
                
                Image(systemName: "hammer.fill")
                                       .foregroundColor(.white)
                                       .padding()
                                       .background(
                                           ZStack {
                                               self.data.color
                                               Circle()
                                                   .stroke(Color.black.opacity(0.1),lineWidth: 5)
                                               Circle()
                                                .trim(from: 0, to: self.data.powers[2])
                                                .stroke(Color.white,lineWidth: 5)
                                               
                                           })
                               .clipShape(Circle())
                Spacer(minLength: 0)
                NavigationLink(destination: Detail(data: self.data)){
                    Text("Lihat Detail")
                                           .font(.caption)
                                           .foregroundColor(.white)
                                           .padding(.vertical,10)
                                           .padding(.horizontal,25)
                                           .background(Capsule().stroke(Color.white,lineWidth: 2))
                                           
                }.offset(y:-35)
                
            }
            .padding(.trailing)
            
        }
        .frame(height:250)
    .background(
        Color.white.opacity(0.2)
        .cornerRadius(25)
        
            .rotation3DEffect(.init(degrees: 20), axis: (x:0,y:-1,z:0))
        )
            .padding(.horizontal)
            .padding(.vertical,35)
            .padding(.trailing,25)
    }
}

// Detail View
struct Detail : View {
    var data: Player
//    buat po guys
    @Environment(\.presentationMode) var present
    var body: some View{
        VStack{
            ZStack {
                HStack {
                    Button(action: {
//                            di pop disini
                        self.present.wrappedValue.dismiss()
                    }){
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                    Button(action: {
                        
                    }){
                        Image(systemName: "circle.grid.2x2.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                Text("Overview")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        .padding()
            Image(self.data.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 30, height:UIScreen.main.bounds.height / 2)
                .background(Color.white.opacity(0.2))
                .cornerRadius(30)
            
            Text(self.data.name)
                .fontWeight(.bold)
                .font(.system(size: 55))
                .foregroundColor(.white)
                .padding(.top)
            
            Text("Super smash bros ultimate cillagers from the animal crossing series.This troops fight most effictively in large group.")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.top)
            
            HStack(spacing: 20){
                Button(action: {
                    
                }){
                    Text("Add Favourite")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width:(UIScreen.main.bounds.width / 2) - 30)
                        .background(Capsule().stroke(Color.white, lineWidth: 2))
                }
                
                Button(action: {
                    
                }){
                    Text("Main Sekarang")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width:(UIScreen.main.bounds.width / 2) - 30)
                        .background(Color("Color-4"))
                        .clipShape(Capsule())
                }
            }
            .padding(.top,30)
            
            Spacer()
        }.background(LinearGradient(gradient: .init(colors: [Color("Color-4"),Color("Color-1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
            .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

// sample data...

struct Player : Identifiable {
    
    var id : Int
    var powers : [CGFloat]
    var image : String
    var name : String
    var color : Color
}

var data = [

    Player(id: 0, powers: [0.2,0.5,0.9], image: "Player1", name: "Bomb Raider", color: Color("Color")),
    Player(id: 2, powers: [0.3,0.5,0.6], image: "Player2", name: "Pekka", color: Color("Color-1")),
    Player(id: 1, powers: [0.5,0.4,0.8], image: "Player3", name: "Barberian",color: Color("Color-2")),

]

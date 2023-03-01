//
//  NavigaciyaDetskayaOdejda.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//
//Навигация детская одежда

import SwiftUI

struct NavigaciyaDetskayaOdejda: View {
    
    @State private var showsDetailViewController: Bool = false
    @State private var showsDetailViewController1: Bool = false
    @State private var showsDetailViewController2: Bool = false
    @State private var showsDetailViewController3: Bool = false
    @State private var showsDetailViewController4: Bool = false
    @State private var showsDetailViewController5: Bool = false
    @State private var showsDetailViewController6: Bool = false
    
    private let imag = images.randomElement()
   
   struct BunnerButton: ButtonStyle {
       let img: Image
      
       func makeBody(configuration: Configuration) -> some View {
           configuration.label
           img
           .renderingMode(.original)
           .frame(width: 300, height: 38)
       }
       
   }
    
    var body: some View {
        
        ZStack {
            
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
            
            VStack {
                
                Button("") {
                    UIApplication.shared.open(URL(string: imag!["url"]!)!)
                }
                .buttonStyle(BunnerButton(img: Image(imag!["image"]!)))
                .background(.yellow)
                
                HStack {
                    Button("Главное меню") {
                        showsDetailViewController.toggle()
                    }
                    .foregroundColor(.blue)
                    .padding(.leading, 10.0)
                    .sheet(isPresented: $showsDetailViewController) {
                        NavigationMain()
                }
                    
                    Spacer()
                    
                }
                 
                Spacer()
                
                
                    Text("Соответствие размеров детской одежды")
                    .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.green)
                    
                    
                
                VStack {
                    
                    Button("СООТВЕТСТВИЕ РАЗМЕРОВ ОДЕЖДЫ ДЛЯ ДЕТЕЙ ОТ РОЖДЕНИЯ ДО 7 ЛЕТ") {
                        showsDetailViewController1.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController1) {
                        DetskayaOdejdaDoSemiLet()
                    }
                    
                    Spacer()
                    
                    Button("СООТВЕТСТВИЕ РАЗМЕРОВ ОДЕЖДЫ ДЛЯ МАЛЬЧИКОВ ОТ 8 ДО 18 ЛЕТ") {
                        showsDetailViewController2.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController2) {
                        OdejdaMalchikiDoVosemnadcatiLet()
                    }
                    
                    Spacer()
                    
                    Button("СООТВЕТСТВИЕ РАЗМЕРОВ ОДЕЖДЫ ДЛЯ ДЕВОЧЕК ОТ 8 ДО 18 ЛЕТ") {
                        showsDetailViewController3.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController3) {
                        OdejdaDevochkiDoVosemnadcatiLet()
                    }
                    
                    Spacer()
                    
                    Button("ДЕТСКАЯ ОБУВЬ (ОТ 0 ДО 1 ГОДА)") {
                        showsDetailViewController4.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController4) {
                        DetskayaObuvDoOdnogoGoda()
                    }
                    
                    Spacer()
                    
                    Button("ДЕТСКАЯ ОБУВЬ (ОТ 1 ДО 6 ЛЕТ)") {
                        showsDetailViewController5.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController5) {
                        DetskayaObuvOtOdnogoGodaDoShestiLet()
                    }
                    
                    Spacer()
                    
                    
                }
                
                VStack {
                    
                    Button("ПОДРОСТКОВАЯ ОБУВЬ (ОТ 7 ДО 10 ЛЕТ)") {
                        showsDetailViewController6.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController6) {
                        PodrostkovayaObuv()
                    }
                    
                    Spacer()
                    
                    
                    
                }
               
            }
                
            
          
  //__________________________________________________
                
                
            }
        }
        
   }
     
}

struct NavigaciyaDetskayaOdejda_Previews: PreviewProvider {
    static var previews: some View {
        NavigaciyaDetskayaOdejda().previewDevice("iPhone SE (2nd generation)")
    }
}

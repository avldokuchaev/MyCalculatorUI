//
//  NavigationRasmerOdejdiDlyaVzroslih.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//
//Навигация размеры одежды взрослых

import SwiftUI

struct NavigationRasmerOdejdiDlyaVzroslih: View {
    
    @State private var showsDetailViewController: Bool = false
    @State private var showsDetailViewController1: Bool = false
    @State private var showsDetailViewController2: Bool = false
    @State private var showsDetailViewController3: Bool = false
    @State private var showsDetailViewController4: Bool = false
    @State private var showsDetailViewController5: Bool = false
    @State private var showsDetailViewController6: Bool = false
    @State private var showsDetailViewController7: Bool = false
    @State private var showsDetailViewController8: Bool = false
    @State private var showsDetailViewController9: Bool = false
    @State private var showsDetailViewController10: Bool = false
    @State private var showsDetailViewController11: Bool = false
    @State private var showsDetailViewController12: Bool = false
    @State private var showsDetailViewController13: Bool = false
    
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
                
                
                    Text("Соответствие размеров одежды для взрослых")
                    .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.green)
                    
                    
                
                VStack {
                    
                    Button("Мужская одежда") {
                        showsDetailViewController1.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController1) {
                        MujskayaOdejda()
                    }
                    
                    Spacer()
                    
                    Button("Мужская одежда больших размеров") {
                        showsDetailViewController2.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController2) {
                        MujskayaOdejdaBolshihRazmerov()
                    }
                    
                    Spacer()
                    
                    Button("Мужские джинсы") {
                        showsDetailViewController3.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController3) {
                        MujskieDjinsi()
                    }
                    
                    Spacer()
                    
                    Button("Мужские сорочки по номеру воротничка") {
                        showsDetailViewController4.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController4) {
                        MujskieSorochkiPoVorotnichku()
                    }
                    
                    Spacer()
                    
                    Button("Мужское белье") {
                        showsDetailViewController5.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController5) {
                        MujskoeBelie()
                    }
                    
                    Spacer()
                    
                    
                }
                
                VStack {
                    
                    Button("Мужские носки") {
                        showsDetailViewController6.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController6) {
                        MujskieNoski()
                    }
                    
                    Spacer()
                    
                    
                    Button("Мужская обувь") {
                        showsDetailViewController7.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController7) {
                        MujskayaObuv()
                    }
                    
                    Spacer()
                    
                    Button("Женская одежда") {
                        showsDetailViewController8.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController8) {
                        JenskayaOdejda()
                    }
                    
                    Spacer()
                    
                    Button("Женская одежда больших размеров") {
                        showsDetailViewController9.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController9) {
                        JenskayaOdejdaBolshihRazmerov()
                    }
                    
                    Spacer()
                    
                    Button("Женские джинсы") {
                        showsDetailViewController10.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController10) {
                        JenskieDjinsi()
                    }
                    
                    Spacer()
                    
                }
                
                Group {
                    
                    Button("Женское белье") {
                        showsDetailViewController11.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController11) {
                        JenskoeBelie()
                    }
                    
                    Spacer()
                    
                    Button("Женские носки") {
                        showsDetailViewController12.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController12) {
                        JenskieNoski()
                    }
                    
                    Spacer()
                    
                    Button("Женская обувь") {
                        showsDetailViewController13.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController13) {
                        JenskayaObuv()
                    }
                    
                    Spacer()
                    
                }
                
                
            
          
//_____________________________________________________
               
                
            }
            }
        }
    }
}
struct NavigationRasmerOdejdiDlyaVzroslih_Previews: PreviewProvider {
    static var previews: some View {
        NavigationRasmerOdejdiDlyaVzroslih().previewDevice("iPhone SE (2nd generation)")
    }
}

//
//  NavigationMain.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//

import SwiftUI

//Навигация главная

struct NavigationMain: View {
    
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
       
          VStack {
            
                Button("") {
                    UIApplication.shared.open(URL(string: imag!["url"]!)!)
                }
                .buttonStyle(BunnerButton(img: Image(imag!["image"]!)))
                .background(.yellow)
                
                HStack {
                    Button("На главную") {
                        self.showsDetailViewController = true
                    }
                    .padding(.leading, 10.0)
                    .foregroundColor(.blue)
                    .sheet(isPresented: $showsDetailViewController) {
                        ContentView()
                }
                    
                    Spacer()
                    
                }
                
                Spacer()
 //__________________________________________________

                Text(/*@START_MENU_TOKEN@*/"Навигация"/*@END_MENU_TOKEN@*/)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                Spacer()
                
            VStack {
                
                Button("Соответствие размеров одежды для взрослых") {
                    showsDetailViewController1.toggle()
                }
                .padding(10)
                .frame(width: 370.0)
                .cornerRadius(10.0)
                .foregroundColor(.white)
                .background(.blue)
                .sheet(isPresented: $showsDetailViewController1) {
                    NavigationRasmerOdejdiDlyaVzroslih()
                }
                
                Spacer()
                
                Button("Соответствие размеров детской одежды") {
                    showsDetailViewController2.toggle()
                }
                .padding(10)
                .frame(width: 370.0)
                .cornerRadius(10.0)
                .foregroundColor(.white)
                .background(.blue)
                .sheet(isPresented: $showsDetailViewController2) {
                    NavigaciyaDetskayaOdejda()
            }
                
                Spacer()
                
                Button("Финансовые калькуляторы") {
                    showsDetailViewController3.toggle()
                }
                .padding(10)
                .frame(width: 370.0)
                .cornerRadius(10.0)
                .foregroundColor(.white)
                .background(.blue)
                .sheet(isPresented: $showsDetailViewController3) {
                    NavigaciyaFinansovieCalculatori()
            }
                
                Spacer()
                
                Button("Здоровье и спорт") {
                    showsDetailViewController4.toggle()
                }
                .padding(10)
                .frame(width: 370.0)
                .cornerRadius(10.0)
                .foregroundColor(.white)
                .background(.blue)
                .sheet(isPresented: $showsDetailViewController4) {
                    NavigaciyaSportIZdorovie()
            }
                
                Spacer()
                 
                Button("Штрих-коды стран") {
                    showsDetailViewController5.toggle()
                }
                .padding(10)
                .frame(width: 370.0)
                .cornerRadius(10.0)
                .foregroundColor(.white)
                .background(.blue)
                .sheet(isPresented: $showsDetailViewController5) {
                    ShtrihKodi()
            }
                
                Spacer()
                
            }
//__________________________________________________
                    
            }
            
        }
       
   }
    
}

struct NavigationMain_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMain().previewDevice("iPhone SE (2nd generation)")
    }
}


//
//  NavigaciyaFinansovieCalculatori.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//
//Навигация финансовые калькуляторы

import SwiftUI

struct NavigaciyaFinansovieCalculatori: View {
    
    @State private var showsDetailViewController: Bool = false
    @State private var showsDetailViewController1: Bool = false
    @State private var showsDetailViewController2: Bool = false
    @State private var showsDetailViewController3: Bool = false
    @State private var showsDetailViewController4: Bool = false
    
    
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
                
                
                    Text("Финансовые калькуляторы")
                    .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.green)
                    
                
                VStack {
                    
                    Button("Кредитный калькулятор с аннуитетными платежами") {
                        showsDetailViewController1.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController1) {
                        CalculatorAnnuitetniePlateji()
                    }
                    
                    Spacer()
                    
                    Button("Кредитный калькулятор с дифференцированными платежами") {
                        showsDetailViewController2.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController2) {
                        CalculatorDifferencirovanniePlateji()
                    }
                    
                    Spacer()
                    
                    Button("Калькулятор вклада без капитализации") {
                        showsDetailViewController3.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController3) {
                        CalculatorVkladaBezKapitalizacii()
                    }
                    
                    Spacer()
                    
                    Button("Калькулятор вклада с капитализацией") {
                        showsDetailViewController4.toggle()
                    }
                    .padding(10)
                    .frame(width: 370.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    .sheet(isPresented: $showsDetailViewController4) {
                        CalculatorVkladaSKapitalizaciei()
                    }
                    
                    Spacer()
              
                }
                
        
  //__________________________________________________
                
                
            }
        }
        
   }
     
}

struct NavigaciyaFinansovieCalculatori_Previews: PreviewProvider {
    static var previews: some View {
        NavigaciyaFinansovieCalculatori().previewDevice("iPhone SE (2nd generation)")
    }
}

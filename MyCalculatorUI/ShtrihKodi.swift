//
//  ShtrihKodi.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
//
//Штрих коды

import SwiftUI

struct ShtrihKodi: View {
    
    @State private var showsDetailViewController = false
    
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
    
    @FocusState private var nameIsFocused: Bool
    
    @State private var shtrihcodeOutlet1: String = ""
    
    @State private var strana: String = ""
    
    @State private var resultText: String = ""
    
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
                    Button("В меню") {
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
                
                
 //__________________________________________________
                
                Text("Штрих-коды стран")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .frame(width: 370.0)
                    .background(.green)
                
                VStack {
                    
                    Text("Введите первые 3 цифры штрих-кода")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .background(.gray)
                        
                    
                    Spacer()
                    
                    TextField("460", text: $shtrihcodeOutlet1)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: 370.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                        .focused($nameIsFocused)
                    
                    Spacer()
                    
                }
                
                VStack {
                    
                    Button("Результат") {
                        
                        nameIsFocused = false
                        
                        if self.shtrihcodeOutlet1 == "" {
                            
                            self.resultText = "Введите данные в форму"
                            
                        } else {
                            
                            switch Double(self.shtrihcodeOutlet1)! {
                                
                            case 300 ... 379 :
                                self.strana = "Франция"
                            case  380 :
                                self.strana = "Болгария"
                            case  383 :
                                self.strana = "Словения"
                            case  385 :
                                self.strana = "Хорватия"
                            case 387  :
                                self.strana = "Босния и Герцеговина"
                            case  400 ... 440 :
                                self.strana = "Германия"
                            case  460 ... 469 :
                                self.strana = "Россия"
                            case  474 :
                                self.strana = "Эстония"
                            case  475 :
                                self.strana = "Латвия"
                            case  477 :
                                self.strana = "Литва"
                            case  481 :
                                self.strana = "Белоруссия"
                            case  482 :
                                self.strana = "Украина"
                            case  484 :
                                self.strana = "Молдавия"
                            case  500 ... 509 :
                                self.strana = "Великобритания"
                            case  520 :
                                self.strana = "Греция"
                            case  530 :
                                self.strana = "Албания"
                            case  531 :
                                self.strana = "Северная Македония"
                            case  535 :
                                self.strana = "Мальта"
                            case  539 :
                                self.strana = "Ирландия"
                            case  540 ... 549 :
                                self.strana = "Бельгия или Люксембург"
                            case  560 :
                                self.strana = "Португалия"
                            case  569 :
                                self.strana = "Исландия"
                            case  570 ... 579 :
                                self.strana = "Дания"
                            case  590 :
                                self.strana = "Польша"
                            case  594 :
                                self.strana = "Румыния"
                            case  599 :
                                self.strana = "Венгрия"
                            case  640 ... 649 :
                                self.strana = "Финляндия"
                            case  700 ... 709 :
                                self.strana = "Норвегия"
                            case  730 ... 739 :
                                self.strana = "Швеция"
                            case  760 ... 769 :
                                self.strana = "Швейцария"
                            case  800 ... 839 :
                                self.strana = "Италия"
                            case  840 ... 849 :
                                self.strana = "Испания"
                            case  858 :
                                self.strana = "Словакия"
                            case  859 :
                                self.strana = "Чехия"
                            case  860 :
                                self.strana = "Сербия или Черногория"
                            case  870 ... 879 :
                                self.strana = "Нидерланды"
                            case  900 ... 919 :
                                self.strana = "Австрия"
                            case  470 :
                                self.strana = "Киргизия"
                            case  476 :
                                self.strana = "Азербайджан"
                            case  478 :
                                self.strana = "Узбекистан"
                            case  479 :
                                self.strana = "Шри-Ланка"
                            case  480 :
                                self.strana = "Филиппины"
                            case 485  :
                                self.strana = "Армения"
                            case 486  :
                                self.strana = "Грузия"
                            case  487 :
                                self.strana = "Казахстан"
                            case  488 :
                                self.strana = "Таджикистан"
                            case  490 ... 499 :
                                self.strana = "Япония"
                            case  528 :
                                self.strana = "Ливан"
                            case 529  :
                                self.strana = "Кипр"
                            case 608  :
                                self.strana = "Бахрейн"
                            case  621 :
                                self.strana = "Сирия"
                            case 625  :
                                self.strana = "Иордания"
                            case  626 :
                                self.strana = "Иран"
                            case  627 :
                                self.strana = "Кувейт"
                            case 628  :
                                self.strana = "Саудовская Аравия"
                            case 629  :
                                self.strana = "ОАЭ"
                            case  690 ... 695 :
                                self.strana = "Китай"
                            case  729 :
                                self.strana = "Израиль"
                            case  865 :
                                self.strana = "Монголия"
                            case 867  :
                                self.strana = "КНДР"
                            case  869 :
                                self.strana = "Турция"
                            case  880 :
                                self.strana = "Республика Корея"
                            case 884  :
                                self.strana = "Камбоджа"
                            case  885 :
                                self.strana = "Таиланд"
                            case 888  :
                                self.strana = "Сингапур"
                            case  890 :
                                self.strana = "Индия"
                            case 893  :
                                self.strana = "Вьетнам"
                            case  899 :
                                self.strana = "Индонезия"
                            case  955 :
                                self.strana = "Малайзия"
                            case  930 ... 939 :
                                self.strana = "Австралия"
                            case  940 ... 949 :
                                self.strana = "Новая Зеландия"
                            case  489 :
                                self.strana = "Гонконг"
                            case  958 :
                                self.strana = "Макао"
                            case  471 :
                                self.strana = "Тайвань"
                            case  000 ... 139 :
                                self.strana = "США"
                            case  740 :
                                self.strana = "Гватемала"
                            case 741  :
                                self.strana = "Сальвадор"
                            case  742 :
                                self.strana = "Гондурас"
                            case  743 :
                                self.strana = "Никарагуа"
                            case  744 :
                                self.strana = "Коста-Рика"
                            case  745 :
                                self.strana = "Панама"
                            case  746 :
                                self.strana = "Доминиканская Республика"
                            case  750 :
                                self.strana = "Мексика"
                            case  754 ... 755 :
                                self.strana = "Канада"
                            case  850 :
                                self.strana = "Куба"
                            case  759 :
                                self.strana = "Венесуэла"
                            case  770 :
                                self.strana = "Колумбия"
                            case  773 :
                                self.strana = "Уругвай"
                            case 775  :
                                self.strana = "Перу"
                            case  777 :
                                self.strana = "Боливия"
                            case 779  :
                                self.strana = "Аргентина"
                            case 780  :
                                self.strana = "Чили"
                            case  784 :
                                self.strana = "Парагвай"
                            case 786  :
                                self.strana = "Эквадор"
                            case  789 ... 790 :
                                self.strana = "Бразилия"
                            case  600 ... 601 :
                                self.strana = "ЮАР"
                            case  603 :
                                self.strana = "Гана"
                            case  609 :
                                self.strana = "Маврикий"
                            case  611 :
                                self.strana = "Марокко"
                            case  613 :
                                self.strana = "Алжир"
                            case 616  :
                                self.strana = "Кения"
                            case  618 :
                                self.strana = "Кот-д'Ивуар"
                            case  619 :
                                self.strana = "Тунис"
                            case  622 :
                                self.strana = "Египет"
                            case  624 :
                                self.strana = "Ливия"
                            default:
                                self.strana = "Такой страны нет в списке"
                            }
                                
                            self.resultText = "Штрих-код соответствует стране: " + strana
                            
                        }
                        
                    }
                    .padding(10)
                    .frame(width: 300.0)
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
                    .background(.blue)
                    
                    
                    Spacer()
                    
                    Text ("\(resultText)")
                        .fontWeight(.bold)
                        .padding(10)
                        .frame(width: 370.0)
                        
                        
                    
                    Spacer()
                    
                }
                
            }
            .onTapGesture {
                        hideKeyboard()
                }
 //__________________________________________________
                
                
            }
        }
        
   }
     
}

struct ShtrihKodi_Previews: PreviewProvider {
    static var previews: some View {
        ShtrihKodi().previewDevice("iPhone SE (2nd generation)")
    }
}

//
//  BunnerStyle.swift
//  MyCalculatorUI
//
//  Created by Andrei Dokuchaev on 12.02.2023.
// Стиль баннера ротатора

import SwiftUI

/*let images = [
    ["image" : "Agrokomplexshop", "url" : "https://aflink.ru/g/lkj8u73nnd31225e5a7704cb4947eb/"],
    ["image" : "allradru", "url" : "https://aflink.ru/g/elgf718etq31225e5a770e020ad620/?erid=LatgBUcjU"],
    ["image" : "Baggins", "url" : "https://aflink.ru/g/m33u5flihp31225e5a7787b20ecef3/?erid=LatgBgkRu"],
    ["image" : "Bestwatch", "url" : "https://aflink.ru/g/7d074b20eb31225e5a7777d7343c30/?erid=LatgBiNsP"],
    ["image" : "Blackwoodbag", "url" : "https://aflink.ru/g/n90gqfg8zz31225e5a7768b0e348e3/?erid=LatgBs8Xq"],
    ["image" : "CDEK", "url" : "https://aflink.ru/g/8m5m8022me31225e5a77fa1399d1cb/"],
    ["image" : "Credit7RU", "url" : "https://aflink.ru/g/vojb18n6gs31225e5a7796bf0d7973/?erid=LatgBnShk"],
    ["image" : "cvetDivanov", "url" : "https://aflink.ru/g/67570bafb631225e5a7766146bcf1d/"],
    ["image" : "europamarket", "url" : "https://aflink.ru/g/yh7dxsl4ze31225e5a770d5c628f32/?erid=LatgBk5GN"],
    ["image" : "fitstars", "url" : "https://aflink.ru/g/lcz5l7shqa31225e5a77253f07e8f6/"],
    ["image" : "growfood", "url" : "https://aflink.ru/g/36wusytszy31225e5a77aeb982cd0a/"],
    ["image" : "Iskussnica", "url" : "https://aflink.ru/g/er5wwbo0j631225e5a77f665c6f820/"],
    ["image" : "kolesaDarom", "url" : "https://aflink.ru/g/phemb8m2uc31225e5a77ccd85565ce/?erid=LatgCAysS"],
    ["image" : "Letbefit", "url" : "https://aflink.ru/g/qm29jzxwek31225e5a77fcd3300043/"],
    ["image" : "LevelKitchen", "url" : "https://aflink.ru/g/u7cz7332nc31225e5a77738d825a2a/"],
    ["image" : "MadWave", "url" : "https://aflink.ru/g/02ocqj6mtr31225e5a7702f7474c98/?erid=LatgBxmTS"],
    ["image" : "Mealjoyru", "url" : "https://aflink.ru/g/ml2h339a7u31225e5a77c9dd5f6bbc/"],
    ["image" : "MoskovskayaMehovayaKompaniya", "url" : "https://aflink.ru/g/06d83a456331225e5a77c6abdc5353/"],
    ["image" : "NFONorwegianFishOil", "url" : "https://aflink.ru/g/l604dr7c1e31225e5a779c176d7edf/?erid=LatgBome6"],
    ["image" : "OKBeauty", "url" : "https://aflink.ru/g/nl23vc8ifb31225e5a7753b0491767/?erid=LatgBpT4S"],
    ["image" : "Petrolplus", "url" : "https://aflink.ru/g/ib927vcr1x31225e5a77fdbdccbe6f/?erid=LatgBxrwE"],
    ["image" : "Pichshop", "url" : "https://aflink.ru/g/balo8rex4231225e5a77a28df5fc31/?erid=LatgC9HFD"],
    ["image" : "Pizzaallo", "url" : "https://aflink.ru/g/bgi1r32ntf31225e5a77b0f1f587ba/"],
    ["image" : "playtoday", "url" : "https://aflink.ru/g/ibbrr5pyi831225e5a7778ec4c4caa/"],
    ["image" : "Pokrishka", "url" : "https://aflink.ru/g/bw09hq1psa31225e5a77729032ae9b/?erid=LatgBtona"],
    ["image" : "Polis812RU", "url" : "https://aflink.ru/g/m7xuhz7ysw31225e5a77440db5965d/"],
    ["image" : "ProfmaxPro", "url" : "https://aflink.ru/g/d2y1qd8flb31225e5a7739152ee3f6/?erid=LatgBhUb7"],
    ["image" : "Randewoo", "url" : "https://aflink.ru/g/efixkgr4c431225e5a770dd11956d5/"],
    ["image" : "RenessansJiznRU", "url" : "https://aflink.ru/g/9qw2p1opbr31225e5a77e76cad6e67/?erid=LatgBgjtz"],
    ["image" : "rerooms", "url" : "https://aflink.ru/g/5nilvc2n6731225e5a77592052c97a/?erid=LatgBbjCK"],
    ["image" : "Rockyshop", "url" : "https://aflink.ru/g/lrpvclu24w31225e5a77be166c0a8b/?erid=LatgBeihm"],
    ["image" : "sbermarket", "url" : "https://aflink.ru/g/ugldybr34d31225e5a77326cfdd537/?erid=LatgBYJCD"],
    ["image" : "Shopneoline", "url" : "https://aflink.ru/g/pi8gje4m1p31225e5a771c454c946b/?erid=LatgBso7Y"],
    ["image" : "Smallcitysu", "url" : "https://aflink.ru/g/vwrmyws33j31225e5a77d720df3727/?erid=LatgBnrbd"],
    ["image" : "Smartwaytoday", "url" : "https://aflink.ru/g/c2jesykfil31225e5a7792877be4a1/?erid=LatgCB1Es"],
    ["image" : "sohoshop", "url" : "https://aflink.ru/g/x5npm7rr8e31225e5a77e6dc21c9f7/"],
    ["image" : "Sprinthost", "url" : "https://aflink.ru/g/mxmtlx74bh31225e5a77b183dfeeb8/?erid=LatgByErP"],
    ["image" : "SuperStepRU", "url" : "https://aflink.ru/g/enml32rwhr31225e5a77a814938f71/?erid=LatgBXe4u"],
    ["image" : "TheFurnish", "url" : "https://aflink.ru/g/e119380ec031225e5a7775922924c2/?erid=LatgBVe6K"],
    ["image" : "ugindoma", "url" : "https://aflink.ru/g/5ypaik84gp31225e5a77069ee805e1/?erid=LatgBVKg8"],
    ["image" : "VKMuzika", "url" : "https://aflink.ru/g/dnezl2xu4131225e5a77af54ab86e0/"],
    ["image" : "Vprokru", "url" : "https://aflink.ru/g/paesexo5wj31225e5a77aa88a5b1cc/"],
    ["image" : "YandexBuisnessRU", "url" : "https://aflink.ru/g/tsur35yw0t31225e5a77ff277dce71/"],
    ["image" : "yandexgodlyabiznesa", "url" : "https://aflink.ru/g/kzlcevsny831225e5a7784814a437b/"],
    ["image" : "zaochnik", "url" : "https://aflink.ru/g/sk55otxguo31225e5a776853a97b34/?erid=LatgBb6k3"],
    ["image" : "ZettaStrhovanieRU", "url" : "https://aflink.ru/g/27wmm2ciw331225e5a774d3555d70b/?erid=LatgBTy98"],
    ["image" : "zoomag", "url" : "https://aflink.ru/g/m7bdjiij7e31225e5a7745912f3e2d/?erid=LatgCAHzf"],
    ["image" : "zooptorgrf", "url" : "https://aflink.ru/g/rvcnriueyx31225e5a77e22b63c9b7/?erid=LatgC9HKd"],
    ["image" : "AlfaBankCreditnieKartiRU", "url" : "https://aflink.ru/g/i352cbwpfv31225e5a771cb5598fff/"],
    ["image" : "aliexpress", "url" : "https://alitems.co/g/vv3q4oey1v31225e5a77b6d1781017/"],
    ["image" : "alter", "url" : "https://aflink.ru/g/fxysja9qse31225e5a776704bcdbc1/?erid=LatgC1bqD"],
    ["image" : "autoall", "url" : "https://aflink.ru/g/5rermd1rb531225e5a77aeed5c54e0/?erid=LatgBk8mS"],
    ["image" : "autopiter", "url" : "https://aflink.ru/g/1hedtmqch531225e5a771423f7dae0/?erid=LatgBpn1Q"],
    ["image" : "Bbcream", "url" : "https://aflink.ru/g/9l1uizc2km31225e5a771bd767fd6d/?erid=LatgBYK7C"],
    ["image" : "calltouch", "url" : "https://aflink.ru/g/y3x3cfffmv31225e5a77f6ebb01ee1/?erid=LatgC3YPC"],
    ["image" : "cantra", "url" : "https://aflink.ru/g/ezmwtz3pov31225e5a7785aed9e6f6/?erid=LatgBaf2A"],
    ["image" : "CherehapaRU", "url" : "https://aflink.ru/g/2ey5h355qu31225e5a771e9ee21cc3/?erid=LatgBpnvS"],
    ["image" : "GeekBrains", "url" : "https://aflink.ru/g/k3dfvevwit31225e5a7765a37ca03d/"],
    ["image" : "productstar", "url" : "https://aflink.ru/g/t9pnpumx6q31225e5a775e445e6c7b/?erid=LatgC7JZZ"],
    ["image" : "Promomegafitpro", "url" : "https://aflink.ru/g/ehygr1fnh831225e5a77ed7d1ea7c0/?erid=LatgBtjgG"],
    ["image" : "puzzlemovies", "url" : "https://aflink.ru/g/ae4zpznc0i31225e5a7742f9f2178b/?erid=LatgC5CoU"],
    ["image" : "RBKPro", "url" : "https://aflink.ru/g/hmgfm467d731225e5a774c86cb021e/?erid=LatgC5eJ7"],
    ["image" : "skypro", "url" : "https://aflink.ru/g/kpr3e0qpel31225e5a775eaaeb7930/?erid=LatgBtSwH"],
    ["image" : "Tetrikaschool", "url" : "https://aflink.ru/g/54h3zonoi631225e5a7794d0e5a27a/"],
    ["image" : "Ukassa", "url" : "https://aflink.ru/g/hlif2saueo31225e5a77dff88f55df/"],
    ["image" : "Vipfish", "url" : "https://aflink.ru/g/lqb6l7197z31225e5a7794cf89477e/"],
    ["image" : "YESEducationGroup", "url" : "https://aflink.ru/g/tfogdtvvuf31225e5a772019e44728/"]
]

 let imag = images.randomElement()

struct BunnerButton: ButtonStyle {
    let img: Image
   
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        img
        .renderingMode(.original)
        .frame(width: 300, height: 38)
    }
    
}
*/

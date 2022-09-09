//
//  KeyView.swift
//  calculator
//
//  Created by Aman Negi on 08/09/22.
//

import SwiftUI

struct KeyView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @State private var changeColor = false
    
    let buttons: [[Keys]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        VStack{
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(changeColor ? Color("num").opacity(0.4) : Color.pink.opacity(0.2))
                    .scaleEffect(changeColor ? 1.5 : 1.0)
                    .frame(width: 350, height: 280)
                    .animation(Animation.easeInOut.speed(0.17).repeatForever(),value: changeColor)
                    .onAppear(perform: {self.changeColor.toggle()})
                .overlay(Text(value).bold().font(.system(size: 100)).foregroundColor(.black))
            }.padding()
            Spacer()
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 10){
                    ForEach(row, id: \.self) { elem in
                        Button {
                            self.didTap(button: elem)
                        } label: {
                            Text(elem.rawValue).font(.system(size: 30))
                                .frame(width: self.getButtonWidth(elem), height: self.getButtonHeight())
                                .background(elem.buttonColor)
                                .foregroundColor(.black)
                                .cornerRadius(self.getButtonWidth(elem)/2)
                                .shadow(color: .purple.opacity(0.8), radius: 30)
                        }

                    }
                }.padding(.bottom, 4)
            }
        }
    }
    
    func getButtonWidth(_ elem: Keys) -> CGFloat {
        
        if elem == .zero {
            return (UIScreen.main.bounds.width - (5*10)) / 2
        }
        
        // (total width - spacing given to other elements) / number of elements
        return (UIScreen.main.bounds.width - (5*10)) / 4
    }
    
    func getButtonHeight() -> CGFloat {
        // (total width - spacing given to other elements) / number of elements
        return (UIScreen.main.bounds.width - (5*10)) / 5
    }
    
    func didTap(button: Keys) {
        switch button {
        case .add:
            self.currentOperation = .add
            self.runningNumber = Int(self.value) ?? 0
            self.value = "0"
        case .subtract:
            self.currentOperation = .subtract
            self.runningNumber = Int(self.value) ?? 0
            self.value = "0"
        case .multiply:
            self.currentOperation = .multiply
            self.runningNumber = Int(self.value) ?? 0
            self.value = "0"
        case .divide:
            self.currentOperation = .divide
            self.runningNumber = Int(self.value) ?? 0
            self.value = "0"
        case .equal:
            let runningValue = self.runningNumber
            let currentValue = Int(self.value) ?? 0
            
            switch self.currentOperation {
            case .add: self.value = "\(runningValue + currentValue)"
            case .subtract: self.value = "\(runningValue - currentValue)"
            case .multiply: self.value = "\(runningValue * currentValue)"
            case .divide: self.value = "\(runningValue / currentValue)"
            case .none: break
            }
        case .clear:
            self.value = "0"
            self.runningNumber = 0
            self.currentOperation = .none
        case .decimal:
            break
        case .negative:
            break
        case .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                self.value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
        
    }
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}

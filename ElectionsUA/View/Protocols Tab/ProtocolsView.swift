//
//    ProtocolsView.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 30.05.2022.
//

import SwiftUI

struct ProtocolsView: View {

    @ObservedObject var vm = ProtocolVM()


    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(vm.fields.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        HStack(spacing: 7) {
                            Text(vm.fields[index].title)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            TextField("   0", text: $vm.inputs[index])
                                .tag(index)
                                .frame(width: 60)
                        }
                        Text("\(vm.fields[index].error)")
                    }
                    .padding([.horizontal], 15)
                }
            }
        }
    }
}

struct __ProtocolsView_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolsView()
    }
}

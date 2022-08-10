//
//  UserView.swift
//  Friendface
//
//  Created by Badran on 09/08/2022.
//

import SwiftUI

struct UserView: View {
    let isActive: Bool
    
    let smileys = "😀😃😄😁😆😅😂🤣🥲☺️😊😇🙂🙃😉😌😍🥰😘😗😙😚😋😛😝😜🤪🤨🧐🤓😎🥸🤩🥳😏😒😞😔😟😕🙁☹️😣😖😫😩🥺😢😭😤😠😡🤬🤯😳🥵🥶😶‍🌫️😱😨😰😥😓🤗🤔🤭🤫🤥😶😐😑😬🙄😯😦😧😮😲🥱😴🤤😪😮‍💨😵😵‍💫🤐🥴🤢🤮🤧😷🤒🤕🤑🤠"

    var smiley: Character {
        Array(smileys).randomElement() ?? "👻"
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Text(String(smiley))
                .font(.largeTitle)

            if isActive {
                Circle()
                    .fill(.green)
                    .frame(width: 10, height: 10)
                    .offset(x: -2, y: -2)

                Circle()
                    .strokeBorder(.secondary, lineWidth: 1)
                    .frame(width: 10, height: 10)
                    .offset(x: -2, y: -2)
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(isActive: true)
    }
}

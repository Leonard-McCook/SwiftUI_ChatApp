//
//  ConversationView.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/30/23.

import SwiftUI

struct ConversationView: View {
    
    @EnvironmentObject var chatViewModel: ChatViewModel
    @EnvironmentObject var contactsViewModel: ContactsViewModel
    
    @Binding var isChatShowing: Bool
    
    @State var selectedImage: UIImage?
    @State var isPickerShowing = false
    
    @State var isSourceMenuShowing = false
    @State var source: UIImagePickerController.SourceType = .photoLibrary
    
    @State var chatMessage = ""
    @State var participants = [User]()
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            // Chat header
            HStack {
                VStack (alignment: .leading) {
                    
                    // Back arrow
                    Button {
                        // Dismiss chat window
                        isChatShowing = false
                        
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("text-header"))
                    }
                    .padding(.bottom, 16)
                    
                    // Name
                    if participants.count > 0 {
                        
                        let participant = participants.first
                        
                        Text("\(participant?.firstname ?? "") \(participant?.lastname ?? "")")
                            .font(Font.chatHeading)
                            .foregroundColor(Color("text-header"))
                    }
                    
                }
                
                Spacer()
                
                // Profile image
                if participants.count > 0 {
                    
                    let participant = participants.first
                    
                    ProfilePicView(user: participant!)
                }
                
            }
            .padding(.horizontal)
            .frame(height: 104)
            
            // Chat log
            
            ScrollViewReader { proxy in
                
                ScrollView {
                    
                    VStack (spacing: 24) {
                        
                        ForEach (Array(chatViewModel.messages.enumerated()), id: \.element) { index, msg in
                            
                            let isFromUser = msg.senderid == AuthViewModel.getLoggedInUserId()
                            
                            // Dynamic message
                            HStack {
                                
                                if isFromUser {
                                    // Timestamp
                                    Text(DateHelper.chatTimestampFrom(date: msg.timestamp))
                                        .font(Font.smallText)
                                        .foregroundColor(Color("text-timestamp"))
                                        .padding(.trailing)
                                    
                                    Spacer()
                                }
                                
                                if msg.imageurl != "" {
                                    // Photo Message
                                    
                                    // Check image cache, if it exists use that
                                    if let cachedImage = CacheService.getImage(forKey: msg.imageurl!) {
                                        
                                        // Image is in cache so lets use it
                                        cachedImage
                                            .resizable()
                                            .scaledToFill()
                                            .padding(.vertical, 16)
                                            .padding(.horizontal, 24)
                                            .background(isFromUser ? Color("bubble-primary") : Color("bubble-secondary"))
                                            .cornerRadius(30, corners: isFromUser ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight])
                                            
                                    }
                                    else {
                                        // Download the image
                                        // Create URL from msg photo url
                                        let photoUrl = URL(string: msg.imageurl!)
                                        
                                        // Profile image
                                        AsyncImage(url: photoUrl) { phase in
                                            
                                            switch phase {
                                                
                                            case .empty:
                                                // Currently fetching
                                                ProgressView()
                                                
                                            case .success(let image):
                                                // Display the fetched image
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .padding(.vertical, 16)
                                                    .padding(.horizontal, 24)
                                                    .background(isFromUser ? Color("bubble-primary") : Color("bubble-secondary"))
                                                    .cornerRadius(30, corners: isFromUser ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight])
                                                    .onAppear {
                                                        
                                                        // Save this image to cache
                                                        CacheService.setImage(image: image, forKey: msg.imageurl!)
                                                    }
                                                
                                            case .failure:
                                                // Couldn't fetch profile photo
                                                // Display circle with first letter of first name
                                                Text("Couldn't load image")
                                                    .font(Font.bodyParagraph)
                                                    .foregroundColor(isFromUser ? Color("text-button") : Color("text-primary"))
                                                    .padding(.vertical, 16)
                                                    .padding(.horizontal, 24)
                                                    .background(isFromUser ? Color("bubble-primary") : Color("bubble-secondary"))
                                                    .cornerRadius(30, corners: isFromUser ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight])
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                }
                                else {
                                    // Tex Message
                                    Text(msg.msg)
                                        .font(Font.bodyParagraph)
                                        .foregroundColor(isFromUser ? Color("text-button") : Color("text-primary"))
                                        .padding(.vertical, 16)
                                        .padding(.horizontal, 24)
                                        .background(isFromUser ? Color("bubble-primary") : Color("bubble-secondary"))
                                        .cornerRadius(30, corners: isFromUser ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight])
                                }
                                
                                if !isFromUser {
                                    
                                    Spacer()
                                    
                                    Text(DateHelper.chatTimestampFrom(date: msg.timestamp))
                                        .font(Font.smallText)
                                        .foregroundColor(Color("text-timestamp"))
                                        .padding(.leading)
                                }
                                
                            }
                            .id(index)
                            
                            
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 24)
                    
                }
                .background(Color("background"))
                .onChange(of: chatViewModel.messages.count) { newCount in
                    
                    withAnimation {
                        proxy.scrollTo(newCount - 1)
                    }
                }
            }
            
            // Chat message bar
            ZStack {
                Color("background")
                    .ignoresSafeArea()
                
                HStack (spacing: 15) {
                    // Camera button
                    Button {
                        // Show picker
                        isSourceMenuShowing = true
                        
                    } label: {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .tint(Color("icons-secondary"))
                    }
                    
                    // Textfield
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(Color("date-pill"))
                            .cornerRadius(50)
                        
                        if selectedImage != nil {
                            
                            // Display image in message bar
                            Text("Image")
                                .foregroundColor(Color("text-input"))
                                .font(Font.bodyParagraph)
                                .padding(10)
                            
                            // Delete button
                            HStack {
                                Spacer()
                                
                                Button {
                                    // Delete the image
                                    selectedImage = nil
                                } label: {
                                    Image(systemName: "multiply.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(Color("text-input"))
                                }
                            }
                            .padding(.trailing, 12)
                        }
                        else {
                            
                            TextField("Type your message", text: $chatMessage)
                                .foregroundColor(Color("text-input"))
                                .font(Font.bodyParagraph)
                                .padding(10)
                            
                            // Emoji button
                            HStack {
                                Spacer()
                                
                                Button {
                                    // Emojis
                                } label: {
                                    Image(systemName: "face.smiling")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(Color("text-input"))
                                }
                            }
                            .padding(.trailing, 12)
                        }
                        
                        
                    }
                    .frame(height: 44)
                    
                    
                    // Send button
                    Button {
                        
                        // Check if image is selected, if so send image
                        
                        if selectedImage != nil {
                            
                            // Send image message
                            chatViewModel.sendPhotoMessage(image: selectedImage!)
                            
                            // Clear image
                            selectedImage = nil
                        }
                        else {
                            // Send text message
                            
                            // Clean up text msg
                            chatMessage = chatMessage.trimmingCharacters(in: .whitespacesAndNewlines)
                            
                            // Send message
                            chatViewModel.sendMessage(msg: chatMessage)
                            
                            // Clear textbox
                            chatMessage = ""
                        }
                        
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .tint(Color("icons-primary"))
                    }
                    .disabled(chatMessage.trimmingCharacters(in: .whitespacesAndNewlines) == "" && selectedImage == nil)
                    
                }
                .padding(.horizontal)
            }
            .frame(height: 76)
        }
        .onAppear {
            // Call chat view model to retrieve all chat messages
            chatViewModel.getMessages()
            
            // Try to get the other participants as User instances
            let ids = chatViewModel.getParticipantIds()
            self.participants = contactsViewModel.getParticipants(ids: ids)
        }
        .onDisappear {
            
            // Do any necesary clean up before conversation view disappears
            chatViewModel.conversationViewCleanup()
        }
        .confirmationDialog("From where?", isPresented: $isSourceMenuShowing, actions: {
            
            Button {
                // Set the source to photo library
                self.source = .photoLibrary
                
                // Show the image picker
                isPickerShowing = true
                
            } label: {
                Text("Photo Library")
            }
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                Button {
                    // Set the source to camera
                    self.source = .camera
                    
                    // Show the image picker
                    isPickerShowing = true
                } label: {
                    Text("Take Photo")
                }
            }
            
            
        })
        .sheet(isPresented: $isPickerShowing) {
            
            // Show the image picker
            ImagePicker(selectedImage: $selectedImage,
                        isPickerShowing: $isPickerShowing, source: self.source)
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView(isChatShowing: .constant(false))
    }
}

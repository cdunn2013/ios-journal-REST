//
//  EntryController.swift
//  journal
//
//  Created by Cameron Dunn on 1/24/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import Foundation

class EntryController{
    var entries: [Entry] = []
    var baseURL : URL = URL(string: "https://camerondunnjournal.firebaseio.com/")!
    
    
    func put(entryToEnter entry: Entry, completion: @escaping (Error?) -> Void){
        baseURL.appendPathComponent(entry.identifier)
        baseURL.appendPathComponent("json")
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.httpMethod = "PUT"
        do{
            let encoder = JSONEncoder()
            urlRequest.httpBody = try encoder.encode(entry)
        }catch{
            print(error)
            return
        }
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error{
                NSLog("There was an error in the 'put' method found in EntryController: \(error)")
                completion(error)
                return
            }
            completion(nil)
        }.resume()
    }
    func fetchEntries(completion: @escaping(Error?)-> Void){
        let url = baseURL.appendingPathComponent("json")
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error{
                NSLog("There was an error in the 'put' method found in EntryController: \(error)")
                completion(error)
                return
            }
            guard let data = data else{
                print("There was an error while accessing the data")
                return
            }
            do{
                let jsonDecoder = JSONDecoder()
                self.entries = try jsonDecoder.decode([Entry].self, from: data)
                self.entries = self.entries.sorted(by: {$0.timeStamp > $1.timeStamp})
            }catch{
                print("Error decoding recieved data: \(error)")
                completion(error)
                return
            }
            completion(nil)
        }.resume()
    }
    
    func createEntry(title: String, bodyText: String, completion: @escaping (Error?) -> Void){
        let entry = Entry(title: title, bodyText: bodyText)
        put(entryToEnter: entry, completion: completion)
    }
    
    
    func update(entry: Entry, title: String, bodyText: String, completion: @escaping (Error?) -> Void){
        var updatedEntry : Entry = entry
        updatedEntry.title = title
        updatedEntry.bodyText = bodyText
        put(entryToEnter: updatedEntry, completion: completion)
    }
    
    
}

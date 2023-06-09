#  TODO List

# Part 1
Link: [https://www.hackingwithswift.com/100/swiftui/53](https://www.hackingwithswift.com/100/swiftui/53)

- [x] Bookworm: Introduction
- [x] Creating a custom component with @Binding
- [x] Accepting multi-line text input with TextEditor
- [x] How to combine Core Data and SwiftUI

# Part 2
Link: [https://www.hackingwithswift.com/100/swiftui/54](https://www.hackingwithswift.com/100/swiftui/54)
- [x] Creating books with Core Data
- [x] Adding a custom star rating component
- [x] Building a list with @FetchRequest

# Part 3
Link: [https://www.hackingwithswift.com/100/swiftui/55](https://www.hackingwithswift.com/100/swiftui/55)
- [x] Showing book details
- [x] Sorting fetch requests with SortDescriptor
- [x] Deleting from a Core Data fetch request
- [x] Using an alert to pop a NavigationLink programmatically

# Part 4 | Challenges
[Link](https://www.hackingwithswift.com/books/ios-swiftui/bookworm-wrap-up)
- [x] Right now it’s possible to select no title, author, or genre for books, which causes a problem for the detail view. Please fix this, either by forcing defaults, validating the form, or showing a default picture for unknown genres – you can choose.
    - COMPLETED EARLY ON at commit "4b5cc63"  
        - METHOD: Do not allow submission of adding a new book if fields "title" and "author" are empty
        - Modified to use "Fantasy" as default genre picture
- [x] Modify ContentView so that books rated as 1 star are highlighted somehow, such as having their name shown in red.
    - COMPLETED at commit:
        - bbc132d4aaa8845f486230e8d6e86d84237dc78e
- [ ] Add a new “date” attribute to the Book entity, assigning Date.now to it so it gets the current date and time, then format that nicely somewhere in DetailView.

# Personal Challenge
- [x] Add Searchable bar to ContentView
    - COMPLETED on commits: 
        - d439e5a26ae979b54c207a9446c0d88a352384da
        - e15c97dcebbb4f7d040ab8943090cf2e7a276eb8

import Foundation

var greeting = "Hello, playground"
print(greeting)
// შევქმნათ Class Book.
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.

class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
        
    }
    
    func bookStatusBorrowed () {
        isBorrowed = true
    }
    
    func bookStatusReturned () {
        isBorrowed = false
    }
}
var salomesBook = Book(bookID: 100,
                       title: "სალომეს დღიურები",
                       author: "სალომე თოფურია",
                       isBorrowed: true)

salomesBook.bookStatusBorrowed()
salomesBook.bookStatusReturned()



//2. შევქმნათ Class Owner
//
//Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
//Designated Init.
//Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
////Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.

class Owner {
    var ownerId: Int
    var name: String
    var borrowedBooks: [Book]
    
    init(ownerId: Int, name: String, borrowedBooks: [Book]) {
        self.ownerId = ownerId
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func returnBook (book: Book)  {
        book.isBorrowed = false
        print("უფლება გაქვს დააბრუნო წიგნი")
        borrowedBooks.append(book)
    }
    func borrowBook (book: Book) {
        book.isBorrowed = true
        print("უფლება გაქვს აიღო წიგნი")
        borrowedBooks.removeFirst()
    }
}
var Owner1 = Owner(ownerId: 01,
                   name:"ელისაბედი" ,
                   borrowedBooks: [salomesBook])


// 3.შევქმნათ Class Library
//
//Properties: Books Array, Owners Array.
//Designated Init.
//Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
//Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
//Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
//Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
//Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
//Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.

class Library {
    var books: [Book]
    var owners: [Owner]
    
    init(books: [Book], owners: [Owner]) {
        self.books = books
        self.owners = owners
    }
    
    func addBook (book: Book) {
        books.append(book)
    }
    
    func addOwner (owner: Owner) {
        owners.append(owner)
    }
    
    func findBorrowedBook(book: Book) {
        book.isBorrowed = true
        print("არ არის ხელმისაწვდომი")
    }
    
    func findAndReturn(book: Book) -> [Book] {
        book.isBorrowed = false
        print("ხელმისაწვდომია")
        return books
    }
    
    func findOwnerByID(owner: Owner) {
        var ownerId = owner.ownerId
        for ownerID in owners {
            if ownerId == 01 {
            }
            print("უფლებამოსილი ხარ წაიღო!")
        }
        
    }
    
           }
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.
    
    func borrowBook (book: Book) {
        if book.isBorrowed == false {
            print("უფლება გაქვს წაიღო წიგნი")
        } else {
            print ("უფლება არ გაქვს! ")
        }
    }


//გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.

var nodosBook = Book(bookID: 101,
                     title: "კუკარაჩა",
                     author: "ნოდარ დუმბაძე",
                     isBorrowed: false)
var shotasBook = Book(bookID: 102,
                      title: "ვეფხისტყაოსანი",
                      author: "შოთა რუსთაველი",
                      isBorrowed: true)
var margaretsBook = Book(bookID: 103,
                         title: "Gone with the Wind",
                         author: "Margaret Mitchell",
                         isBorrowed: true)

var owner2 = Owner(ownerId: 02,
                   name: "გიორგი",
                   borrowedBooks: [margaretsBook])
var owner3 = Owner(ownerId: 03,
                   name: "თორნიკე",
                   borrowedBooks: [shotasBook])
var owner4 = Owner(ownerId: 04,
                   name: "გვანცა",
                   borrowedBooks: [])

var alexandria = Library(books: [nodosBook,  margaretsBook],
                         owners: [owner2, owner3])

//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
func addBook (alexandria: Library) {
    alexandria.addBook(book: shotasBook)
}
func addOwner (alexandria: Library) {
    alexandria.addOwner(owner: owner4)
}
alexandria.addBook(book: shotasBook)
alexandria.addOwner(owner: owner4)
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.

func borrowBook1 (book: Book) {
    if nodosBook.isBorrowed == false {
        print("უფლება გაქვს წაიღო წიგნი")
    }
}
borrowBook(book: nodosBook)


func returnBook (alexandria: Library)  {
    nodosBook.isBorrowed = false
    print("უფლება გაქვს დააბრუნო წიგნი")
    // borrowedBooks.append(nodosBook)
}
//
//func findAndReturn(alexandria: Library) -> [Book] {
//    book.isBorrowed = false
//    print("ხელმისაწვდომია")
//    return books
//}
// მაპატიეთ საშინელებები თუ წერიაა :(

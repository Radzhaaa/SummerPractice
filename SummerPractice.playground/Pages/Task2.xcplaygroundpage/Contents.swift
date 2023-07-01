
enum BookType {
    case fiction
    case nonFiction
}


struct Book {
    var title: String
    var author: String
    var type: BookType
}

/*оператор === используется только у ссылочных типов
переменную isCheckedOut лучше указать в протоколе
 */
protocol Borrowable: AnyObject {
    var isCheckedOut: Bool { get set }
    func borrow()
    func returnBook()
}


class LibraryItem {
    var catalogID: Int
//    var isCheckedOut: Bool

    init(catalogID: Int) {
        self.catalogID = catalogID
//        self.isCheckedOut = false
    }

    func displayCatalogID() {
        print("Каталожный номер: \(catalogID)")
    }

//    func checkOut() {
//        isCheckedOut = true
//    }
//
//    func returnToLibrary() {
//        isCheckedOut = false
//    }
}


class BookItem: LibraryItem, Borrowable {
    var isCheckedOut: Bool = false
    var book: Book
    
    init(catalogID: Int, book: Book) {
        self.book = book
        super.init(catalogID: catalogID)
    }
    
    func borrow() {
        if isCheckedOut {
            print("Книга уже выдана!")
        } else {
            isCheckedOut = true
            print("Книга \"\(book.title)\" выдана.")
        }
    }
    
    func returnBook() {
        if isCheckedOut {
            isCheckedOut = false
            print("Книга \"\(book.title)\" возвращена.")
        } else {
            print("Книга уже в наличии!")
        }
    }
}

class MagazineItem: LibraryItem, Borrowable {
    var isCheckedOut: Bool = false
    var magazineTitle: String
    
    init(catalogID: Int, magazineTitle: String) {
        self.magazineTitle = magazineTitle
        super.init(catalogID: catalogID)
    }
    
    func borrow() {
        if isCheckedOut {
            print("Журнал уже выдан!")
        } else {
            isCheckedOut = true
            print("Журнал \"\(magazineTitle)\" выдан.")
        }
    }
    
    func returnBook() {
        if isCheckedOut {
            isCheckedOut = false
            print("Журнал \"\(magazineTitle)\" возвращен.")
        } else {
            print("Журнал уже в наличии!")
        }
    }
}

class Reader {
    var readerName: String
    var libraryItems: [Borrowable]
    
    init(readerName: String) {
        self.readerName = readerName
        self.libraryItems = []
    }
    
    func borrowItem(item: Borrowable) {
        if item.isCheckedOut {
            print("Этот предмет уже выдан!")
        } else {
            item.borrow()
            libraryItems.append(item)
        }
    }
    
    func returnItem(item: Borrowable) {
        if let index = libraryItems.firstIndex(where: { $0 === item }) {
            item.returnBook()
            libraryItems.remove(at: index)
        } else {
            print("Предмет не найден!")
        }
    }
}


let book = Book(title: "1984", author: "Джордж Оруэлл", type: .fiction)
let bookItem = BookItem(catalogID: 1, book: book)

let magazineItem = MagazineItem(catalogID: 2, magazineTitle: "National Geographic")

let reader = Reader(readerName: "Иван")

reader.borrowItem(item: bookItem) // Книга "1984" выдана.
reader.borrowItem(item: magazineItem) // Журнал "National Geographic" выдан.
reader.borrowItem(item: bookItem) // Этот предмет уже выдан.

reader.returnItem(item: bookItem) // Книга "1984" возвращена.



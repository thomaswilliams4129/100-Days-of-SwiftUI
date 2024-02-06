import UIKit

/// Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.
///
/// The Animal class should have a legs integer property that tracks how many legs the animal has.
/// The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
/// The Cat class should have a matching speak() method, again with each subclass printing something different.
/// The Cat class should have an isTame Boolean property, provided using an initializer.
///

// parent class
class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("BARK BARK BARK")
    }
}

// subclasses of dog
class Corgi: Dog {
    override func speak() {
        print("BARKKKK BARKKKK BARKKKK")
    }
}

class Poodle: Dog {
    override func speak() {
        print("BAAAAARK BAAAAARK BAAAAARK")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("MEO MEO MEO")
    }
}

// subclasses of cat
class Persian: Cat {
    override func speak() {
        print("MEOOOO MEOOOO MEOOOO")
    }
}
class Lion: Cat {
    override func speak() {
        print("MEEEEO MEEEEO MEEEEO")
    }
}

let dog = Dog(legs: 4)
dog.speak()

let corgi = Corgi(legs: 3)
corgi.speak()

let cat = Cat(legs: 4, isTame: false)
cat.speak()

let lion = Lion(legs: 3, isTame: true)
lion.speak()






// Make a class hierarchy for animals
// Starting with Animal at the top,
// then Dog and Cat as subclasses,
// then Corgi and Poodle as subclasses of Dog,
// and Persian and Lion as subclasses of Cat.

//  - The Animal class should have a legs integer property that tracks how many legs the animal has.
//  - The Dog class should have a speak() method that prints a generic dog barking string,
//    but each of the subclasses should print something slightly different.
//  - The Cat class should have a matching speak() method, again with each subclass printing something different.
//  - The Cat class should have an isTame Boolean property, provided using an initializer.

class Animal {
  let legs: Int

  init(legs: Int) {
    self.legs = legs
  }
}

class Dog: Animal {
  init() {
    super.init(legs: 4)
  }

  func speak() {
    print("Bark, Bark Bark Bark!")
  }
}

class Corgi: Dog {
  override func speak() {
    print("Bow wow")
  }
}

class Poodle: Dog {
  override func speak() {
    print("Woof woof")
  }
}

class Cat: Animal {
  let isTame: Bool

  init(isTame: Bool) {
    self.isTame = isTame

    super.init(legs: 4)
  }

  func speak() {
    print("Meow!")
  }
}

class Persian: Cat {

  init() {
    super.init(isTame: true)
  }

  override func speak() {
    print("Mew!")
  }
}

class Lion: Cat {

  init() {
    super.init(isTame: false)
  }

  override func speak() {
    print("Rawr XD")
  }
}

let animal = Animal(legs: 4)

let dog = Dog()
let corgi = Corgi()
let poodle = Poodle()

let cat = Cat(isTame: true)
let persian = Persian()
let lion = Lion()

dog.speak()
corgi.speak()
poodle.speak()

cat.speak()
persian.speak()
lion.speak()

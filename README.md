# Restaurants
Restaurants is an iOS application. Built Using MVVM (Model-View-View-Model) and some of Clean Architecture concepts

### Run Requirements

* Xcode 13.2
* Swift 5.5

### Installation

1. Clone the project.
2. install SPM packages

### High Level Layers

#### MVVM Concepts (Presentation Logic)
* **`View`** - delegates user interaction events to the `ViewModel` and displays data passed by the `ViewModel`
* All `UIViewController`, `UIView`, `UICollectionViewCell` subclasses belong to the `View` layer
* Usually the view is passive / dumb - it shouldn't contain any complex logic and that's why most of the times I don't need write Unit Tests for it
* **`ViewModel`** - contains the presentation logic and tells the `View` what to present
* **`DependencyResolver`** - Manage Dependencie

#### Clean Architecture Concepts

##### Application Logic (Core)

* **`UseCase`** - contains the application / business logic for a specific use case in your application
* It is referenced by the `ViewModel`. The `ViewModel` can reference multiple `UseCases` since it's common to have multiple use cases on the same screen
* It manipulates `Entities` and communicates with `Gateways` to retrieve or persist the entities
* It should be covered by Unit Tests
* **`Entity`** - plain `Swift` classes or structs


##### Repository (Gateway) 

* We can implement for instance a `LocalPersistenceGateway` protocol using `CoreData` or `Realm`
* We can implement for instance an `APIRepository` protocol using `URLSession` or `Alamofire`, and that I going to use in the scope of task

# Tinder Clone

**Objective**
- Create a fully functional Tinder clone using MVVM architecture, swipe gestures and Firebase

## Branches - UI

**RootVC**
- Configure folders for MVVM 
- Programmatically set up root vc 

**HomeView**
- Set up nav bar icons and buttons 
- Set up action buttons below cardview

**CardView**
- Create a stack or deck of images 
- Populate first with default images 
- Gradient layer for name readability
- Pan gesture animation gesture animation for swiping


**TODO: code snippet + pan animaition explainatation**

## Features 

**Pan Gesture**

[Setting up pan gesture recognizer]
```swift
    func confugureGestureRecognizer() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        addGestureRecognizer(pan)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleChangePhoto))
        addGestureRecognizer(tap)
    }
```

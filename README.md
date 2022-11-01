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

**CardViewMode & User Model**
- Lays out functionality of reusable card view formatting
- More than one image per card view selection
- User model with attributed text 

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

[Default states of UIPanGestureRecognizer]

```swift

switch sender.state {      
        case .possible:
            // N/A
        case .began:
            print("DEBUG: Pan began")
        case .changed:
            print("DEBUG: Pan changed")  
        case .ended:
            print("DEBUG: Pan ended")
        case .cancelled:
            // N/A
        case .failed:
            // N/A
        default: break
        }
```

[Chop the ones not needed]

```swift
    @objc func handlePanGesture(sender: UIPanGestureRecognizer) {

        switch sender.state {
        case .began:
            print("DEBUG: pan began...")
        case .changed:
            print("DEBUG: Do something!")
        case .ended:
            print("DEBUG: pan ends and then reset")
        default: break
        }
    }
```
[The **shudders** math that makes it possible]


```swift
            let translation = sender.translation(in: nil)
            
            let degrees: CGFloat = translation.x / 20
            let angle = degrees * .pi / 100
            let rotationalTransform = CGAffineTransform(rotationAngle: angle)
            self.transform = rotationalTransform.translatedBy(x: translation.x, y: translation.y)
```

[This assign behavior to the change of card]


```swift
    @objc func handlePanGesture(sender: UIPanGestureRecognizer) {
    
     let translation = sender.translation(in: nil)

        switch sender.state {
        case .began:
            print("DEBUG: pan began...")
        case .changed:
            print("DEBUG: Something is happening")
            let degrees: CGFloat = translation.x / 20
            let angle = degrees * .pi / 100
            let rotationalTransform = CGAffineTransform(rotationAngle: angle)
            self.transform = rotationalTransform.translatedBy(x: translation.x, y: translation.y)
        case .ended:
            print("DEBUG: pan ends and then reset")
        default: break
        }
    }
```

[the card moves but it is pretty whacky looking]

**TODO: Code cleanup and reset function**

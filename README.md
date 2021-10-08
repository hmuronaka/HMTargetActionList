# HMTargetActionList 

HMTargetActionList manages collections of actions and targets. target objects are managed as weak objects.
(This could be legacy style.)

# Require

Swift5

# usage

```Swift
class CustomGestureRecognizer: UIGestureRecognizer {

  private var targetActionList = HMTargetActionList()

  override func addTarget(_ target: Any?, action: Selector) {
    self.targetActionList.addTarget(target as AnyObject, action: action)
  }

  private func fire() {
    let sender = self
    self.targetActionList.fire(sender)
  }
}
```

# LICENSE

MIT

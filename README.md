# HMTargetActionList 

[![Build Status](https://travis-ci.org/hmuronaka/HMTargetActionList.svg)](https://travis-ci.org/hmuronaka/HMTargetActionList)

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

HMTargetActionList manages collections of actions and targets. They are managed as weak objects.

# usage

```obj-c
@property(nonatomic, strong) HMTargetActionListener targetActionList;

-(instancetype)init {
  self = [super init];
  if( self ) {
    self.targetActionList = [HMTargetActionList new];
  }
  return self;
}

-(void)addTarget:(NSObject*)target action:(SEL)action {
  [self.targetActionList addTarget:target action:action];
}

-(void)fire {
  [self.targetActionList fireWithSender:self];
}
```

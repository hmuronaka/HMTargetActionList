PROJECT = "HMTargetActionList.xcodeproj"
SCHEME = "HMTargetActionListApp"
xcodebuild:=xcodebuild -project $(PROJECT) -scheme $(SCHEME) -sdk iphonesimulator -configuration Debug

test: build
	$(xcodebuild) test

build: clean
	$(xcodebuild)

clean:
	$(xcodebuild) clean


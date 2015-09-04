SCHEME = HMTargetActionList
xcodebuild:=xcodebuild -scheme $(SCHEME) -sdk iphonesimulator -configuration Debug

test: build
	$(xcodebuild) test

build: clean
	$(xcodebuild)

clean:
	$(xcodebuild) clean


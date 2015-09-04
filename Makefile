PROJECT = HMTargetActionList.xcodeproj
TEST_TARGET = HMTargetActionListTests

clean:
	xcodebuild -project $(PROJECT) clean

test:
	xcodebuild -project $(PROJECT) -target $(TEST_TARGET) -sdk iphonesimulator -configuration Debug TEST_AFTER_BUILD=YES TEST_HOST=


project:
	./tools/xcodegen/bin/xcodegen generate
	open -a Xcode Jobs.xcodeproj

destination = 'platform=iOS Simulator,OS=14.0,name=iPhone 8'
tests:
	xcodebuild clean test -project Jobs.xcodeproj -scheme Jobs -destination $(destination)

lint:
	./tools/swiftlint/swiftlint

swiftgen:
	./tools/swiftgen/bin/swiftgen
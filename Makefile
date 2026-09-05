.PHONY: build-android deploy-android

build-android:
	cd android && bundle exec fastlane build_release

deploy-android:
	cd android && bundle exec fastlane deploy

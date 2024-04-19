#!/bin/bash

flutter build ios --release
mkdir -p Payload
cp -r build/ios/Release-iphoneos/Runner.app Payload/.
zip Payload.zip Payload/
mv Payload.zip zotero.ipa

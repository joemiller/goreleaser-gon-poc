
goreleaser-gon-poc
==================

An experiment using [goreleaser](https://goreleaser.com/) together with [gon](https://github.com/mitchellh/gon) to enable
macOS codesigning + notarization with a goreleaser workflow.

see thread for more details: https://github.com/goreleaser/goreleaser/issues/1227

To run this yourself, you'd need to do at least the following:

1. Set your Apple Developer ID in env var `AC_USERNAME`
2. Set your Apple Developer ID password in env var `AC_PASSWORD`. This needs to be an app-specific password.
   Info for creating those is here: https://support.apple.com/en-us/HT204397
3. Update `application_identity` in `gon.hcl` to your apple developer ID. This should match what's in your codesigning cert.

`make snapshot`

Issues
------

goreleaser will notarize all binaries including the Windows and Linux binaries. This will succeed but it is probably
pointless and adds considerable time to the build process due to the unpredictability of Apple's notarization API.
Goreleaser would need a way to filter the `gon` signing to specific OS's or build id's.

Troubleshooting
---------------

```
xcrun: error: unable to find utility "altool"
```

This may occur after an upgrade to macOS or Xcode. Running `sudo xcode-select -r` should resolve.

```
You must first sign the relevant contracts online. (1048) (1048)
```

Goto https://developer.apple.com, login, and there might be a banner stating that
the agreements have been updated and you need to re-sign them.

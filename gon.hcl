source = ["./dist/macos_darwin_amd64/goreleaser-gon-poc"]

bundle_id = "me.joemiller.goreleaser-gon-poc"

apple_id {
  // username: set env var AC_USERNAME, or set your email addr here
  password = "@env:AC_PASSWORD"
}

sign {
  application_identity = "Developer ID Application: JOSEPH MILLER (P3MF48HUD7)"
}

dmg {
  volume_name = "goreleaser-gon-poc"
  output_path = "./dist/goreleaser-gon-poc.dmg"
}

// zip {
//   output_path = "terraform.zip"
// }


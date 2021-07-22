resource "null_resource" "foo" {}

data "terraform_remote_state" "test" {
  backend = "remote"
  config = {
    organization = "kroger-digital-kps"
    workspaces = {
      name = "alexs-tfe-test"
    }
  }
}

output "test" {
  value = "hello ${data.terraform_remote_state.test.hello}"
}
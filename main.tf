resource "null_resource" "foo" {}

data "terraform_remote_state" "test" {
    backend = "remote"
    organization = "kroger-digital-kps"
    workspace = "alexs-tfe-test"
}

output "test" {
    value = "hello ${data.terraform_remote_state.test.hello}"
}
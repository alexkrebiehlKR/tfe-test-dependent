resource "null_resource" "foo" {}

data "terraform_remote_state" "test" {
    backend = "remote"
    workspace = "alexs-tfe-test"
}

output "test" {
    value = "hello ${data.terraform_remote_state.test.hello}"
}
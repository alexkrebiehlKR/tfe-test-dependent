variable "remote_ws_name" {}

data "terraform_remote_state" "bootstrap" {
  backend = "remote"

  config = {
    organization = "kap-api-sandbox"
    workspaces = {
      name = var.remote_ws_name
    }
  }
}

resource "local_file" "foo" {
    content     = data.terraform_remote_state.bootstrap.outputs.github_repo_id
    filename = "foo.bar"
}

resource "tfe_workspace" "tfc_workspace_variable" {
  name         = "01-mgmt-tfc-workspace-variable"
  organization = var.org_name
  project_id = var.prj_id
  queue_all_runs = var.queue_all_runs
  auto_apply = var.auto_apply
  auto_apply_run_trigger = var.auto_apply_run_trigger
  remote_state_consumer_ids = []

}

resource "tfe_workspace" "create_hcp_vault_cluster" {
  name         = "02-create-hcp-vault-cluster"
  organization = var.org_name
  project_id = var.prj_id
  queue_all_runs = var.queue_all_runs
  auto_apply = var.auto_apply
  auto_apply_run_trigger = var.auto_apply_run_trigger
  remote_state_consumer_ids = []
  working_directory = "02-create-hcp-vault-cluster"
  trigger_patterns = []

  vcs_repo {
    branch             = "main"
    identifier         = "heinhtethca/vault-dynamic-credential-infra-mgmt-demo"
    oauth_token_id     = tfe_oauth_client.oauth_client.oauth_token_id
  }

}

resource "tfe_oauth_client" "oauth_client" {
  organization     = var.org_name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.oauth_token
  service_provider = "github"
  name = "tfe-workspace"
}


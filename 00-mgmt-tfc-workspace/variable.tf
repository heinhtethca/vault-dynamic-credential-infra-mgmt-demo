variable "org_name" {
    type = string
    default = "heinhtet-hca-org"
  
}

variable "prj_id" {
    type = string
    default = "prj-PK55XoJp3rifXC8c"
  
}

variable "queue_all_runs" {
    type = bool
    default = false
  
}

variable "auto_apply" {
    type = bool
    default = false
}

variable "auto_apply_run_trigger" {
    type = bool
    default = false
  
}

variable "oauth_token" {
    type = string
    default = null
  
}
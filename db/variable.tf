variable "name" {
 description = <<HEREDOC
   The name of the project you want to create.
   HEREDOC
 type        = string
}

variable "teams" {
 description = <<HEREDOC
   The list of teams that belong to the project.
   The roles can be:
   Organization:
       ORG_OWNER
       ORG_MEMBER
       ORG_GROUP_CREATOR
       ORG_BILLING_ADMIN
       ORG_READ_ONLY
   Project:
       GROUP_CLUSTER_MANAGER
       GROUP_DATA_ACCESS_ADMIN
       GROUP_DATA_ACCESS_READ_ONLY
       GROUP_DATA_ACCESS_READ_WRITE
       GROUP_OWNER
       GROUP_READ_ONLY
   HEREDOC
 type = list(object({
   team_id    = string
   role_names = list(string)
 }))
 default = []
}

variable "is_collect_database_specifics_statistics_enabled" {
 description = <<HEREDOC
   If true, Atlas collects and stores database-specific statistics for the specified project.
   HEREDOC
 type        = bool
 default     = true
}

variable "is_data_explorer_enabled" {
 description = <<HEREDOC
   If true, Atlas enables Data Explorer for the specified project.
   HEREDOC
 type        = bool
 default     = false
}

variable "is_extended_storage_sizes_enabled" {
 description = <<HEREDOC
   If true, Atlas enables extended storage sizes for the specified project.
   HEREDOC
 type        = bool
 default     = true
}

variable "is_performance_advisor_enabled" {
 description = <<HEREDOC
   If true, Atlas enables Performance Advisor for the specified project.
   HEREDOC
 type        = bool
 default     = true
}


variable "is_realtime_performance_panel_enabled" {
 description = <<HEREDOC
   If true, Atlas enables the Real Time Performance Panel for the specified project.
   HEREDOC
 type        = bool
 default     = true
}


variable "is_schema_advisor_enabled" {
 description = <<HEREDOC
   If true, Atlas enables Schema Advisor for the specified project.
   HEREDOC
 type        = bool
 default     = true
}


variable "with_default_alerts_settings" {
 description = <<HEREDOC
   If true, Atlas enables default alerts settings for the specified project.
   HEREDOC
 type        = bool
 default     = true
}


variable "limits" {
 description = <<HEREDOC
   Allows one to configure a variety of limits to a Project. The limits attribute is optional.
   https://www.mongodb.com/docs/atlas/reference/api-resources-spec/v2/#tag/Projects/operation/setProjectLimit
   HEREDOC
 type = list(object({
   name  = string
   value = string
 }))


 default = []
}


variable "atlas_public_key" {
 description = <<HEREDOC
   The public key of the Atlas user you want to use to create the project.
   HEREDOC
 type        = string
}


variable "atlas_private_key" {
 description = <<HEREDOC
   The private key of the Atlas user you want to use to create the project.
   HEREDOC
 type        = string
}
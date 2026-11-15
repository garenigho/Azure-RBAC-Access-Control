variable "resource_group_name" {
  description = "Must match Lab 1 exactly - case-sensitive."
  type        = string
  default     = "RG-FileServerLab"
}

variable "vm_name" {
  description = "Must match Lab 1 exactly - case-sensitive."
  type        = string
  default     = "FS01"
}

variable "location" {
  type    = string
  default = "Central US"
}

variable "sysadmin_object_id" {
  description = "Azure AD Object ID for SysAdmin - receives Owner role on FS01."
  type        = string
}

variable "support_user_object_id" {
  description = "Azure AD Object ID for SupportTech - receives VM Contributor role on FS01."
  type        = string
}

variable "auditor_object_id" {
  description = "Azure AD Object ID for Auditor - receives Reader role on FS01."
  type        = string
}
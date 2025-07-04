##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

locals {
  unused_age = try(var.settings.unused_access_age, -1)
}

resource "aws_accessanalyzer_analyzer" "this" {
  count         = var.is_hub || try(var.settings.organization.enabled, false) || try(var.settings.analyzer_enabled, false) ? 1 : 0
  analyzer_name = format("access-analyzer-%s", local.system_name_short)
  type          = try(var.settings.organization.enabled, false) ? "ORGANIZATION" : try(var.settings.analyzer_type, "ACCOUNT")
  dynamic "configuration" {
    for_each = local.unused_age > 0 ? [1] : []
    content {
      unused_access {
        unused_access_age = local.unused_age
      }
    }
  }
  tags = local.all_tags
}

resource "aws_accessanalyzer_archive_rule" "this" {
  for_each      = try(var.settings.archive_rules, {})
  rule_name     = each.key
  analyzer_name = aws_accessanalyzer_analyzer.this[0].analyzer_name
  dynamic "filter" {
    for_each = try(each.value.filters, [])
    content {
      criteria = filter.value.criteria
      contains = try(filter.value.contains, null)
      eq       = try(filter.value.eq, null)
      exists   = try(filter.value.exists, null)
      neq      = try(filter.value.neq, null)
    }
  }
}
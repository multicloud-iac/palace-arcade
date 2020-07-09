output "container_app_url" {
  value = "https://${module.web_app_container.hostname}"
}

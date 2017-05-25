output "load_balancer_url" {
  value = "${layer0_load_balancer.redis.url}"
}

output "load_balancer_id" {
  value = "${layer0_load_balalncer.redis.id}"
}

output "service_id" {
  value = "${layer0_service.redis.id}"
}

output "deploy_id" {
  value = "${layer0_deploy.redis.id}"
}

resource "layer0_load_balancer" "redis" {
  name        = "${var.load_balancer_name}"
  environment = "${var.environment_id}"
  private     = "${var.private}"

  port {
    host_port      = "${var.port}"
    container_port = "${var.port}"
    protocol       = "tcp"
  }

  health_check {
    target = "tcp:6379"
  }
}

resource "layer0_service" "redis" {
  name          = "${var.service_name}"
  environment   = "${var.environment_id}"
  deploy        = "${ var.deploy_id == "" ? format("%s", layer0_deploy.redis.id) : var.deploy_id }"
  load_balancer = "${layer0_load_balancer.redis.id}"
  scale         = "${var.scale}"
  wait          = true
}

resource "layer0_deploy" "redis" {
  name    = "${var.deploy_name}"
  content = "${data.template_file.redis.rendered}"
}

data "template_file" "redis" {
  template = "${file("${path.module}/Dockerrun.aws.json")}"

  vars {
    redis_port = "${var.port}"
  }
}

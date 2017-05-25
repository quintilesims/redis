variable "environment_id" {
    description = "ID of the Layer0 environment to build the service"
}

variable "load_balancer_name" {
    description = "Name of the Layer0 load balancer to create"
    default = "redis"
}

variable "service_name" {
    description = "Name of the Layer0 service to create"
    default = "redis"
}

variable "deploy_name" {
    description = "Name of the Layer0 deploy to create"
    default = "redis"
}

variable "redis_port" {
    description = "Number of the port used for communication with Redis"
    default = 6379
}

variable "deploy_id" {
    description = "(optional) ID of a deploy to use"
    default = ""
}

variable "scale" {
    description = "The scale of the Redis service"
    default = 1
}




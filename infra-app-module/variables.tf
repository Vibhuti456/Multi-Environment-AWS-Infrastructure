variable "env"{
    description = "This is the environment name for my infra-app"
    type = string
}
variable "bucket-name" {
  description = "This is the bucket name for my infra-app"
  type = string
}
variable "hash_key" {
  description = "This is the hash key of dynamodb for my infra-app"
  type = string
}
variable "instance_count" {
  description = "This is the count of ec2-instances for my infra-app"
  type = string
}
variable "instance_type" {
  description = "This is the instance type of ec2-instances for my infra-app"
  type = string
}
variable "ami_id" {
  description = "This is the ami-id of ec2-instances for my infra-app"
  type = string
}
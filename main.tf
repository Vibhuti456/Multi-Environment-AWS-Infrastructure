module "dev-infra"{
    source = "./infra-app-module"
    env = "dev"
    bucket-name = "vdev-bucket"
    instance_count = 1
    instance_type = "t2.micro"
    ami_id = "ami-0d1b5a8c13042c939"
    hash_key = "StudentID"
}

module "stg-infra"{
    source = "./infra-app-module"
    env = "stg"
    bucket-name = "vstg-bucket"
    instance_count = 1
    instance_type = "t2.micro"
    ami_id = "ami-0d1b5a8c13042c939"
    hash_key = "StudentID"
}

module "prd-infra"{
    source = "./infra-app-module"
    env = "prd"
    bucket-name = "vprd-bucket"
    instance_count = 2
    instance_type = "t2.micro"
    ami_id = "ami-0d1b5a8c13042c939"
    hash_key = "StudentID"
}
module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = var.vpc_cidr
  subnet_cidr  = var.subnet_cidr
  project_name = var.project_name
}

module "sg" {
  source       = "./modules/sg"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
  sg_id         = module.sg.sg_id
  project_name  = var.project_name
}
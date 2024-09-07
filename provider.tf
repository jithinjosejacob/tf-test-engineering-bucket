terraform { 
    backend "s3" { 
        key = "terraform/tf-test-engineering-infra/tf-test-engineering-bucket" 
        region = "ap-southeast-2" 
        } 
        
        required_providers { 
            aws = { 
                source = "hashicorp/aws" 
                version = "4.48.0" 
            } 
        } 
    required_version = ">= 0.13" 
} 
        
provider "aws" { 
    region = "ap-southeast-2" 
}
variable "account_id_identity" { 
    description = "The account id of the identity account. This is passed in from the environment" 
} 

variable "account_id_dev" { 
    description = "The development account id the buildkite agent resides in" 
    default = 889594443949 
} 

variable "account_id_stg" { 
    description = "The staging account id the buildkite agent resides in" 
    default = 778084448154 
} 

variable "account_id_prd" { 
    description = "The production account the buildkite agent resides in"
     default = 51944417464 
} 
     
variable "env" { 
    description = "Test environment this bucket will reside in" 
} 

variable "account_number" { 
    description = "value of the account number" 
} 

variable "tags" { 
    description = "Default tags for all resources" 
    type = map(any) 
    default = { 
        "testBoundary" = "testengineering" 
        "testTeam" = "test-engineering" 
        "owner" = "test-engineering" 
        "system" = "sauce-ui-automation" 
        "source" = "sauce-ui-automation" 
        "testArtefact" = "sauce-ui-automation" 
        "testTaggingVersion" = "3.0.0" 
        } 
}
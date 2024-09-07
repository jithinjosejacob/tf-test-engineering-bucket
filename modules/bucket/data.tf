data "aws_iam_policy_document" "aws_s3_bucket_ownership_controls_sauce_ui_automation" { 
    statement { 
        sid = "S3 Bucket Ownership Controls" 
        effect = "Allow" 
        principals { 
            type = "AWS" 
            identifiers = [ 
            "arn:aws:iam::${var.account_id_dev}:role/k8s/testengineering/sauceUIAutomationRole", 
            "arn:aws:iam::${var.account_id_dev}:role/TestEngineeringDevAdmin", 
            "arn:aws:iam::${var.account_id_stg}:role/TestEngineeringBreakGlass", 
            "arn:aws:iam::${var.account_id_prd}:role/TestEngineeringBreakGlass", 
            ] 
        } 
        actions = [ 
            "s3:*", 
        ] 
        resources = [ 
            "arn:aws:s3:::testengineering-sauce-ui-automation-${var.account_number}", 
            "arn:aws:s3:::testengineering-sauce-ui-automation-${var.account_number}/*" 
        ] 
    }
}
        
data "aws_kms_key" "default_key" { 
    key_id = "alias/testengineering-automation-key"
}
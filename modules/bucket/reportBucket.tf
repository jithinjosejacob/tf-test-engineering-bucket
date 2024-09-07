resource "aws_s3_bucket" "testengineering-sauce-ui-automation-bucket" { 
    bucket = "testengineering-sauce-ui-automation-${var.account_number}" 
    tags = var.tags
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_sauce" { 
    bucket = aws_s3_bucket.testengineering-sauce-ui-automation-bucket.id 
    rule { 
        id = "log" 
        expiration { 
            days = "90" 
            } 
        status = "Enabled" 
        }
    }

resource "aws_s3_bucket_versioning" "versioning_sauce" { 
    bucket = aws_s3_bucket.testengineering-sauce-ui-automation-bucket.id 
    versioning_configuration { 
        status = "Disabled" 
    }
}

resource "aws_s3_bucket_public_access_block" "public_access_block_sauce" { 
    bucket = aws_s3_bucket.testengineering-sauce-ui-automation-bucket.id 
    block_public_acls = true 
    block_public_policy = true 
    restrict_public_buckets = true 
    ignore_public_acls = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "server_side_encryption_sauce" { 
    bucket = aws_s3_bucket.testengineering-sauce-ui-automation-bucket.id 
    rule { 
        apply_server_side_encryption_by_default { 
            kms_master_key_id = data.aws_kms_key.default_key.key_id 
            sse_algorithm = "aws:kms"
            } 
        }
    }
resource "aws_s3_bucket_ownership_controls" "bucket_ownership_control_sauce" { 
    bucket = aws_s3_bucket.testengineering-sauce-ui-automation-bucket.id 
    rule { 
        object_ownership = "BucketOwnerEnforced" 
        }
}
    
resource "aws_s3_bucket_policy" "aws_s3_bucket_ownership_controls_sauce" { 
    bucket = aws_s3_bucket.testengineering-sauce-ui-automation-bucket.id 
    policy = data.aws_iam_policy_document.aws_s3_bucket_ownership_controls_sauce_ui_automation.json
}
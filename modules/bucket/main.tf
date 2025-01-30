resource "aws_s3_bucket" "default" {
  force_destroy = var.force_destroy

  bucket = "${local.prefix}-bucket"

  tags = merge(var.additional_tags, {
    Name = "${local.prefix}-bucket"
  })
}


resource "aws_s3_bucket_policy" "local_access" {
  bucket = aws_s3_bucket.default.id
  policy = data.aws_iam_policy_document.local_access.json
}

data "aws_iam_policy_document" "local_access" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["ADICIONAR Account ID"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      aws_s3_bucket.default.arn,
      "${aws_s3_bucket.default.arn}/*",
    ]
  }
}
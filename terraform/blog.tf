resource "aws_amplify_app" "blog" {
  name       = "blog"
  repository = "https://github.com/tarikdem/blog"

  custom_rule {
    source = "/<*>"
    status = "404-200"
    target = "/index.html"
  }

  environment_variables = {
    _LIVE_UPDATES = jsonencode([
      {
        pkg     = "hugo"
        type    = "hugo"
        version = "latest"
      },
    ])
  }
}

resource "aws_amplify_branch" "master" {
  app_id      = aws_amplify_app.blog.id
  branch_name = "master"

  framework = "Web"
  stage     = "PRODUCTION"
}

resource "aws_amplify_domain_association" "tova_sh" {
  app_id      = aws_amplify_app.blog.id
  domain_name = "tova.sh"

  wait_for_verification = false

  # https://blog.tova.sh
  sub_domain {
    branch_name = aws_amplify_branch.master.branch_name
    prefix      = "blog"
  }
}

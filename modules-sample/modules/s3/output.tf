/*
can exists n output vars, this is needed so that other modules can access this vars.

output "output_var_name" {
  # consider de following declaration: resource "aws_alb_target_group" "aws_tg" { ... }
  # this output declaration will be export arn atribute from the aws_alb_target_group resource named aws_tg
  # seealso https://www.terraform.io/docs/providers/aws/r/lb_target_group.html#arn
  value = aws_alb_target_group.aws_tg.arn
}

output "other_output_var_name" {
  value = path_to_value
}
*/
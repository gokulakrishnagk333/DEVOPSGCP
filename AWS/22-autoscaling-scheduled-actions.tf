## Create Scheduled Actions
### Create Scheduled Action-1: Increase capacity during business hours
resource "aws_autoscaling_schedule" "increase_capacity_7am" {
  scheduled_action_name  = "increase-capacity-7am"
  min_size               = 2
  max_size               = 4
  desired_capacity       = 2
  start_time             = "2030-03-30T11:00:00Z" # Time should be provided in UTC Timezone (6AM UTC = 8AM CET)
  recurrence             = "00 06 * * 1-5"
  autoscaling_group_name = aws_autoscaling_group.my_asg.id 
}
### Create Scheduled Action-2: Decrease capacity during business hours
resource "aws_autoscaling_schedule" "decrease_capacity_5pm" {
  scheduled_action_name  = "decrease-capacity-5pm"
  min_size               = 0
  max_size               = 2
  desired_capacity       = 0
  start_time             = "2030-03-30T21:00:00Z" # Time should be provided in UTC Timezone (4PM UTC = 6PM CET)
  recurrence             = "00 16 * * 1-5"
  autoscaling_group_name = aws_autoscaling_group.my_asg.id
}



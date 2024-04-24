START_STATUS=$(aws ec2 describe-instances --filters  "Name=instance-state-name,Values=running" "Name=tag-value,Values=rady" | grep running | cut -d : -f 2 | awk '{$1=$1};1')
STOPPED_STATUS=$(aws ec2 describe-instances --filters  "Name=instance-state-name,Values=stopped" "Name=tag-value,Values=rady" | grep stopped |  cut -d : -f 2)
 
# if [ $STATUS = "available" ]    
# then
#         aws rds stop-db-instance --db-instance-identifier jrs-db #ec2 describe-tags --filters "Name=resource-type,Values=instance" "Name=key,Values=Name" "Name=value,Values=testec2" | grep ResourceId | cut -d : -f 2 | grep -o '".*"' | sed 's/"//g' | awk '{ print "aws ec2 start-instances --instance-ids " $0 }' | /bin/bash      
 
# else
#         aws rds start-db-instance --db-instance-identifier jrs-db #:
# fi
 
if [[ $START_STATUS == "running" ]]
then
          aws ec2 describe-tags --filters "Name=resource-type,Values=instance" "Name=key,Values=owner" "Name=value,Values=rady" | grep ResourceId | cut -d : -f 2 | awk '{ print "aws ec2 stop-instances --instance-ids " $0 }' | /bin/bash      
 
else    
          aws ec2 describe-tags --filters "Name=resource-type,Values=instance" "Name=key,Values=owner" "Name=value,Values=rady" | grep ResourceId | cut -d : -f 2 | awk '{ print "aws ec2 start-instances --instance-ids " $0 }' | /bin/bash
 
 
fi

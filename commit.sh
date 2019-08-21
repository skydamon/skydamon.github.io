#ssh agent
ssh-add -t 30s

#网站内容commit，push
echo "\n--------commit and push to site repository--------"
git reset HEAD^
git add .
message=`date '+%Y-%m-%d %H:%M:%S'`
message="Site update $message"
git commit -m "$message"
git push origin --force
echo "\n--------trigger updating of Nginx-----------------"
python3 ../triggerUpdating.py
